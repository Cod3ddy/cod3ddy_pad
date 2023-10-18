import 'package:cod3ddy_pad/components/button.dart';
import 'package:cod3ddy_pad/components/textfield.dart';
import 'package:flutter/material.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  late TextEditingController title, content;
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _contentFocusNode = FocusNode();
  final UndoHistoryController _undoContentController = UndoHistoryController();
  final UndoHistoryController _placeHolderController = UndoHistoryController();

  ButtonStyle? enabledStyle() => ButtonStyle(
        iconColor: MaterialStateProperty.all(
          Colors.black,
        ),
      );
  ButtonStyle? disabledStyle() {
    return ButtonStyle(
      iconColor: MaterialStateProperty.all(
        Colors.grey,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    title = TextEditingController();
    content = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //listen to the focused text field if its possible to redo or undo
            ValueListenableBuilder(
              valueListenable: _undoContentController,
              builder: (context, value, child) {
                return Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                    NoteHistoryButton(
                      icon: const Icon(Icons.undo),
                      buttonStyle:
                          value.canUndo ? enabledStyle() : disabledStyle(),
                      onPressed: () {
                        _undoContentController.undo();
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.001,
                    ),
                    NoteHistoryButton(
                      icon: const Icon(Icons.redo),
                      buttonStyle:
                          value.canRedo ? enabledStyle() : disabledStyle(),
                      onPressed: () {
                        _undoContentController.redo();
                      },
                    ),
                  ],
                );
              },
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.001,
            ),
            IconButton(
              onPressed: () {
                final result = _validateInput(title, content);
                if (result) {
                  Navigator.of(context).pop(
                    [title.text, content.text],
                  );
                }

                ///if either of the text input are empty!
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'input body and title',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      backgroundColor: Color.fromRGBO(246, 185, 15, 1),
                    ),
                  );
                }
              },
              icon: const Icon(
                Icons.check,
                size: 30,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: _addNoteBodyUi(),
    );
  }

//add note body components
  _addNoteBodyUi() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          //title textfield
          NoteTextField(
            controller: title,
            focusNode: _titleFocusNode,
            undoController: _placeHolderController,
            decoration: const InputDecoration(
              hintText: 'Title',
              hintStyle: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(110, 110, 110, 1),
              ),
              border: InputBorder.none,
            ),
            maxLines: null,
            textStyle: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
            keyboardType: TextInputType.text,
          ),
          //body text field
          NoteTextField(
            controller: content,
            focusNode: _contentFocusNode,
            undoController: _undoContentController,
            decoration: const InputDecoration(
              hintText: 'Start typing',
              hintStyle: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(110, 110, 110, 1),
              ),
              border: InputBorder.none,
            ),
            maxLines: null,
            textStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade900,
            ),
            keyboardType: TextInputType.multiline,
          ),
        ],
      ),
    );
  }

  bool _validateInput(
      TextEditingController title, TextEditingController content) {
    if (title.text == "" || content.text == "") {
      return false;
    }
    return true;
  }

  dynamic errorDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          shape: LinearBorder(),
          title: Column(
            children: [
              Text('Empty Field!'),
              Icon(Icons.info),
            ],
          ),
          content: SizedBox(
            height: 100,
            child: Column(
              children: [
                SizedBox(
                  child: Text('Title is empty'),
                ),
                SizedBox(
                  child: Text('Title is empty'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
