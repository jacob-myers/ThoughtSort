import 'dart:io';

class Thought implements Comparable {
  int id;
  DateTime date = DateTime.now();
  String contents;

  Thought(this.id, this.date, this.contents);
  Thought.now(this.id, this.contents);

  String toString() {
    return "$id ${date.millisecondsSinceEpoch} $contents";
  }

  @override
  bool operator ==(Object o) {
    if (o is Thought) {
      return o.id == id && o.contents == contents && o.date.millisecondsSinceEpoch == date.millisecondsSinceEpoch;
    }
    return false;
  }

  @override
  int compareTo(other) {
    if (date.millisecondsSinceEpoch == other.date.millisecondsSinceEpoch){
      return 0;
    } else if (date.millisecondsSinceEpoch > other.date.millisecondsSinceEpoch){
      return 1;
    } else {
      return -1;
    }

  }

  @override
  int get hashCode => id.hashCode ^ date.hashCode ^ contents.hashCode;

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

void editThought(String filename, Thought thought, String contents) {
  var thoughts = loadThoughts(filename);
  var index = thoughts.indexOf(thought);
  thought.contents = contents;
  thoughts[index] = thought;
  saveThoughts(filename, thoughts);
}

void removeThought(String filename, Thought thought) {
  var thoughts = loadThoughts(filename);
  thoughts.remove(thought);
  saveThoughts(filename, thoughts);
}
