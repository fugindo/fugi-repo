import 'dart:io';

List youtuberList = [
  {
    "name": "Erico Darmawan Handoyo",
    "youtube": "https://www.youtube.com/c/EricoDarmawanHandoyo",
  },
  {
    "name": "Progammer zaman now",
    "youtube": "https://www.youtube.com/c/ProgrammerZamanNow",
  },
  {
    "name": "Abdul Aziz Ahwan",
    "youtube": "https://www.youtube.com/c/AbdulAzizAhwanID",
  },
  {
    "name": "Kuldi Project",
    "youtube": "https://www.youtube.com/c/KuldiiProject",
  },
  {
    "name": "Kopianan",
    "youtube": "https://www.youtube.com/c/KopiAnan",
  },
  {
    "name": "Capek Ngoding",
    "youtube": "https://www.youtube.com/c/CapekNgoding",
    "tiktok": "https://www.tiktok.com/@codingwithdeny"
  },
  {
    "name": "Code with Bahri",
    "youtube": "https://www.youtube.com/c/SaifulBahri27",
    "tiktok": "https://www.tiktok.com/@codewithbahri"
  },
  {
    "name": "Concept Coder",
    "youtube": "https://www.youtube.com/user/saylhendra",
  },
  {
    "name": "Banua coder",
    "youtube": "https://www.youtube.com/channel/UC0SrBwl_lIlvR_wpYcmCG8w",
  }
];

//nodemon --exec dart generator.dart
void main() {
  var file = File("./README.md");
  var content = file.readAsStringSync();
  var lines = content.split("\n");

  var newLines = [];
  var skipLine = false;
  for (var i = 0; i < lines.length; i++) {
    var line = lines[i];
    if (line.indexOf("YoutubeChannelGeneratorStart") > -1) {
      newLines.add(line);
      skipLine = true;
    } else if (line.indexOf("YoutubeChannelGeneratorEnd") > -1) {
      newLines.add(line);
      skipLine = false;
    } else {
      if (skipLine == false) newLines.add(line);
    }
  }

  var newContent = [];
  for (var i = 0; i < youtuberList.length; i++) {
    var item = youtuberList[i];
    newContent.add("""
| ${item["name"]} | [Youtube](${item["youtube"]}) . [Linkedin](https://www.linkedin.com/in/budimanrasyid/) . |
"""
        .trim());
  }

  var newUpdatedContent = newLines.join("\n");
  newUpdatedContent = newUpdatedContent.replaceAll(
      "<!-- YoutubeChannelGeneratorStart -->",
      "<!-- YoutubeChannelGeneratorStart -->\n${newContent.join("\n")}");
  file.writeAsStringSync(newUpdatedContent);
}
