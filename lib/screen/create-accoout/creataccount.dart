
import 'package:chat/screen/create-accoout/create-accout=view-model.dart';
import 'package:chat/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base.dart';
import '../../models/user.dart';
import '../../provider/my_provider.dart';
import 'create-account-navigator.dart';

class CreateAccount extends StatefulWidget {
  static const String routeName = 'CreateAccount';

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends BaseView<CreateAccount,CreateAccountViewModel> implements CreateAccountNavigator{
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  var emailController=TextEditingController();

  var passwordController=TextEditingController();
  var firstNameController=TextEditingController();

  var userNameController=TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator=this;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (context)=>viewModel,
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
              'Create Account',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: firstNameController,
                    validator: (value){
                      if(value!.trim()==""){
                        return "Please enter your Name";
                      }
                      return null;

                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'First Name',
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
                    controller: userNameController,
                    validator: (value){
                      if(value!.trim()==""){
                        return "Please enter User Name";
                      }

                      return null;

                    },
                    textInputAction: TextInputAction.next,

                    decoration: InputDecoration(
                      hintText: 'User Name',
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
                    keyboardType: TextInputType.emailAddress,

                    controller: emailController,
                    validator: (value){
                      if(value!.trim()==""){
                        return "Please enter Your Email";
                      }
                      final bool emailValid =
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if(!emailValid){
                        return "Please Enter a valid email";


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
                    controller: passwordController,
                    validator: (value){
                      if(value!.trim()==""){
                        return "Please enter password";
                      }
                      else if(value.length<8){
                        return "password must be greater than 8";

                      }
                      return null;

                    },
                    textInputAction: TextInputAction.next,

                    obscureText: true,
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
                    height: height * 0.05,
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
                              'Create Account',
                            ),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ValidatFoem()async{
    if(formkey.currentState!.validate()){
      viewModel.CreateAccountWithFirbaseAuth(emailController.text, passwordController.text,firstNameController.text,userNameController.text);
    }
  }


  @override
  CreateAccountViewModel initViewModel() {
    return CreateAccountViewModel();
  }
@override
  void goToHome(MyUser myUser) {
  var provider = Provider.of<MyProvider>(context,listen: false);
  Navigator.pushReplacementNamed(context, HomeScreen.routName);
  }
}
