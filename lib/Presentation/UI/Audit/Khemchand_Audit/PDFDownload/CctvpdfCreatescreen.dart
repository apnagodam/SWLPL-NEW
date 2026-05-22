// ignore_for_file: unused_local_variable

import 'dart:io';
import 'dart:typed_data';
import 'package:emp_apnagodam/Data/Models/CctvPdfCreateModal.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class CctvPdfCreateScreen extends ConsumerStatefulWidget {
  const CctvPdfCreateScreen(
      {super.key, required this.auditid, required this.warehousename});

  final String? auditid;
  final String? warehousename;

  @override
  ConsumerState<CctvPdfCreateScreen> createState() => _LockAndKeyScreenState();
}

class _LockAndKeyScreenState extends ConsumerState<CctvPdfCreateScreen> {
  final pdf = pw.Document();

  void writeOnPdf(CctvPdfCreatemodal cctvPdf) {
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
                  'CCTV Details Report Submitted by Auditor to HO',
                  textScaleFactor: 2,
                  textAlign: pw.TextAlign.center,
                ),
              ),
            ),
            pw.Padding(padding: const pw.EdgeInsets.all(10)),
            pw.TableHelper.fromTextArray(
              context: context,
              data: <List<String>>[
                ['Sr No.', 'Camera No', 'Remark'],
                ...?cctvPdf.data?.stackData?.map(
                  (data) => [
                    '${(cctvPdf.data?.stackData?.indexOf(data) ?? 0) + 1}',
                    '${data.cameraNo ?? 'N/A'}',
                    '${data.remark ?? 'N/A'}',
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
                        'Supervisor Name:\n${cctvPdf.data?.supName ?? ''}',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontSize: 9),
                      ),
                      pw.Text(
                        'Phone No: ${cctvPdf.data?.supPhone ?? ''}',
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
                        'Warehouse:\n${cctvPdf.data?.wareName ?? ''}',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontSize: 9),
                      ),
                    ],
                  ),
                  pw.Column(
                    children: [
                      pw.Text(
                        'Audit Id: ${cctvPdf.data?.auditId ?? ''}',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontSize: 9),
                      ),
                      pw.Text(
                        'Auditor Name:\n${cctvPdf.data?.auditorName ?? ''}',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontSize: 9),
                      ),
                      pw.Text(
                        'Phone No:  ${cctvPdf.data?.auditorPhone ?? ''}',
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

      file = File('${downloadDirectory}/cctv_audit_report.pdf');
      if (file.existsSync()) {
        file.deleteSync();
      }
      if (!await file.exists()) {
        Uint8List pdfData = await pdf.save();
        await file.writeAsBytes(pdfData);
      }  Fluttertoast.showToast(msg: "File Saved successfully");

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
        title: Text('CCTV PDF'),
        foregroundColor: Colors.white,
      ),
      body: ref.watch(CctvPdfCreateProvider(auditId: '${widget.auditid}')).when(
            data: (CctvPdfCreatemodal cctvPdf) {
              writeOnPdf(cctvPdf);

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
                      writeOnPdf(cctvPdf);
                      await savePdf();

                      Directory documentDirectory =
                          await getApplicationDocumentsDirectory();
                      String documentPath = documentDirectory.path;
                      String fullPath = "$documentPath/cctv_audit_report.pdf";
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
