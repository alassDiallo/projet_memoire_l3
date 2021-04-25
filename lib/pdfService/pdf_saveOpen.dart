import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfSaveOpen {
  static Future
      // <File>
      saveDoc({
    // required
    String name,
    // required
    Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    // return file;
  }

  static Future openFile(
    String name,
  ) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    final url = file.path;

    await OpenFile.open(url);
  }
}
