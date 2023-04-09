import 'package:flutter/material.dart';

class chat_bot_page extends StatefulWidget {
  const chat_bot_page({Key? key}) : super(key: key);

  @override
  State<chat_bot_page> createState() => _chat_bot_pageState();
}

class _chat_bot_pageState extends State<chat_bot_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("chat bot page"),
      ),
    );
  }
}
