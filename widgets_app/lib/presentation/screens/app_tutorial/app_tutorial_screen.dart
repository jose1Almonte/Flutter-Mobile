import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final slides = <SlideInfo>[
  SlideInfo(title: "Busca la comida", caption: "Ullamco in incididunt eiusmod aliquip dolore nisi dolore est consectetur. Est ad exercitation culpa laboris elit ea laborum anim proident commodo consequat culpa nisi. Pariatur eu voluptate mollit eiusmod voluptate incididunt. Non ipsum nisi consequat et elit dolore pariatur id laboris dolor anim velit sunt non.", imageUrl: "assets/images/1.png"),
  SlideInfo(title: "Entrega rápida", caption: "Sint esse qui sunt velit tempor laborum dolore enim exercitation officia officia deserunt elit sint. Nostrud anim eiusmod adipisicing sit tempor culpa sint anim. Fugiat quis ex proident in dolor. Id officia aute id exercitation cillum qui. Est ullamco commodo occaecat mollit quis nulla sunt incididunt nostrud commodo in magna. Ad esse esse labore veniam cupidatat anim nostrud exercitation. Quis fugiat dolore enim ut commodo laboris anim labore dolor officia Lorem qui reprehenderit.", imageUrl: "assets/images/2.png"),
  SlideInfo(title: "Disfruta la comida", caption: "Ea deserunt dolore consectetur quis Lorem officia. Non duis ut quis exercitation mollit. Adipisicing excepteur culpa pariatur sit in ad sit mollit ad cillum excepteur quis sunt non. Aliqua excepteur consectetur nisi aliquip velit culpa qui occaecat exercitation aute non sit aute cillum.", imageUrl: "assets/images/3.png"),
];

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({required this.title, required this.caption, required this.imageUrl});
  
}

class AppTutorialScreen extends StatefulWidget {
  
  static const name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();

  bool endReach = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      
      if (!endReach && page >= slides.length - 1.5){
        setState(() {
          endReach = true;
        });
      }
      print("${pageViewController.page}");
    },);

    
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: BouncingScrollPhysics(),
            children: slides.map((slideData) => _Slide(title: slideData.title, caption: slideData.caption, imageUrl: slideData.imageUrl),).toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(), 
              child: Text("Skip")
            )
          ),
          endReach ? 
            Positioned(
              bottom: 50,
              right: 30,
              child: FadeInRight(
                from: 15,
                delay: Duration(seconds: 1),
                child: FilledButton(
                  onPressed: () => context.pop(), 
                  child: Text("Comenzar")
                ),
              )
            ): 
            SizedBox(),

        ],
      )
    );
  }
}

class _Slide extends StatelessWidget {
  
  final String title;
  final String caption;
  final String imageUrl;
  
  const _Slide({required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            SizedBox(height: 20,),
            Text(title, style: titleStyle,),
            SizedBox(height: 10,),
            Text(caption, style: captionStyle,),
          ],
        ),
      ),
      );
  }
}