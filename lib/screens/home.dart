import 'package:cod3ddy_pad/models/notes.dart';
import 'package:cod3ddy_pad/screens/addnote.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
      appBar: _appBar(),
      body: _bodyUi(),
      floatingActionButton: SizedBox(
        height: 70,
        child: FloatingActionButton.large(
          elevation: 5,
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddNoteScreen(),
              ),
            );

            if (result != null) {
              sampleNotes.add(
                Note(
                  id: sampleNotes.length,
                  title: result[0],
                  content: result[1],
                  modifiedTime: DateTime.now(),
                ),
              );
            }
          },
          backgroundColor: const Color.fromRGBO(246, 185, 15, 1),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_outline,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.task_rounded,
              size: 30,
              color: Colors.grey.shade600,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              size: 30,
              color: Colors.grey.shade800,
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
      foregroundColor: const Color.fromRGBO(246, 185, 15, 1),
    );
  }

  _bodyUi() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color.fromRGBO(110, 110, 110, 1),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(237, 237, 237, 1),
                  hintText: 'Search notes',
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(110, 110, 110, 1),
                    fontWeight: FontWeight.w300,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.12,
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(238, 238, 238, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'All',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'New Notes',
                        style: TextStyle(
                          color: Color.fromRGBO(110, 110, 110, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Uncategorized',
                        style: TextStyle(
                          color: Color.fromRGBO(110, 110, 110, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.12,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.folder_open_outlined,
                        color: Color.fromRGBO(246, 185, 15, 1),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: sampleNotes.length,
            itemBuilder: (context, index) {
              final notes = sampleNotes[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.only(left: 5, bottom: 4),
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                        offset: const Offset(0, 0),
                        blurRadius: 4.3,
                        spreadRadius: 2.3,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //heading
                      RichText(
                        overflow: TextOverflow.fade,
                        text: TextSpan(
                          text: "${notes.title}\n",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      //context
                      RichText(
                        textDirection: TextDirection.ltr,
                        maxLines: 8,
                        overflow: TextOverflow.fade,
                        text: TextSpan(
                          text: '${notes.content}\n',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(110, 110, 110, 1),
                            fontWeight: FontWeight.w300,
                            height: 1.2,
                          ),
                        ),
                      ),
                      RichText(
                        textDirection: TextDirection.ltr,
                        maxLines: 8,
                        overflow: TextOverflow.fade,
                        text: TextSpan(
                          text: notes.modifiedTime.toString(),
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color.fromRGBO(110, 110, 110, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        //testing wrap widget
      ],
    );
  }

  GridView buildGridvew() {
    return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => const ListCard(),
    );
  }

  _buildListView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        if (index % 2 == 0) {
          return Card();
        } else {
          return Card();
        }
      },
    );
  }
}

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.only(left: 5, bottom: 4),
        width: MediaQuery.of(context).size.width * 0.45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              offset: const Offset(0, 0),
              blurRadius: 4.3,
              spreadRadius: 2.3,
            ),
          ],
        ),
        child: RichText(
          textDirection: TextDirection.ltr,
          maxLines: 8,
          overflow: TextOverflow.fade,
          text: const TextSpan(
            text: "Hello World\n\n",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            children: [
              TextSpan(
                text: 'Shadowyhands\nrep\n\n',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(110, 110, 110, 1),
                  fontWeight: FontWeight.w300,
                  height: 1.2,
                ),
              ),
              TextSpan(
                text: 'Oct 9 11:27',
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromRGBO(110, 110, 110, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
