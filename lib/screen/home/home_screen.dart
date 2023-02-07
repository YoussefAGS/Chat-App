import 'package:chat/base.dart';
import 'package:chat/screen/add_rome/add_room_screen.dart';
import 'package:chat/screen/home/room_widgit.dart';
import 'package:chat/screen/login/login-view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../database_utils/database_Utils.dart';
import '../../models/Room.dart';
import 'home_navigator.dart';
import 'home_view_model.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen, HomeViewModel>
    implements HomeNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
    viewModel.readRooms();

  }

  @override
  Widget build(BuildContext context) {
    viewModel.readRooms();
    setState(() {

    });
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
            title: Text("ChatApp"),
            actions: [
              IconButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacementNamed(context, LoginView.routeName);
                  },
                  icon: Icon(Icons.logout))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.pushNamed(context, AddRoomScreen.routeName);
            },
            child: Icon(Icons.add,color: Colors.white,),
          ),
          body: FutureBuilder<QuerySnapshot<Room>>(
              future: DatabaseUtils.readRoomFormFirebase2(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Text('something wrong');
                }
                List<Room> rooms =
                    snapshot.data?.docs.map((task) => task.data()).toList() ?? [];

                return GridView.builder(
                    itemCount:rooms.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) =>RoomWidget(rooms[index])
                );
              }),
        ),
      ),
    );
  }

  @override
  HomeViewModel initViewModel() {
    return HomeViewModel();
  }
}

