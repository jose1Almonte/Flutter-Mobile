import 'package:flutter/material.dart';
import 'package:yes_no_app_try_2/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 3).theme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
          centerTitle: true,
        ),
        body: Center(
          child: FilledButton.tonal(
            onPressed: (){}, 
            child: const Text("Click me")
          ),
        ),
      ),
    );
  }
}