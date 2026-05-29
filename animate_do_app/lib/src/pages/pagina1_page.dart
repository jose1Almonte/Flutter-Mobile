import 'package:animate_do/animate_do.dart';
import 'package:animate_do_app/src/pages/navegacion_page.dart';
import 'package:animate_do_app/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animate Do'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TwitterPage(),));
              }, 
              icon: FaIcon(FontAwesomeIcons.twitter)
            ),
            IconButton(
              onPressed: (){
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => Pagina1Page(),));
              }, 
              icon: Icon(Icons.navigate_next)
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => NavegacionPage(),));
          }, 
          child: FaIcon(FontAwesomeIcons.play),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElasticIn(delay: Duration(milliseconds: 1100), child: Icon(Icons.new_releases, color: Colors.blue,size: 40,)),
              FadeInDown(delay: Duration(milliseconds: 200),child: Text('Titulo', style: TextStyle(fontSize: 40,fontWeight: FontWeight(200)),)),
              FadeInDown(delay: Duration(milliseconds: 800),child: Text('Soy un texto pequeno', style: TextStyle(fontSize: 20,fontWeight: FontWeight(400)),)),
              FadeInLeft(
                delay: Duration(milliseconds: 1100),
                child: Container(
                  width: 200,
                  height: 2,
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),
    );
  }
}