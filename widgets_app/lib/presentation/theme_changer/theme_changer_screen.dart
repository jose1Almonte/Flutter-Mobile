import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/provider/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme changer'),
        actions: [
          IconButton(
            onPressed: () {
              // ref.read(isDarkModeProvider.notifier)
              // .update((state) => !state,);
              ref.read(themeNotifierProvider.notifier)
                .toggleDarkMode();
            }, 
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined)
          )
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colors = ref.watch(colorListProvider);
    
    // final int selectedColor = ref.watch(selectedColorProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioGroup(
          onChanged: (value) {
            //TODO: notificar el cambio a algun lugar
            // ref.read(selectedColorProvider.notifier)
            //   .update((state) => value!,);
            ref.read(themeNotifierProvider.notifier)
              .changeColorIndex(value ?? selectedColor);
          }, 
          groupValue: selectedColor,
          child: Column(
            children: [
              RadioListTile(
                title: Text("Este color", style: TextStyle(color: color),),
                subtitle: Text('${color.r}'),
                activeColor: color,
                value: index
              )
            ],
          )
          );
      },
    );
  }
}