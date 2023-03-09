import 'package:flutter/material.dart';
import 'styles.dart';
import 'pages/home.dart';
import 'trie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode currentTheme = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Pulls styling from styles.dart.
      theme: ThemeData(
        primarySwatch: Colors.grey,
        colorScheme: CustomStyle.pageSchemeLight,
        appBarTheme: CustomStyle.appBarThemeLight,
      ),

      darkTheme: ThemeData(
        primarySwatch: Colors.grey,
        colorScheme: CustomStyle.pageScheme,
        appBarTheme: CustomStyle.appBarTheme,
      ),

      themeMode: currentTheme,

      home: ThoughtSortHome(
        title: 'ThoughtSort',
        toggleTheme: _toggleTheme,
      ),
    );
  }

  void _toggleTheme() {
    setState(() {
      currentTheme = currentTheme == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
    });
  }
}


