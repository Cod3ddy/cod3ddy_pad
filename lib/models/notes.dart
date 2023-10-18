class Note {
  int id;
  String title;
  String content;
  String modifiedTime;

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
    modifiedTime: "Oct 9 11:27",
  ),
  Note(
    id: 2,
    title: "Teach Code",
    content: "Linked List",
    modifiedTime: "",
  ),
  Note(
    id: 3,
    title: "Watch Anime",
    content: "Hyogukaru\nOne Piece\nShockwave nanda",
    modifiedTime: "Oct 9 11:27",
  ),
  Note(
    id: 4,
    title: "Play Codm",
    content: "SnD\nHardpoint\nBr solo",
    modifiedTime: "Oct 10 12:27",
  ),
  Note(
    id: 5,
    title: "Call family",
    content: "Akataya\nMom\nFelix",
    modifiedTime: "Oct 16 11:27",
  ),
];
