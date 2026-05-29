import 'package:animate_do/animate_do.dart';
import 'package:animate_do_app/presentation/provider/animate_do_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class TwitterPage extends StatelessWidget {
  const TwitterPage({super.key});

  @override
  Widget build(BuildContext context) {

    final animateDoProvider = context.watch<AnimateDoProvider>();
    

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: (){
          animateDoProvider.becomeTwitterTrue();
          // print(isAnimated);
        },
        child: FaIcon(FontAwesomeIcons.play),

      ),
      backgroundColor: Color(0xff1da1f2),
      body: Center(
        child: ZoomOut(
          animate: animateDoProvider.twitterIsAnimated,
          from: 30,
          duration: Duration(seconds: 1),
          child: FaIcon(FontAwesomeIcons.twitter, color: Colors.white, size: 40,)
        ),
      ),
    );
  }
}