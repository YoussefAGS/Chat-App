
import 'package:chat/models/message.dart';
import 'package:chat/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MessageWidget extends StatelessWidget {
  Message message;
  MessageWidget(this.message);

  @override
  Widget build(BuildContext context) {

    var provider= Provider.of<MyProvider>(context);
    return provider.myUser!.id==message.senderId?SenderMessage(message):ReciverMessage(message);
  }
}
class SenderMessage extends StatelessWidget {
  Message message;
  SenderMessage(this.message);
  @override
  Widget build(BuildContext context) {
    var t=DateTime.fromMillisecondsSinceEpoch(message.dateTime);
    var date=DateFormat('MM/dd/yyy, hh:mm a').format(t);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
                bottomLeft:Radius.circular(12),
              )
            ),
            child: Text(message.content,style: TextStyle(
              color: Colors.white
            ),),
          ),
          Text(date.substring(12),
            textAlign: TextAlign.end,
            style: TextStyle(
                color: Colors.grey
            ),
          )
        ],
      ),
    );
  }
}
class ReciverMessage extends StatelessWidget {
  Message message;


  ReciverMessage(this.message);
  @override
  Widget build(BuildContext context) {
    var t=DateTime.fromMillisecondsSinceEpoch(message.dateTime);
    var date=DateFormat('MM/dd/yyy, hh:mm a').format(t);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message.senderName,style: TextStyle(color: Colors.black),textAlign: TextAlign.start,),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                  bottomLeft:Radius.circular(12),
                )
            ),
            child: Text(message.content,style: TextStyle(
              color: Colors.white
            ),),
          ),
          Text(date.substring(12),
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Colors.grey
            ),
          )
        ],
      ),
    );
  }
}
