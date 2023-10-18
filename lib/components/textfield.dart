import 'package:flutter/material.dart';

class NoteTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final UndoHistoryController undoController;
  final InputDecoration? decoration;
  final int? maxLines;
  final TextStyle? textStyle;
  final TextInputType? keyboardType;

  const NoteTextField({
    required this.controller,
    required this.focusNode,
    required this.undoController,
    required this.decoration,
    required this.maxLines,
    required this.textStyle,
    required this.keyboardType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      controller: controller,
      undoController: undoController,
      focusNode: focusNode,
      cursorColor: const Color.fromRGBO(246, 185, 15, 1),
      cursorRadius: const Radius.circular(10.0),
      decoration: decoration,
      style: textStyle,
      keyboardType: keyboardType,
    );
  }
}
