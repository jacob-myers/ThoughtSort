import 'package:flutter/material.dart';
import 'styles.dart';
import 'pages/home.dart';
import 'trie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      // Pulls styling from styles.dart.
      theme: ThemeData(
        primarySwatch: Colors.grey,
        colorScheme: CustomStyle.pageScheme,
        appBarTheme: CustomStyle.appBarTheme,
      ),

      home: const ThoughtSortHome(title: 'ThoughtSort'),
    );
  }
}


