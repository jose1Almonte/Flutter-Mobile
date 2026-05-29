import 'package:animate_do_app/presentation/provider/animate_do_provider.dart';
import 'package:animate_do_app/src/pages/navegacion_page.dart';
import 'package:animate_do_app/src/pages/pagina1_page.dart';
import 'package:animate_do_app/src/pages/twitter_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AnimateDoProvider(),),
      ],
      child: MaterialApp(
        // title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          
          body: const Center(
            child: Pagina1Page()
            // child: TwitterPage()
          ),
        ),
      ),
    );
  }
}