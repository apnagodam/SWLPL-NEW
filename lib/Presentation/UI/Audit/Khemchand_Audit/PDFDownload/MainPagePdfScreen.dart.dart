// ignore_for_file: unused_local_variable

import 'dart:io';
import 'dart:typed_data';
import 'package:emp_apnagodam/Data/Models/MainPagePdfModal.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class MainPdfPageScreen extends ConsumerStatefulWidget {
  const MainPdfPageScreen(
      {super.key, required this.auditid, required this.warehousename});

  final String? auditid;
  final String? warehousename;

  @override
  ConsumerState<MainPdfPageScreen> createState() => _LockAndKeyScreenState();
}

class _LockAndKeyScreenState extends ConsumerState<MainPdfPageScreen> {
  final pdf = pw.Document();

  void mainPagePdf(MainPagePdfModal mainPdf) {
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
                  'Apna Godam Warehouse Audit Report',
                  textScaleFactor: 2,
                  textAlign: pw.TextAlign.center,
                ),
              ),
            ),
            pw.Align(
              alignment: pw.Alignment.center,
              child: pw.Text(
                'Audit id: 4',
                textScaleFactor: 1,
                style: pw.TextStyle(decoration: pw.TextDecoration.underline),
                textAlign: pw.TextAlign.center,
              ),
            ),
            pw.Padding(padding: const pw.EdgeInsets.all(5)),
            pw.TableHelper.fromTextArray(
              context: context,
              data: [
                [
                  'Date & Time',
                  '${pw.DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                ],
                ['Name Of Auditor', '${mainPdf.data?.auditorName ?? ""}'],
                ['Name of Warehouse', '${mainPdf.data?.wareName ?? ""}'],
                [
                  'Location of Warehouse',
                  '${mainPdf.data?.wareLocation ?? ""}'
                ],
                ['Name of Supervisor', '${mainPdf.data?.supName ?? ""}'],
                ['Name of Area Manager', '${mainPdf.data?.amName ?? ""}'],
                ['Guard Name', ''],
              ],
            ),
            pw.SizedBox(height: 5),
            pw.TableHelper.fromTextArray(
              context: context,
              data: const <List<String>>[
                <String>['SR No.', 'Remark'],
                <String>['1', ''],
                <String>['2', ''],
                <String>['3', ''],
                <String>['4', ''],
                <String>['5', ''],
                <String>['6', ''],
                <String>['7', ''],
              ],
            ),
            pw.SizedBox(height: 5),
            pw.Align(
              alignment: pw.Alignment.topLeft,
              child: pw.Text(
                'Auditor Head Issue Resolved',
                textScaleFactor: 1,
                textAlign: pw.TextAlign.center,
              ),
            ),
            pw.SizedBox(height: 5),
            pw.TableHelper.fromTextArray(
              context: context,
              data: const <List<String>>[
                <String>['SR No.', 'Remark'],
                <String>['1', ''],
                <String>['2', ''],
                <String>['3', ''],
                <String>['4', ''],
                <String>['5', ''],
                <String>['6', ''],
                <String>['7', ''],
              ],
            ),
            pw.SizedBox(height: 15),
            pw.TableHelper.fromTextArray(
              context: context,
              data: [
                [
                  'WHS',
                  '${mainPdf.data?.supName ?? ""}',
                  'Auditor',
                  '${mainPdf.data?.auditorName ?? ""}',
                  'Auditor Head',
                  '${mainPdf.data?.ahName ?? ""}',
                  'Buisness Head',
                  '${mainPdf.data?.bhName ?? ""}',
                  'Director',
                  "Sanjay Agarwal",
                ],
                [
                  'Signature',
                  '',
                  'Signature',
                  '',
                  'Signature',
                  '',
                  'Signature',
                  '',
                  'Signature',
                  '',
                ],
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
                        'Supervisor Name:\n${mainPdf.data?.supName ?? ''}',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontSize: 9),
                      ),
                      pw.Text(
                        'Phone No: ${mainPdf.data?.supPhone ?? ''}',
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
                        'Warehouse:\n${mainPdf.data?.wareName ?? ''}',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontSize: 9),
                      ),
                    ],
                  ),
                  pw.Column(
                    children: [
                      pw.Text(
                        'Audit Id: ${mainPdf.data?.auditId ?? ''}',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontSize: 9),
                      ),
                      pw.Text(
                        'Auditor Name:\n${mainPdf.data?.auditorName ?? ''}',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontSize: 9),
                      ),
                      pw.Text(
                        'Phone No:  ${mainPdf.data?.auditorPhone ?? ''}',
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

      file = File('${downloadDirectory}/main_pdf.pdf');
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
          .watch(MainPagePdfCreateProvider(auditId: '${widget.auditid}'))
          .when(
            data: (MainPagePdfModal mainPdf) {
              mainPagePdf(mainPdf);

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
                      mainPagePdf(mainPdf);
                      await savePdf();

                      Directory documentDirectory =
                          await getApplicationDocumentsDirectory();
                      String documentPath = documentDirectory.path;
                      String fullPath = "$documentPath/main_pdf.pdf";
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
