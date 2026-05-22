// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:emp_apnagodam/Data/Models/StackQualityPdfModal.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class StackQualityPdfScreen extends ConsumerStatefulWidget {
  const StackQualityPdfScreen(
      {super.key, required this.auditid, required this.warehousename});

  final String? auditid;
  final String? warehousename;

  @override
  ConsumerState<StackQualityPdfScreen> createState() =>
      _LockAndKeyScreenState();
}

class _LockAndKeyScreenState extends ConsumerState<StackQualityPdfScreen> {
  final pdf = pw.Document();

  void writeOnPdf(StackQualityPdfCreatemodal Qualitypdf) {
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a3,
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Header(
              child: pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Text('Stack Wise Physical Quality Report',
                    textScaleFactor: 2,
                    textAlign: pw.TextAlign.center,
                    style:
                        pw.TextStyle(decoration: pw.TextDecoration.underline)),
              ),
            ),
            pw.Padding(padding: const pw.EdgeInsets.all(10)),
            pw.Table(
                border: pw.TableBorder.all(color: PdfColors.black),
                children: [
                  pw.TableRow(children: [
                    pw.Container(
                        margin: pw.EdgeInsets.all(10),
                        child: pw.Text('Sr No.',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                    pw.Container(
                      margin: pw.EdgeInsets.all(10),
                      child: pw.Text('Stack No.',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Container(
                      margin: pw.EdgeInsets.all(10),
                      child: pw.Text('Commodity',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Container(
                      margin: pw.EdgeInsets.all(10),
                      child: pw.Text('ERP Quality Report',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Container(
                      margin: pw.EdgeInsets.all(10),
                      child: pw.Text('Audit Quality Report',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Container(
                      margin: pw.EdgeInsets.all(10),
                      child: pw.Text('Remark',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                  ]),
                  ...?Qualitypdf.data?.stackData?.map((data) {
                    print(jsonDecode(data.qualityData) ?? '');
                    var index =
                        (Qualitypdf.data?.stackData?.indexOf(data) ?? 0);
                    return pw.TableRow(children: [
                      pw.Padding(
                          padding: pw.EdgeInsets.all(10),
                          child: pw.Text(
                            '${index + 1}',
                          )),
                      pw.Padding(
                          padding: pw.EdgeInsets.all(10),
                          child: pw.Text(
                            data.stackNo ?? '',
                          )),
                      pw.Padding(
                          padding: pw.EdgeInsets.all(10),
                          child: pw.Text(
                            data.category ?? '',
                          )),
                      pw.Padding(
                        padding: pw.EdgeInsets.all(10),
                        child: pw.Column(
                            children: List.generate(
                                (jsonDecode(data.qualityData) as List<dynamic>)
                                    .length,
                                (index) => pw.Row(children: [
                                      pw.Text(
                                        '${jsonDecode(data.qualityData)[index]['parameter']}:',
                                      ),
                                      pw.Text(
                                        '${jsonDecode(data.qualityData)[index]['value']}',
                                      ),
                                    ]))),
                      ),
                      pw.Padding(
                        padding: pw.EdgeInsets.all(10),
                        child: pw.Column(
                            children: List.generate(
                                (jsonDecode(data.qualityData) as List<dynamic>)
                                    .length,
                                (index) => pw.Row(children: [
                                      pw.Text(
                                        '${jsonDecode(data.qualityData)[index]['parameter']}:',
                                      ),
                                      pw.Text(
                                        '${jsonDecode(data.qualityData)[index]['inv_value']}',
                                      ),
                                    ]))),
                      ),
                      pw.Padding(
                        padding: pw.EdgeInsets.all(10),
                        child: pw.Text(
                          data.remark ?? '',
                        ),
                      ),
                    ]);
                  })
                ]),
          ];
        },
        footer: (context) => pw.Align(
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
                    'Supervisor Name:\n${Qualitypdf.data?.supName ?? ''}',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(fontSize: 9),
                  ),
                  pw.Text(
                    'Phone No: ${Qualitypdf.data?.supPhone ?? ''}',
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
                    'Warehouse:\n${Qualitypdf.data?.wareName ?? ''}',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(fontSize: 9),
                  ),
                ],
              ),
              pw.Column(
                children: [
                  pw.Text(
                    'Audit Id: ${Qualitypdf.data?.auditId ?? ''}',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(fontSize: 9),
                  ),
                  pw.Text(
                    'Auditor Name:\n${Qualitypdf.data?.auditorName ?? ''}',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(fontSize: 9),
                  ),
                  pw.Text(
                    'Phone No:  ${Qualitypdf.data?.auditorPhone ?? ''}',
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

      file = File('${downloadDirectory}/stack_quality.pdf');

      if (file.existsSync()) {
        file.deleteSync();
      }
      Uint8List pdfData = await pdf.save();
      await file.writeAsBytes(pdfData);
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
        title: Text('Stack Quality  PDF'),
        foregroundColor: Colors.white,
      ),
      body: ref
          .watch(stackQualityPdfCreateProvider(auditId: '${widget.auditid}'))
          .when(
            data: (StackQualityPdfCreatemodal Qualitypdf) {
              writeOnPdf(Qualitypdf);

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
                      writeOnPdf(Qualitypdf);
                      await savePdf();

                      Directory documentDirectory =
                          await getApplicationDocumentsDirectory();
                      String documentPath = documentDirectory.path;
                      String fullPath = "$documentPath/stack_quality.pdf";
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
