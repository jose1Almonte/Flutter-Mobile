import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://prod-img.belfasttelegraph.co.uk/public/incoming/5wxtzs-jennifer-aniston/alternates/ONE_ONE_256/jennifer%20Aniston'),
          ),
        ),
        title: Text('Mi amor ❤️'),
      ),
    );
  }
}