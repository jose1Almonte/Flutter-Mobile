import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});
  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Functions'),
        centerTitle: true,
        actions: [
          IconButton(
          onPressed: (){
            setState(() {
              clickCounter = 0;
            });
          }, 
          icon: Icon(Icons.refresh_rounded)),

        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter', style: const TextStyle( fontSize: 160, fontWeight: FontWeight.w100)),
            Text((clickCounter == 1) ? 'Click' : 'Clicks', style: const TextStyle( fontSize: 25)),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(icon: Icons.refresh_rounded,),
          const SizedBox(height: 10,),
          CustomButton(icon: Icons.plus_one,),
          const SizedBox(height: 10,),
          CustomButton(icon: Icons.exposure_minus_1_outlined,),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  
  final IconData icon;
  
  const CustomButton({
    super.key, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: () {},
      child: Icon(icon), 
    );
  }
}


