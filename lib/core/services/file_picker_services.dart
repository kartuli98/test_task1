import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FilePickerService {

  Future<MapEntry<String, File>?> pickSingleImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpeg', 'jpg', 'png'],
    );
    if (result != null) {
      String path = result.files.single.path!;
      return MapEntry(path,File(path));
    } else {
      return null;
    }
  }
}
