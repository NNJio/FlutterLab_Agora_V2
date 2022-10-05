import 'package:agora/pip_view.dart';
import 'package:flutter/material.dart';

import 'chat.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agora Video Calling',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      // builder: (_, child) => _Unfocus(child: child!),
      home: const ChatScreen(),
      // home: HomeScreen(),
      
    );
  }
}

// class _Unfocus extends StatelessWidget {
//   const _Unfocus({Key? key, required this.child}) : super(key: key);
//   final Widget child;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//       child: child,
//     );
//   }
// }
