import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:printing/printing.dart';
import 'package:uuid/uuid.dart';

class CommonPdfServices {
  static Future<File?> savePdfToMobile({required pw.Widget pdfWidget}) async {
    try {
      final pdf = pw.Document(  
        pageMode: PdfPageMode.fullscreen,
      );
      pdf.addPage(pw.Page(
          margin: const pw.EdgeInsets.all(8),
          build: (pw.Context context) => pdfWidget));
 Directory tempDir = await getTemporaryDirectory();
String tempPath = tempDir.path;
String fileName = 'my_file.pdf';

var pdfData = await Printing.layoutPdf(
  onLayout: (PdfPageFormat format) async => pdf.save());

File file = File('$tempPath/$fileName');
await file.writeAsBytes ( await pdf.document.save());
      Fluttertoast.showToast(
        msg: "File saved successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );

      return file;
    } catch (e) {
      debugPrint("Error saving PDF: $e");
      Fluttertoast.showToast(
        msg: "Error: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return null;
    }
  }

   


 static Future<Uint8List> generatePdf({required pw.Widget pdfWidget }) async {
    final pdf = pw.Document();
       pdf.addPage(pw.Page(
          margin: const pw.EdgeInsets.all(8),
          build: (pw.Context context) => pdfWidget));
          return pdf.save();
  }


static  Future<void> save({required Uint8List byteList}) async {
    try {
      final fileName = const Uuid().v1();
      final outputs = await getApplicationDocumentsDirectory();
      final filePath = '${outputs.path}/$fileName.pdf';
      debugPrint('printing file path of pdf ${filePath.toString()}',);
      final file = File(filePath);
      await file.writeAsBytes(byteList);
       OpenFile(file.path, true);

      Fluttertoast.showToast(
        msg: "File saved successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error: $e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
