import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(content: Text("Hola mundo"),action: SnackBarAction(label: "Ok", onPressed: () {},),);
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context){
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text("Estas seguro?"),
        content: Text("Deserunt nostrud enim adipisicing ullamco laboris esse ad. Occaecat ut mollit culpa dolor excepteur sint consectetur tempor ipsum nulla ex reprehenderit ad aute. Irure cillum excepteur tempor tempor quis id velit in eu qui. Nostrud minim fugiat consequat non incididunt nostrud magna proident eiusmod consequat. Ea sit cupidatat laboris reprehenderit ut veniam et. Elit cillum magna enim culpa pariatur id do anim irure non eu non."),
        actions: [
          TextButton(
            onPressed: () => context.pop(), 
            child: Text("Cancelar")),
          FilledButton(
            onPressed: () => context.pop(), 
            child: Text("Aceptar"))
        ],
      ),);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snackbar & Dialogues"),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context, 
                  children: [
                    Text("Officia commodo irure est eu. Elit sunt laborum mollit consequat voluptate esse enim irure. Sint aliquip ut duis et excepteur nisi. Ipsum tempor tempor veniam reprehenderit in sit ullamco esse. Labore consectetur fugiat ut magna deserunt in nulla et anim. Do aute ex ipsum nostrud magna mollit consequat ipsum nostrud velit esse adipisicing dolor. Cillum pariatur esse deserunt dolor laborum irure mollit do laborum eiusmod et culpa.")
                  ]
                );
              } , 
              child: Text("Licencias usadas")),
            
            FilledButton.tonal(
              onPressed: () => openDialog(context) , 
              child: Text("Mostrar dialogo de pantalla"))

          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context), 
        label: Text("Mostrar Snackbar"),
        icon: Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}