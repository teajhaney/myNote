import 'package:flutter/material.dart';
import 'package:my_notes/model.dart/note_model.dart';

import 'package:my_notes/note_tile.dart';
import 'package:my_notes/screens.dart/screen.dart';

class MyNotesScreen extends StatefulWidget {
  static const routeName = '/';

  const MyNotesScreen({Key? key}) : super(key: key);

  @override
  State<MyNotesScreen> createState() => _MyNotesScreenState();
}

class _MyNotesScreenState extends State<MyNotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Notes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xff3C3C3C),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: IconButton(
                          iconSize: 35,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 5 / 7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: note.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (note.isEmpty) {
                      return const Center(
                        child: Text(
                          'No note available yet',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      );
                    } else {
                      return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              NoteDetails.routeName,
                              arguments: NoteModel(
                                noteId: note[index].noteId,
                                title: note[index].title,
                                body: note[index].body,
                                noteDate: note[index].noteDate,
                                // noteId: note[index].noteId,
                              ),
                            );
                          },
                          child: NoteTile(noteModel: note[index]));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff3C3C3C),
        onPressed: () {
          Navigator.pushNamed(context, AddNote.routeName);
        },
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
