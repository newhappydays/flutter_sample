import 'package:flutter/material.dart';

class DialogOpenButton extends StatelessWidget {
  final VoidCallback openDialog;
  final String btnName;

  const DialogOpenButton({
    Key? key,
    required this.openDialog,
    required this.btnName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: openDialog,
        child: Text(
          btnName,
        ),
      ),
    );
  }
}