import 'dart:io';

class Thought {
  int id;
  DateTime date = DateTime.now();
  String contents;

  Thought(this.id, this.date, this.contents);
  Thought.now(this.id, this.contents);

  String toString() {
    return "$id ${date.millisecondsSinceEpoch} $contents";
  }
}

Thought parseThought(String str) {
  var split = str.split(" ");
  var id = int.parse(split[0]);
  var timestamp = int.parse(split[1]);
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  var thought = split.skip(2).join(" ");
  return Thought(id, date, thought);
}

List<Thought> loadThoughts(String filename) {
  var file = File(filename);
  if (!file.existsSync() || file.lengthSync() == 0) {
    return [];
  }
  var contents = file.readAsStringSync().trim();
  var lines = contents.split("\n");
  return lines.map(parseThought).toList();
}

void saveThoughts(String filename, List<Thought> thoughts) {
  var contents = thoughts.map((t) => t.toString()).join("\n");
  var file = File(filename);
  file.writeAsStringSync(contents, mode: FileMode.write);
}

void appendThought(String filename, Thought thought) {
  var file = File(filename);
  file.writeAsStringSync("\n$thought", mode: FileMode.append);
}
