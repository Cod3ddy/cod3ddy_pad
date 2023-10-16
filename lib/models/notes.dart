class Note {
  int id;
  String title;
  String content;
  DateTime modifiedTime;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.modifiedTime,
  });
}

List<Note> sampleNotes = [
  Note(
    id: 1,
    title: "Hello Family",
    content: "Stop weed\nSell house\nSell",
    modifiedTime: DateTime(2023, 4, 18, 34, 5),
  ),
  Note(
    id: 2,
    title: "Teach Code",
    content: "Linked List",
    modifiedTime: DateTime(2023, 4, 25, 34, 5),
  ),
  Note(
    id: 3,
    title: "Watch Anime",
    content: "Hyogukaru\nOne Piece\nShockwave nanda",
    modifiedTime: DateTime(2023, 5, 20, 34, 5),
  ),
  Note(
    id: 4,
    title: "Play Codm",
    content: "SnD\nHardpoint\nBr solo",
    modifiedTime: DateTime(2023, 5, 26, 34, 5),
  ),
  Note(
    id: 5,
    title: "Call family",
    content: "Akataya\nMom\nFelix",
    modifiedTime: DateTime(2023, 9, 10, 34, 5),
  ),
];
