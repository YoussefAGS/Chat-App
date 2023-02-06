
import 'package:flutter/material.dart';

abstract class BaseNavigator {
  showLoading();

  hideLoading();

  showMessage(String message);
}

class BaseViewModel<NAV extends BaseNavigator> extends ChangeNotifier{
   NAV? navigator=null;

}

abstract class BaseView<T extends StatefulWidget, VM extends BaseViewModel>extends State<T> implements BaseNavigator{
  late VM viewModel;

  VM initViewModel();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel=initViewModel();
  }
  @override
  hideLoading() {
    Navigator.pop(context);
  }

  @override
  showLoading() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(child: CircularProgressIndicator()),
        )
    );
  }

  @override
  showMessage(String message) {
    showDialog(context: context, builder: (context) => AlertDialog(
      content: Text(message),
    ),);
  }




}
