import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

class FileHandler {
  late String appDocumentsPath;

  Future<void> initializeDocumentsDirectory() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    appDocumentsPath = appDocumentsDirectory.path;
  }

  Future<String> saveFile(String name, String bs4str) async {
    Uint8List decodedBytes = base64.decode(bs4str);
    String filePath = "$appDocumentsPath/$name";
    File file = File(filePath);
    file.writeAsBytes(decodedBytes);
    return filePath;
  }

  File getFile(String path) => File(path);
}
