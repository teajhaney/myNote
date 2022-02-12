import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_notes/model.dart/note_model.dart';
import 'package:intl/intl.dart';

class NoteTile extends StatelessWidget {
  final NoteModel noteModel;
  const NoteTile({Key? key, required this.noteModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        //  GestureDetector(
        //   onTap: () {
        //     Navigator.pushNamed(context, NoteDetails.routeName,
        //         arguments: NoteModel(
        //           title: noteModel.title,
        //           body: noteModel.body,
        //           noteDate: noteModel.noteDate,
        //         ));
        //   },
        //   child:
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: noteModel.color,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    noteModel.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Text(
                      noteModel.body,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    DateFormat('yMMMMd').format(noteModel.noteDate),
                    style: const TextStyle(
                      color: Color(0xff7C7C7C),
                    ),
                  )
                ],
              ),
            ));
  }
}
