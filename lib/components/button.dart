import 'package:flutter/material.dart';

class NoteHistoryButton extends StatelessWidget {
  final UndoHistoryController undoController;
  final Widget icon;
  final ButtonStyle? enabledStyle;
  final ButtonStyle? disabledStyle;
  final Function()? onPressed;

  const NoteHistoryButton({
    required this.icon,
    required this.undoController,
    required this.enabledStyle,
    required this.disabledStyle,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: undoController,
      builder: (context, value, child) {
        return IconButton(
            onPressed: onPressed,
            icon: icon,
            style: ButtonStyle(
              iconColor: MaterialStateProperty.all(
                (value.canUndo ? enabledStyle : disabledStyle) as Color?,
              ),
            ));
      },
    );
  }

  // TextStyle enabledStyle() {
  //   return TextStyle();
  // }
  // TextStyle disabledStyle() {
  //   return TextStyle();
  // }
}
