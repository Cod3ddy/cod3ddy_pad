import 'package:flutter/material.dart';

class NoteHistoryButton extends StatelessWidget {
  final Widget icon;
  final ButtonStyle? buttonStyle;
  final Function()? onPressed;

  const NoteHistoryButton({
    required this.icon,
    required this.buttonStyle,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      style: buttonStyle,
    );
  }

  // TextStyle enabledStyle() {
  //   return TextStyle();
  // }
  // TextStyle disabledStyle() {
  //   return TextStyle();
  // }
}
