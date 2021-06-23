import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Mail extends StatefulWidget {
  @override
  _MailState createState() => _MailState();
}

class _MailState extends State<Mail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text('Mail'),
    );
  }
}