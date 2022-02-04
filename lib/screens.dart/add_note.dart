import 'package:flutter/material.dart';
import 'package:my_notes/model.dart/note_model.dart';
import 'package:my_notes/screens.dart/screen.dart';

class AddNote extends StatefulWidget {
  static const routeName = '/AddNote';
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  late final TextEditingController _title;

  late final TextEditingController _notes;

  @override
  void initState() {
    _title = TextEditingController();
    _notes = TextEditingController();
    super.initState();
  }

  late String title;
  late String body;
  late DateTime noteDate;

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
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xff3C3C3C),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: IconButton(
                          iconSize: 30,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        NoteDetails.routeName,
                      );
                      setState(() {
                        title = _title.text;
                        body = _notes.text;
                        noteDate = DateTime.now();
                      });
                    },
                    child: Container(
                      height: 60,
                      width: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xff3C3C3C),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 2,
                minLines: 1,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
                controller: _title,
                autocorrect: true,
                enableSuggestions: true,
                decoration: const InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    fontSize: 40,
                    color: Color(0xff929292),
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 1,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  controller: _notes,
                  autocorrect: true,
                  enableSuggestions: true,
                  decoration: const InputDecoration(
                    hintText: 'Type Something...',
                    hintStyle: TextStyle(
                      fontSize: 30,
                      color: Color(0xff929292),
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
