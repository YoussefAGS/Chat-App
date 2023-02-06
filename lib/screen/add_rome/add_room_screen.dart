import 'package:chat/base.dart';
import 'package:chat/models/category.dart';
import 'package:chat/screen/add_rome/add_rome_view-model.dart';
import 'package:chat/screen/add_rome/add_room_navigator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRoomScreen extends StatefulWidget {
  static const String routeName = "AddRoomScreen";


  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends BaseView<AddRoomScreen, AddRoomViewModel>
    implements AddRoomNavigator {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();
  var categorise=RoomCategory.getCategory();
  late RoomCategory  selectedCategory;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
    selectedCategory=categorise[0];
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
              'Title',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Card(
              elevation: 10,
              margin: EdgeInsets.all(20),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.transparent)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 20),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Create New Room",
                        style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,),
                      Image.asset('assets/images/group-1824146_1280.png'),

                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: titleController,
                        validator: (value) {
                          if (value!.trim() == "") {
                            return "Please enter room title";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'title',
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
                      DropdownButton<RoomCategory>(
                        value: selectedCategory,
                          items: categorise.map((c) =>DropdownMenuItem<RoomCategory>(
                            value: c,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(c.image),
                              
                              Text(c.name),
                            ],
                          ))).toList(),
                          onChanged: (category){
                            if(category==null)return;
                            selectedCategory=category;

                            setState(() {

                            });

                          }
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(

                        controller: descriptionController,
                        validator: (value) {
                          if (value!.trim() == "") {
                            return "Please enter description";
                          }

                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: 'description',
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
                            child:  Text(
                              'Create Room',
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  void ValidatFoem() {
    if (formkey.currentState!.validate()) {
      viewModel.addRoomToDB(titleController.text, descriptionController.text,selectedCategory.id);
setState(() {

});
    }
  }

  @override
  AddRoomViewModel initViewModel() {
    return AddRoomViewModel();
  }

  @override
  goToHome() {
    Navigator.pop(context);
  }
}
