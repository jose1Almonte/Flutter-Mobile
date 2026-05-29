import 'package:animate_do/animate_do.dart';
import 'package:animate_do_app/presentation/provider/animate_do_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  const NavegacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final animateDoProvider = context.watch<AnimateDoProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Notifications Page'),
        centerTitle: true,
      ),
      floatingActionButton: BotonFlotante(animateDoProvider: animateDoProvider,),

      bottomNavigationBar: BottomNavigation(animateDoProvider: animateDoProvider,),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  final AnimateDoProvider animateDoProvider;
  const BottomNavigation({super.key, required this.animateDoProvider});

  @override
  Widget build(BuildContext context) {
    

    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(label: 'Bones', icon: FaIcon(FontAwesomeIcons.bone)),
        BottomNavigationBarItem(
          label: 'Notifications', 
          icon: Stack(
            children: [
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0,
                right: 0,
                // child: Icon(Icons.brightness_1, size: 8,color: Colors.pink,)
                child: BounceInDown(
                  from: 10,
                  animate: (animateDoProvider.number > 0) ? true : false,
                  child: Bounce(
                    from: 10,
                    controller: (controller) => animateDoProvider.animateController(controller),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle
                      ),
                      alignment: Alignment.center,
                      child: Text('${animateDoProvider.number}', style: TextStyle(color: Colors.white, fontSize: 7, fontWeight: FontWeight(1000)),),
                    ),
                  ),
                )
              )
            ],
          )
        ),
        BottomNavigationBarItem(label: 'My dog', icon: FaIcon(FontAwesomeIcons.dog)),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.pink,

      );
  }
}

class BotonFlotante extends StatelessWidget {

  final AnimateDoProvider animateDoProvider;

  const BotonFlotante({super.key, required this.animateDoProvider});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        animateDoProvider.addNumber();
      },
      backgroundColor: Colors.pink,
      child: FaIcon(FontAwesomeIcons.play),
    );
  }
}