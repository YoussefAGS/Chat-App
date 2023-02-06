import 'package:chat/provider/my_provider.dart';
import 'package:chat/screen/add_rome/add_room_screen.dart';
import 'package:chat/screen/chat/chat_screen.dart';
import 'package:chat/screen/create-accoout/creataccount.dart';
import 'package:chat/screen/home/home_screen.dart';
import 'package:chat/screen/login/login-view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      ChangeNotifierProvider(
      create:(context) => MyProvider(),
      child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      initialRoute: provider.firebaseUser != null
          ? HomeScreen.routName
          : LoginView.routeName,
      routes: {
        LoginView.routeName: (c) => LoginView(),
        CreateAccount.routeName: (context) => CreateAccount(),
        HomeScreen.routName: (context) => HomeScreen(),
        AddRoomScreen.routeName:(context)=>AddRoomScreen(),
        ChatScreen.routeName:(context)=>ChatScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
