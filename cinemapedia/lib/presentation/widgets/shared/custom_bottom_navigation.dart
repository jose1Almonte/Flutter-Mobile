import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  final StatefulNavigationShell currentChild;
  
  const CustomBottomNavigation({super.key, required this.currentChild});

  // void onItemTap(BuildContext context, int index){
  //   switch(index){
  //     case 0:
  //       context.go('/');
  //       return;
  //     case 1:
  //       context.go('/');
  //       return;
  //     case 2:
  //       context.go('/favorites');
  //       return;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentChild.currentIndex,
      elevation: 0,
      onTap: (value) => currentChild.goBranch(value),
      
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Inicio'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categorias'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos'
        ),
      ]
    );
  }
}