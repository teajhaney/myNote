import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  final key = GlobalKey<FormState>();

  @override
  void initState() {
    _title = TextEditingController();
    _notes = TextEditingController();
    super.initState();
  }

  late String title = '';
  late String body = '';
  DateTime noteDate = DateTime.now();
  int index = Random().nextInt(10000000);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Scaffold(
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
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xff3C3C3C),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: IconButton(
                            iconSize: 20,
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
                        if (key.currentState!.validate()) {
                          setState(() {
                            title = _title.text;
                            body = _notes.text;
                            noteDate = DateTime.now();

                            note.add(NoteModel(
                              noteId: index,
                              title: title,
                              body: body,
                              noteDate: noteDate,
                            ));
                            note.reversed.toList();
                          });
                          Navigator.pushNamed(
                            context,
                            NoteDetails.routeName,
                            arguments: NoteModel(
                              noteId: 0,
                              title: title,
                              body: body,
                              noteDate: noteDate,
                            ),
                          );
                        } else {
                          return;
                        }
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
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty!';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  minLines: 1,
                  maxLength: 50,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                  controller: _title,
                  autocorrect: true,
                  enableSuggestions: true,
                  buildCounter: (context,
                      {isFocused = true, currentLength = 0, maxLength}) {
                    if (isFocused) {
                      return Text(
                        '$currentLength/$maxLength',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
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
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field cannot be empty!';
                      } else {
                        return null;
                      }
                    },
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
      ),
    );
  }
}
