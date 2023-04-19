import 'package:flutter/material.dart';

class MyTitle extends StatefulWidget {
  const MyTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyTitle> createState() => _TitleState();
}

class _TitleState extends State<MyTitle> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.title);
  }
}
