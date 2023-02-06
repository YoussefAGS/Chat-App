import 'package:chat/base.dart';

import 'package:chat/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/my_provider.dart';
import '../create-accoout/creataccount.dart';
import '../home/home_screen.dart';
import 'login-navigator.dart';
import 'login-view-model.dart';

class LoginView extends StatefulWidget {
  static const String routeName = 'Login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseView<LoginView, LoginViewModel>
    implements LoginNavigator {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  LoginViewModel initViewModel() {
    return LoginViewModel();
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/main-background.png'),
                fit: BoxFit.cover)),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (value) {
                      if (value!.trim() == "") {
                        return "Please enter email";
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blueAccent)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blueAccent)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,

                    controller: passwordController,
                    validator: (value) {
                      if (value!.trim() == "") {
                        return "Please enter password";
                      }

                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blueAccent)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blueAccent)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ValidatFoem();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Login',
                            ),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      )
                  ),
                  TextButton(onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, CreateAccount.routeName);
                  }, child: Text("Don't Have an account?", style: TextStyle(
                      color: Colors.blueAccent
                  ),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void goToHome(MyUser myUser) {
    var provider = Provider.of<MyProvider>(context,listen: false);
    Navigator.pushReplacementNamed(context, HomeScreen.routName);
  }

  void ValidatFoem() {
    if (formkey.currentState!.validate()) {
      viewModel.loginWithFirbaseAuth(
          emailController.text, passwordController.text);
    }
  }
}


