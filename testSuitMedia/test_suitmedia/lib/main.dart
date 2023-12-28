import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_suitmedia/view/first_screen.dart';
import 'package:test_suitmedia/view/viewmodels/thirdscreen_viewmodels.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThirdScreenProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}
