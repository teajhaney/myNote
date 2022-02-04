import 'package:flutter/material.dart';
import 'package:my_notes/model.dart/note_model.dart';

class NoteTile extends StatelessWidget {
  final NoteModel noteModel;
  const NoteTile({Key? key, required this.noteModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                noteModel.title,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                noteModel.body,
                style: TextStyle(
                  color: Colors.white,
                ),
                softWrap: true,
              ),
              Text(
                noteModel.noteDate.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ));
  }
}
