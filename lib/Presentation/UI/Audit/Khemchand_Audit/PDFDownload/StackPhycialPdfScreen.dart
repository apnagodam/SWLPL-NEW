// ignore_for_file: unused_local_variable

import 'dart:io';
import 'dart:typed_data';
import 'package:emp_apnagodam/Data/Models/StackPhycialPdfModal.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class StackPhycialPdfScreen extends ConsumerStatefulWidget {
  const StackPhycialPdfScreen(
      {super.key, required this.auditid, required this.warehousename});

  final String? auditid;
  final String? warehousename;

  @override
  ConsumerState<StackPhycialPdfScreen> createState() =>
      _LockAndKeyScreenState();
}

class _LockAndKeyScreenState extends ConsumerState<StackPhycialPdfScreen> {
  final pdf = pw.Document();

  void writeOnPdf(StackPhycialPdfCreatemodal PhycialPdf) {
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Header(
              level: 0,
              child: pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Text(
                  'Stack Wise Physical Audit Report',
                  textScaleFactor: 2,
                  textAlign: pw.TextAlign.center,
                ),
              ),
            ),
            pw.Padding(padding: const pw.EdgeInsets.all(10)),
            pw.TableHelper.fromTextArray(
              context: context,
              data: <List<String>>[
                <String>[
                  'Stack No.',
                  'Commodity',
                  'ERP Bags',
                  'Audit Bags',
                  'Bag Difference',
                  'Remark',
                ],
                ...?PhycialPdf.data?.stackData?.map(
                  (data) => [
                    '${data.stackNo ?? ''}',
                    '${data.category ?? ''}',
                    '${data.invBags ?? ''}',
                    '${data.auditBags.toString()}',
                    '${data.bagDifference ?? ""}',
                    '${data.remark ?? ''}',
                  ],
                ),
              ],
            ),
            pw.Spacer(),
            pw.Divider(),
            pw.Align(
              alignment: pw.Alignment.bottomCenter,
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    children: [
                      pw.Text(
                        'Date:${pw.DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                        style: pw.TextStyle(fontSize: 11),
                        textAlign: pw.TextAlign.center,
                      ),
                      pw.Text(
                        'Supervisor Name:\n${PhycialPdf.data?.supName ?? ''}',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontSize: 9),
                      ),
                      pw.Text(
                        'Phone No: ${PhycialPdf.data?.supPhone ?? ''}',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontSize: 9),
                      ),
                      pw.Text(
                        'Signature' + "--------------",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontSize: 9),
                      ),
                    ],
                  ),
                  pw.Column(
                    children: [
                      pw.Text(
                        'Warehouse:\n${PhycialPdf.data?.wareName ?? ''}',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontSize: 9),
                      ),
                    ],
                  ),
                  pw.Column(
                    children: [
                      pw.Text(
                        'Audit Id: ${PhycialPdf.data?.auditId ?? ''}',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontSize: 9),
                      ),
                      pw.Text(
                        'Auditor Name:\n${PhycialPdf.data?.auditorName ?? ''}',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontSize: 9),
                      ),
                      pw.Text(
                        'Phone No:  ${PhycialPdf.data?.auditorPhone ?? ''}',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontSize: 9),
                      ),
                      pw.Text(
                        'Signature' + "--------------",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontSize: 9),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ];
        },
      ),
    );
  }

  Future<File?> savePdf() async {
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    File? file;

    try {
      String? downloadDirectory = await getDownloadPath();
      if (downloadDirectory == null) {
        print("Download path is null");
        return null;
      }

      file = File('${downloadDirectory}/Stack_Phycial_audit.pdf');
      if (file.existsSync()) {
        file.deleteSync();
      }
      if (!await file.exists()) {
        Uint8List pdfData = await pdf.save();
        await file.writeAsBytes(pdfData);
      }
  Fluttertoast.showToast(msg: "File Saved successfully");
      print("PDF Saved at: ${file.path}");

      return file;
    } catch (e) {
      print("Error saving PDF: $e");
    }
    return file;
  }

  Future<String?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err) {
      print("Cannot get download folder path: $err");
    }
    return directory?.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Stack Phycial  PDF'),
        foregroundColor: Colors.white,
      ),
      body: ref
          .watch(stackPhycialPdfCreateProvider(auditId: '${widget.auditid}'))
          .when(
            data: (StackPhycialPdfCreatemodal PhycialPdf) {
              writeOnPdf(PhycialPdf);

              return ListView(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    child: const Text(
                      'Preview PDF',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      writeOnPdf(PhycialPdf);
                      await savePdf();

                      Directory documentDirectory =
                          await getApplicationDocumentsDirectory();
                      String documentPath = documentDirectory.path;
                      String fullPath = "$documentPath/Stack_Phycial_audit.pdf";
                    },
                  ),
                ],
              );
            },
            error: (e, s) => Center(child: Text('Error: $e')),
            loading: () => loader(context),
          ),
    );
  }
}
