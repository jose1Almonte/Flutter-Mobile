import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final StatefulNavigationShell childView;
  const HomeScreen({super.key, required this.childView});




  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final isMovieDetailsRouter = location.contains('/movie/');
  
    return Scaffold(
      body: childView,
      bottomNavigationBar: isMovieDetailsRouter ? null : FadeIn(child: CustomBottomNavigation(currentChild: childView,)),
    );
  }
}

