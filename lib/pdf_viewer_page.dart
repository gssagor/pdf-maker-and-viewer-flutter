import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewerPage extends StatefulWidget {
  final pdfPath;
  PdfViewerPage({this.pdfPath});
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('name'),
        actions: [
          IconButton(
            onPressed: () async {
              print('pdf path'+widget.pdfPath.toString());
              //await saveFile(widget.url, "sample.pdf");
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'success',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.download_rounded),
          ),
        ],
      ),
      body: PDFView(

        filePath: widget.pdfPath,
      ),
    );
  }
}
