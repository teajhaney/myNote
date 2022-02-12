import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteModel {
  String title;
  String body;
  DateTime noteDate;
  Color color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  late int noteId = 0;

  NoteModel({
    required this.title,
    required this.body,
    required this.noteDate,
    required this.noteId,
  });

  Map<String, dynamic> toMap() {
    return ({
      'title': title,
      'body': body,
      'noetDate': noteDate,
      'color': color,
      'noteId': noteId
    });
  }
}

var note = <NoteModel>[];
