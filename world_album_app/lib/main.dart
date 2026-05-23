import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_album_app/presentation/providers/album_provider.dart';
import 'package:world_album_app/presentation/screens/album_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AlbumProvider(),)],
      child: MaterialApp(
        title: 'World Album',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('World Album'),
            centerTitle: true,
          ),
          body: const Center(
            child: AlbumScreen(),
          ),
        ),
      ),
    );
  }
}