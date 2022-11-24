import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_pdf_viewer_null_safe/flutter_full_pdf_viewer.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';

class PdfViewer extends StatelessWidget {
  static String id = "pdf_viewer";

  const PdfViewer({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        title: const Text("PDF Preview"),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
        elevation: 0,
      ),
      path: path,
    );
  }
}
