import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = "buttons_screen";

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buttons Screen"),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10,vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
              
              }, 
              child: Text('Elevated')
            ),
            const ElevatedButton(
              onPressed: null, 
              child: Text('Elevated disabled')
            ),
            ElevatedButton.icon(
              onPressed: () {
                
              },
              icon: Icon(Icons.access_alarm_rounded),
              label: Text('Elevated Icon'),
            ),
            FilledButton(
              onPressed: () {
                
              }, 
              child: Text('Filled')
            ),
            FilledButton.icon(
              onPressed: () {
                
              },
              icon: Icon(Icons.add_alert_outlined),
              label: Text("Filled icon"),
            ),
            OutlinedButton(
              onPressed: () {
                
              }, 
              child: Text("Outline")
            ),
            OutlinedButton.icon(
              onPressed: () {
                
              }, 
              icon: Icon(Icons.terminal),
              label: Text("Outline Icon"),
            ),
            TextButton(
              onPressed: () {
                
              }, 
              child: Text('Text')
            ),
            TextButton.icon(
              onPressed: () {
                
              }, 
              label: Text('Text Icon'),
              icon: Icon(Icons.face_2_outlined),
            ),

            const CustomButton(),

            IconButton(
              onPressed: () {
                
              },
              icon: Icon(Icons.gif)
            ),
            IconButton(
              onPressed: () {
                
              },
              icon: Icon(Icons.gif),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
                iconColor: WidgetStatePropertyAll(Colors.white),
                ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {
            
          },
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola mundo', style: TextStyle(color: Colors.white),)
            ),
        ),
      ),
    );
  }
}