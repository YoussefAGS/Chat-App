
import 'package:chat/screen/chat/chat_screen.dart';
import 'package:flutter/material.dart';

import '../../models/Room.dart';

class RoomWidget extends StatelessWidget {
  Room room;
  RoomWidget(this.room);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ChatScreen.routeName,arguments: room);
      },
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/${room.category}.png',height: 100,),
            Center(child:
            Text(
              room.title,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black
              ),
            )
            )
          ],
        ),
      ),
    );
  }
}
