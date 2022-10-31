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

List contributorList = [
  {
    "name": "Saiful Bahri",
    "youtube": "https://www.youtube.com/c/SaifulBahri27",
    "tiktok": "https://www.tiktok.com/@codewithbahri"
  },
  {
    "name": "Deny Ocr",
    "youtube": "https://www.youtube.com/c/CapekNgoding",
    "tiktok": "https://www.tiktok.com/@codingwithdeny"
  },
];

//nodemon --exec dart generator.dart
void main() {
  generateYoutuberList();
  generateContributorList();
}

void generateYoutuberList() {
  var file = File("./README.md");
  var content = file.readAsStringSync();
  var lines = content.split("\n");

  var newLines = [];
  var skipLine = false;
  var startTag = "YoutubeChannelGeneratorStart";
  var endTag = "YoutubeChannelGeneratorEnd";
  var usedList = youtuberList;
  for (var i = 0; i < lines.length; i++) {
    var line = lines[i];
    if (line.indexOf("$startTag") > -1) {
      newLines.add(line);
      skipLine = true;
    } else if (line.indexOf("$endTag") > -1) {
      newLines.add(line);
      skipLine = false;
    } else {
      if (skipLine == false) newLines.add(line);
    }
  }

  var newContent = [
    """
| Nama | Link  |
| :--- | :--- |
"""
        .trim()
  ];
  for (var i = 0; i < usedList.length; i++) {
    var item = usedList[i];
    var youtube =
        item["youtube"] == null ? "" : "[Youtube](${item["youtube"]})";
    var tiktok = item["tiktok"] == null ? "" : " . [TikTok](${item["tiktok"]})";
    newContent.add("""
| ${item["name"]} | $youtube $tiktok
"""
        .trim());
  }

  var newUpdatedContent = newLines.join("\n");
  newUpdatedContent = newUpdatedContent.replaceAll(
      "<!-- $startTag -->", "<!-- $startTag -->\n${newContent.join("\n")}");
  file.writeAsStringSync(newUpdatedContent);
}

void generateContributorList() {
  var file = File("./README.md");
  var content = file.readAsStringSync();
  var lines = content.split("\n");

  var newLines = [];
  var skipLine = false;
  var startTag = "ContributorGeneratorStart";
  var endTag = "ContributorGeneratorEnd";
  var usedList = contributorList;
  for (var i = 0; i < lines.length; i++) {
    var line = lines[i];
    if (line.indexOf("$startTag") > -1) {
      newLines.add(line);
      skipLine = true;
    } else if (line.indexOf("$endTag") > -1) {
      newLines.add(line);
      skipLine = false;
    } else {
      if (skipLine == false) newLines.add(line);
    }
  }

  var newContent = [
    """
| Nama | Link  |
| :--- | :--- |
"""
        .trim()
  ];
  for (var i = 0; i < usedList.length; i++) {
    var item = usedList[i];
    var youtube =
        item["youtube"] == null ? "" : "[Youtube](${item["youtube"]})";
    var tiktok = item["tiktok"] == null ? "" : " . [TikTok](${item["tiktok"]})";
    newContent.add("""
| ${item["name"]} | $youtube $tiktok
"""
        .trim());
  }

  var newUpdatedContent = newLines.join("\n");
  newUpdatedContent = newUpdatedContent.replaceAll(
      "<!-- $startTag -->", "<!-- $startTag -->\n${newContent.join("\n")}");
  file.writeAsStringSync(newUpdatedContent);
}
