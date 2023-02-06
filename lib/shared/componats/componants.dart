import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showloding(BuildContext context, String masseage) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Row(
          children: [
            Text(masseage),
            SizedBox(
              width: 10,
            ),
            CircularProgressIndicator(),
          ],
        ),
      );
    },
  );
}
void hideloding(BuildContext context){
  Navigator.pop(context);
}
void showmassage(BuildContext context, String masseage,String postem,String description,VoidCallback voidCallback){
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      List<Widget>Actions=[ TextButton(onPressed: voidCallback, child: Text(postem))
      ];
      return AlertDialog(
        title: Text(masseage),
        content: Text(description),
        actions: [
          TextButton(onPressed: voidCallback, child: Text(postem))

        ],
      );
    },
  );
}
