import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

  final colors = Theme.of(context).colorScheme;
  final outlinedInputBorder = UnderlineInputBorder(
    borderSide: BorderSide( color: Colors.transparent ),
    borderRadius: BorderRadius.circular(20)
  );

  final inputDecoration = InputDecoration(
        // enabledBorder: outlinedInputBorder,
        focusedBorder: outlinedInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: (){},
        )
      );

    return TextFormField(
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submit value: $value');
      },
      onChanged: (value) {
        print('changed value: $value');
      },
    );
  }
}