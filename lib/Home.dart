
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TestMode'),
        ),
        body: const MaterialApp(
          title: 'Agora Video Calling',
          debugShowCheckedModeBanner: false,
        ));
  }
}
