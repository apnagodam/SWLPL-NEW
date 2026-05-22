// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:emp_apnagodam/Data/Models/SancationLetterPDFModal.dart';
import 'package:emp_apnagodam/Domain/SanctionLimit/SanctionLimitService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class SanctionLetterPDF extends ConsumerStatefulWidget {
  const SanctionLetterPDF({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  ConsumerState<SanctionLetterPDF> createState() => _LockAndKeyScreenState();
}

class _LockAndKeyScreenState extends ConsumerState<SanctionLetterPDF> {
  final pdf = pw.Document();

  void writeOnPdf(SancationLetterPdfModal sancationLetter) {
    pdf.addPage(
      pw.MultiPage(
          pageFormat: PdfPageFormat.a3,
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Header(
                child: pw.Align(
                  alignment: pw.Alignment.center,
                  child: pw.Text('Sanction Letter',
                      textScaleFactor: 2,
                      textAlign: pw.TextAlign.center,
                      style: pw.TextStyle()),
                ),
              ),
              pw.Padding(padding: const pw.EdgeInsets.all(10)),
              ...?sancationLetter.data?.map((data) {
                var decodedData =
                    _isValidJson(data.date) ? jsonDecode(data.date) : null;
                return pw.Column(children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text('Date : ${data.date}'),
                      pw.Text('Sanction id : ${data.sanctionId}')
                    ],
                  ),
                  pw.Align(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text('Name : ${data.userName}'),
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),
                  pw.Text(
                      'Thank you for choosing ${data.bankName} Based on the application and information provided there in ,we are pleased to accept your oﬀer to extend you the loan facility as under* ::'),
                  pw.SizedBox(
                    height: 10,
                  ),
                  pw.Table(
                      border: pw.TableBorder.all(color: PdfColors.black),
                      children: [
                        pw.TableRow(children: [
                          pw.Container(
                              margin: pw.EdgeInsets.all(10),
                              child: pw.Text('Application No. ',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold))),
                          pw.Container(
                            margin: pw.EdgeInsets.all(10),
                            child: pw.Text('${data.sanctionId}',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Container(
                              margin: pw.EdgeInsets.all(10),
                              child: pw.Text('Sanction Date ',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold))),
                          pw.Container(
                            margin: pw.EdgeInsets.all(10),
                            child: pw.Text('${data.date}',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Container(
                              margin: pw.EdgeInsets.all(10),
                              child: pw.Text('Applicant Name ',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold))),
                          pw.Container(
                            margin: pw.EdgeInsets.all(10),
                            child: pw.Text('${data.userName}',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Container(
                              margin: pw.EdgeInsets.all(10),
                              child: pw.Text('Registered Number',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold))),
                          pw.Container(
                            margin: pw.EdgeInsets.all(10),
                            child: pw.Text('${data.userPhone}',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                        ]),
                      ]),
                  pw.SizedBox(height: 30),
                  pw.Table(
                      border: pw.TableBorder.all(color: PdfColors.black),
                      children: [
                        pw.TableRow(children: [
                          pw.Container(
                              margin: pw.EdgeInsets.all(10),
                              child: pw.Text('Loan Type ',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold))),
                          pw.Container(
                            margin: pw.EdgeInsets.all(10),
                            child: pw.Text('Commodity Finance',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Container(
                              margin: pw.EdgeInsets.all(10),
                              child: pw.Text('Reference Interest Rate',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold))),
                          pw.Container(
                            margin: pw.EdgeInsets.all(10),
                            child: pw.Text(
                                '${data.interestRate} per annum (Interest Type : Floating rate of interest ,Periodicity of interest Application : Bullet)',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Container(
                              margin: pw.EdgeInsets.all(10),
                              child: pw.Text('Loan Tenor (In Months)',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold))),
                          pw.Container(
                            margin: pw.EdgeInsets.all(10),
                            child: pw.Text('9',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Container(
                              margin: pw.EdgeInsets.all(10),
                              child: pw.Text('Total Processing Charges',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold))),
                          pw.Container(
                            margin: pw.EdgeInsets.all(10),
                            child: pw.Text(
                                '${data.processingFee}  of the total loan amount',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Container(
                              margin: pw.EdgeInsets.all(10),
                              child: pw.Text('Sanction letter validity ',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold))),
                          pw.Container(
                            margin: pw.EdgeInsets.all(10),
                            child: pw.Text('1 Month',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Container(
                              margin: pw.EdgeInsets.all(10),
                              child: pw.Text('Security Type',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold))),
                          pw.Container(
                            margin: pw.EdgeInsets.all(10),
                            child: pw.Text('Commodity',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                        ]),
                      ]),
                  pw.SizedBox(height: 10),
                ]);
              }),
            ];
          },
          footer: (context) => pw.Column(children: [
                pw.Align(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(
                        'Strictly subject to the Terms and Conditions as update on website apnagodam.com')),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Thanking you',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Accepted By',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Align(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(
                      'yours truly,',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    )),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'M/S..............',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Name of Applicant',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Align(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(
                      'The terms and condition of the facility are essential and necessary part of the sanction letter',
                    )),
                pw.SizedBox(
                  height: 10,
                ),
              ])),
    );
  }

  bool _isValidJson(String str) {
    try {
      jsonDecode(str);
      return true;
    } catch (e) {
      return false;
    }
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

      file = File('${downloadDirectory}/sanction_letter.pdf');

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
        title: Text('Sanction Letter PDF'),
        foregroundColor: Colors.white,
      ),
      body: ref.watch(sancationLetterPdfProvider(id: '${widget.id}')).when(
            data: (SancationLetterPdfModal sancationLetter) {
              writeOnPdf(sancationLetter);

              return ListView(
                children: [
                  ListView.builder(
                    itemCount: sancationLetter.data?.length ?? 0,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Date : ${sancationLetter.data?[index].date}'),
                                Text(
                                    'Sanction id : ${sancationLetter.data?[index].sanctionId}')
                              ],
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                  'Name : ${sancationLetter.data?[index].userName}'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                'Thank you for choosing ${sancationLetter.data?[index].bankName} Based on the application and information provided there in ,we are pleased to accept your oﬀer to extend you the loan facility as under* ::'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      _buildTableCell('Application No.', 1),
                                      _buildTableCell(
                                          '${sancationLetter.data?[index].sanctionId}',
                                          2),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      _buildTableCell('Sanction Date', 1),
                                      _buildTableCell(
                                          '${sancationLetter.data?[index].sanctionDate}',
                                          2),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      _buildTableCell('Applicant Name', 1),
                                      _buildTableCell(
                                          '${sancationLetter.data?[index].userName}',
                                          2),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      _buildTableCell('Registered Number', 1),
                                      _buildTableCell(
                                          '${sancationLetter.data?[index].userPhone}',
                                          2),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                ],
                              ),
                              decoration: BoxDecoration(border: Border.all()),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      _buildTableCell('Loan Type', 1),
                                      _buildTableCell('Commodity Finance', 2),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      _buildTableCell(
                                          'Reference Interest Rate', 1),
                                      _buildTableCell(
                                          '${sancationLetter.data?[index].interestRate}  per annum (Interest Type : Floating rate of interest ,Periodicity of interest Application : Bullet)',
                                          2),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      _buildTableCell(
                                          'Loan Tenor (In Months)', 1),
                                      _buildTableCell('9', 2),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      _buildTableCell(
                                          'Total Processing Charges', 1),
                                      _buildTableCell(
                                          '${sancationLetter.data?[index].processingFee} of the total loan amount',
                                          2),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      _buildTableCell(
                                          'Sanction letter validity', 1),
                                      _buildTableCell('1 Month', 2),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      _buildTableCell('Security Type', 1),
                                      _buildTableCell('Commodity', 2),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                ],
                              ),
                              decoration: BoxDecoration(border: Border.all()),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                'Strictly subject to the Terms and Conditions as update on website apnagodam.com'),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Thanking you',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Accepted By',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'yours truly,',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'M/S..............',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Name of Applicant',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'The terms and condition of the facility are essential and necessary part of the sanction letter',
                                )),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              );
            },
            error: (e, s) => Center(child: Text('Error: $e')),
            loading: () => loader(context),
          ),
      bottomSheet: InkWell(
        onTap: () async {
          // writeOnPdf(sancationLetter);
          await savePdf();

          Directory documentDirectory =
              await getApplicationDocumentsDirectory();
          String documentPath = documentDirectory.path;
          String fullPath = "$documentPath/sanction_letter.pdf";
        },
        child: Container(
          color: primaryColorDark,
          child: Center(
            child: Text(
              'Download PDF',
              style: TextStyle(color: Colors.white),
            ),
          ),
          height: 50,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }

  Widget _buildTableCell(String text, int column) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: column == 1
              ? Border(right: BorderSide(color: Colors.grey, width: 1))
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
