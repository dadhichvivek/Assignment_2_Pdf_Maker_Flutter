import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_pdf_maker/pdf_func.dart';
import 'package:flutter_application_pdf_maker/pdf_viewer.dart';
import 'package:pdf/widgets.dart' as pw;

class HomePage extends StatefulWidget {
  static String id = "homepage";

  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Icon(
                Icons.picture_as_pdf,
                size: 128.0,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () async {
                pw.Document pdf = writeOnPdf();
                await savePdf(pdf: pdf);

                getPdfPath().then((path) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PdfViewer(path: path),
                    ),
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                elevation: 0,
              ),
              child: const Text(
                'Preview PDF',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
