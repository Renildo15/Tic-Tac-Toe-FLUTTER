// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:jogo_da_velha/core/constants.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function onPressed;

  const CustomDialog({
    this.title = '',
    this.message = '',
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        FlatButton(
          child: Text(RESET_BUTTON_LABEL),
          onPressed: () {
            Navigator.pop(context);
            onPressed();
          },
        ),
      ],
    );
  }
}