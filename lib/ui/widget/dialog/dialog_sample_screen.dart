import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../component/dialog_open_button.dart';

class DialogSampleScreen extends StatelessWidget {
  const DialogSampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DialogOpenButton(
            openDialog: () => alertDialog(context),
            btnName: 'Normal Dialog',
          ),
          DialogOpenButton(
            openDialog: () => cupertinoDialog(context),
            btnName: 'Cupertino Dialog',
          ),
        ],
      ),
    );
  }


  alertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('AlertDialog Title'),
            content: const Text('Sample AlertDialog'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Alert Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'Alert OK'),
                child: const Text('OK'),
              ),
            ],
          );
        }).then((value) => showSnackBar(context, value));
  }

  cupertinoDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('CupertinoAlertDialog Title'),
            content: const Text('Sample CupertinoAlertDialog'),
            actions: [
              CupertinoButton(
                onPressed: () => Navigator.pop(context, 'Cupertino Cancel'),
                child: const Text('Cancel'),
              ),
              CupertinoButton(
                onPressed: () => Navigator.pop(context, 'Cupertino OK'),
                child: const Text('OK'),
              ),
            ],
          );
        }).then((value) => showSnackBar(context, value));
  }

  showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

}
