import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:my_notes/model.dart/note_model.dart';
import 'package:my_notes/screens.dart/my_notes_screen.dart';

class NoteDetails extends StatefulWidget {
  static const routeName = '/NoteDetails';
  const NoteDetails({Key? key}) : super(key: key);

  @override
  State<NoteDetails> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  bool isEditable = false;
  late final TextEditingController _title;

  late final TextEditingController _notes;
  late String initialTitle;
  late String initailNote;

  final key = GlobalKey<FormState>();

  @override
  void initState() {
    _title = TextEditingController.fromValue(TextEditingValue(text: title));
    _notes = TextEditingController.fromValue(TextEditingValue(text: body));
    super.initState();
  }

  late String title = '';
  late String body = '';
  DateTime noteDate = DateTime.now();
  late int index;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          iconSize: 25,
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                MyNotesScreen.routeName, (route) => false);
                          },
                          icon: const Icon(
                            Icons.home,
                            color: Colors.white,
                          )),
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
                        child: isEditable
                            ? IconButton(
                                iconSize: 25,
                                onPressed: () {
                                  setState(() {
                                    note.removeAt(args.noteId);
                                    // note.removeWhere(
                                    //     (note) => note.noteId == args.noteId);
                                    // note.insert(
                                    //     index,
                                    //     NoteModel(
                                    //         title: args.title,
                                    //         body: args.body,
                                    //         noteDate: args.noteDate,
                                    //         noteId: args.noteId));

                                    note.add(NoteModel(
                                        noteId: args.noteId,
                                        title: args.title,
                                        body: args.body,
                                        noteDate: args.noteDate));

                                    NoteModel(
                                      noteId: args.noteId,
                                      title: args.title,
                                      body: args.body,
                                      noteDate: args.noteDate,
                                    );
                                    isEditable = false;
                                  });
                                },
                                icon: const Icon(
                                  Icons.save,
                                  color: Colors.white,
                                ))
                            : IconButton(
                                iconSize: 25,
                                onPressed: () {
                                  setState(() {
                                    isEditable = true;
                                  });
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ))),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              !isEditable
                  ? Text(
                      args.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    )
                  : TextFormField(
                      // controller: _title,
                      keyboardType: TextInputType.multiline,
                      maxLines: 1,
                      minLines: 1,
                      maxLength: 50,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                      autocorrect: true,
                      autofocus: true,
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
                      initialValue: args.title,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {
                        setState(() => {args.title = value});
                      },
                      // onFieldSubmitted: (value) {
                      //   setState(
                      //       () => {isEditable = false, args.title = value});
                      // },
                    ),
              // Text(
              //   args.title,
              //   style: const TextStyle(
              //     color: Colors.white,
              //     fontWeight: FontWeight.bold,
              //     fontSize: 40,
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              Text(
                DateFormat('yMMMMd').format(args.noteDate),
                style: const TextStyle(
                  color: Color(0xff7C7C7C),
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              !isEditable
                  ? Text(
                      args.body,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  : TextFormField(
                      // controller: _notes,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      minLines: 1,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
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
                      initialValue: args.body,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {
                        setState(() => {args.body = value});
                      },
                      // onFieldSubmitted: (value) {
                      //   setState(() => {isEditable = false, args.body = value});
                      // },
                    ),
              // Text(
              //   args.body,
              //   style: const TextStyle(
              //     color: Colors.white,
              //     fontSize: 20,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
