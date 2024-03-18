import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String textButton;
  final void Function()? onTap_;

  const MyButton({
    super.key,
    required this.textButton,
    required this.onTap_,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap_,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8)
        ),

        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Text(textButton),
        ),
      ),
    );
  }
}