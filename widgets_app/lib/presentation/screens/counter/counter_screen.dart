import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/provider/counter_provider.dart';
import 'package:widgets_app/presentation/provider/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  
  static const name = "counter_screen";
  
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCounter = ref.watch(counterProvider);
    // final bool isDarkMode = ref.watch(isDarkModeProvider);

    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;


    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            // icon: Icon(Icons.dark_mode_outlined),
            icon: isDarkMode 
              ? Icon(Icons.dark_mode_outlined)
              : Icon(Icons.light_mode_outlined),
            onPressed: () {
              // ref.read(isDarkModeProvider.notifier)
              //   .update((state) => !state,);

              ref.read(themeNotifierProvider.notifier)
                .toggleDarkMode();
            }, 
          )
        ],
        title: Text("Counter Screen"),
      ),
      body: Center(
        child: Text("Valor: $clickCounter",style: Theme.of(context).textTheme.titleLarge,),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // alternativa 1
          // ref.read(counterProvider.notifier).state++;
          
          // alternativa 2
          ref.read(counterProvider.notifier)
            .update((state) => state + 1,);
          

        },
      ),
    );
  }
}