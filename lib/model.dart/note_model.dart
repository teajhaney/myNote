class NoteModel {
  String title;
  String body;
  DateTime noteDate;
  NoteModel({
    required this.title,
    required this.body,
    required this.noteDate,
  });

  Map<String, dynamic> toMap() {
    return ({
      'title': title,
      'body': body,
      'noetDate': noteDate,
    });
  }
}
