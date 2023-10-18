import 'package:flutter/material.dart';

class UndoButton extends StatefulWidget {
  const UndoButton({super.key});

  @override
  State<UndoButton> createState() => _UndoButtonState();
}

class _UndoButtonState extends State<UndoButton> {
  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.undo,
      color: Colors.grey,
    );
  }
}
