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

var note = <NoteModel>[
  NoteModel(
    title: "This is my first Note",
    body:
        'I wbwerebfcjbwee  bweinbedinhiwdhiw hg3rbvefdscjbsfdjubdsijbujerbub ',
    noteDate: DateTime.now(),
  )
];

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
                    childAspectRatio: 5 / 8,
                    crossAxisSpacing: 2,
                  ),
                  itemCount: note.length,
                  itemBuilder: (BuildContext context, int index) {
                    return NoteTile(noteModel: note[index]);
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
