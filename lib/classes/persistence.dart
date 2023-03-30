import 'dart:io';

class Thought {
  int id;
  DateTime date = DateTime.now();
  String contents;
  List<String> tags = [];

  Thought(
    this.id,
    this.date,
    this.contents,
    {
      List<String>? tags,
    }
  ): tags = tags ?? [];

  Thought.now(
    this.id,
    this.contents,
    {
      List<String>? tags,
    }
  ): tags = tags ?? [];

  void addTag(String tag) {
    if (tag.contains('%')) {
      return;
    }
    tags.add(tag);
  }

  void addTags(List<String> tags) {
    for (var tag in tags) {
      addTag(tag);
    }
  }

  @override
  String toString() {
    return "$id ${date.millisecondsSinceEpoch} $contents \n$tagsToString";
  }

  String get tagsToString {
    String strTags = '%';
    for (var tag in tags) {
      strTags += '$tag%';
    }
    return strTags;
  }

  @override
  bool operator ==(Object o) {
    if (o is Thought) {
      return o.id == id && o.contents == contents && o.date.millisecondsSinceEpoch == date.millisecondsSinceEpoch;
    }
    return false;
  }
}

Thought parseThoughtWithTags(String str) {
  var split = str.split('\n');
  var thoughtLine = split[0];
  var tagLine = split[1];

  Thought thought = parseThought(thoughtLine);
  thought.addTags(parseTags(tagLine));

  return thought;
}

Thought parseThought(String str) {
  var split = str.split(" ");
  var id = int.parse(split[0]);
  var timestamp = int.parse(split[1]);
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  var thought = split.skip(2).join(" ");
  return Thought(id, date, thought);
}

List<String> parseTags(String str) {
  var tags = str.split('%');
  tags = tags.skip(1).toList();
  tags.length = tags.length - 1;
  return tags;
}

List<Thought> loadThoughts(String filename) {
  var file = File(filename);
  if (!file.existsSync() || file.lengthSync() == 0) {
    return [];
  }
  var contents = file.readAsStringSync().trim();
  var lines = contents.split("\n");
  lines = _combineLinesForThoughts(lines);
  return lines.map(parseThoughtWithTags).toList();
}

List<String> _combineLinesForThoughts (List<String> lst) {
  List<String> newLst = [];
  for (int i = 0; i < lst.length; i+= 2) {
    newLst.add(lst[i] + '\n' + lst[i+1]);
  }
  return newLst;
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
