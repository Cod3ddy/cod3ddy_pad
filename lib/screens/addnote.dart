import 'package:flutter/material.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  late TextEditingController title, content;

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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            Icon(
              Icons.undo,
              color: Colors.grey.shade400,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.001,
            ),
            Icon(
              Icons.redo,
              color: Colors.grey.shade400,
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
            // GestureDetector(
            //   onTap: () {},
            //   child: const Icon(
            //     Icons.check,
            //     size: 30,
            //     color: Colors.black,
            //   ),
            // ),
          ],
        ),
      ),
      body: _addNoteBodyUi(),
    );
  }

  _addNoteBodyUi() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          TextField(
            controller: title,
            cursorColor: const Color.fromRGBO(246, 185, 15, 1),
            cursorRadius: const Radius.circular(10.0),
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
            decoration: const InputDecoration(
              hintText: 'Title',
              hintStyle: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(110, 110, 110, 1),
              ),
              border: InputBorder.none,
            ),
          ),
          TextField(
            controller: content,
            cursorColor: const Color.fromRGBO(246, 185, 15, 1),
            cursorRadius: const Radius.circular(10.0),
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade900,
            ),
            decoration: const InputDecoration(
              hintText: 'Start typing',
              hintStyle: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(110, 110, 110, 1),
              ),
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.multiline,
            maxLines: null,
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
