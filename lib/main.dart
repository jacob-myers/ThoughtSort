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
      debugShowCheckedModeBanner: false,

      // Pulls styling from styles.dart.
      theme: ThemeData(
        primarySwatch: Colors.grey,
        colorScheme: CustomStyle.pageScheme,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
      ),

      home: const ThoughtSortHome(title: 'ThoughtSort'),
    );
  }
}


