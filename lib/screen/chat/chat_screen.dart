import 'package:chat/base.dart';
import 'package:chat/models/message.dart';
import 'package:chat/provider/my_provider.dart';
import 'package:chat/screen/chat/chat-navigator.dart';
import 'package:chat/screen/chat/chat_view_model.dart';
import 'package:chat/screen/chat/message_widgit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/Room.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = 'ChatScreen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends BaseView<ChatScreen,ChatViewModel>
    implements ChatNavigator {
  var messagecontroller=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator=this;
  }
  @override
  Widget build(BuildContext context) {
    var room=ModalRoute.of(context)!.settings.arguments as Room;
    var provider=Provider.of<MyProvider>(context);
    viewModel.room=room;
    viewModel.myUser=provider.myUser!;
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Stack(
        children: [
          Image.asset('assets/images/main-background.png',fit: BoxFit.fill,width: double.infinity,),
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text("${room.title}"),
            ),
            body: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(12),
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
                children: [
                  Expanded(
                      child:StreamBuilder<QuerySnapshot<Message>>(
                          stream: viewModel.getMessage(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }
                            if (snapshot.hasError) {
                              return Text('something wrong');
                            }
                            List<Message> messages =
                                snapshot.data?.docs.map((task) => task.data()).toList() ?? [];

                            return ListView.builder(
                              itemCount: messages.length,
                              itemBuilder: (d, index) {
                                return MessageWidget(messages[index]);

                              },
                            );
                          }),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: messagecontroller,
                          decoration: InputDecoration(
                            hintText: 'teyp a message',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12)
                              ),
                              borderSide: BorderSide(
                                color: Colors.blueAccent
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12)
                              ),
                              borderSide: BorderSide(
                                  color: Colors.blueAccent
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      InkWell(
                        onTap: (){
                          viewModel.sendMessage(messagecontroller.text);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Text('Send',style: TextStyle(
                                color: Colors.white
                              ),),
                              Icon(Icons.send,color: Colors.white,),
                            ],
                          ),
                        ),
                      )
                    ],
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  ChatViewModel initViewModel() {
    return ChatViewModel();
  }

  @override
  UploadMessagetoFirsore() {
   messagecontroller.clear();
   setState(() {

   });
  }
}
