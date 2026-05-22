// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:emp_apnagodam/Data/Models/SmeTowPdfModal.dart';
import 'package:emp_apnagodam/Domain/SanctionLimit/SanctionLimitService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class SMETwoPDFScreen extends ConsumerStatefulWidget {
  const SMETwoPDFScreen({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  ConsumerState<SMETwoPDFScreen> createState() => _LockAndKeyScreenState();
}

class _LockAndKeyScreenState extends ConsumerState<SMETwoPDFScreen> {
  final pdf = pw.Document();

  void writeOnPdf(SmeTowPdfModal smeTow) {
    pdf.addPage(
      pw.MultiPage(
          pageFormat: PdfPageFormat.a3,
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Header(
                child: pw.Align(
                  alignment: pw.Alignment.center,
                  child: pw.Text('SME-2',
                      textScaleFactor: 2,
                      textAlign: pw.TextAlign.center,
                      style: pw.TextStyle()),
                ),
              ),
              pw.Padding(padding: const pw.EdgeInsets.all(10)),
              ...?smeTow.data?.map((data) {
                var decodedData = _isValidJson(data.bankTenor)
                    ? jsonDecode(data.bankTenor)
                    : null;
                return pw.Column(children: [
                  pw.Container(
                    child: pw.Column(children: [
                      pw.Text(
                        'AGREEMENT OF LOAN-CUM-HYPOTHECATION',
                        style: pw.TextStyle(
                            decoration: pw.TextDecoration.underline,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Divider(),
                      pw.Text(
                          '(To be stamped as an Agreement+ Hypothecation + Indemnity +General Power of Attorney)',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      pw.Divider(),
                      pw.Table(
                        border: pw.TableBorder.all(),
                        children: [
                          pw.TableRow(children: [
                            pw.Container(
                                margin: pw.EdgeInsets.all(10),
                                child: pw.Text('1 ',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold))),
                            pw.Container(
                                margin: pw.EdgeInsets.all(10),
                                child: pw.Text('Date of execution ',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold))),
                            pw.Container(
                              margin: pw.EdgeInsets.all(10),
                              child: pw.Text('${data.executionDate}',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                          ]),
                        ],
                      ),
                      pw.Table(
                        border: pw.TableBorder.all(),
                        children: [
                          pw.TableRow(children: [
                            pw.Container(
                                margin: pw.EdgeInsets.all(10),
                                child: pw.Text('2 ',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold))),
                            pw.Container(
                                margin: pw.EdgeInsets.all(10),
                                child: pw.Text('Place of execution ',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold))),
                            pw.Container(
                              margin: pw.EdgeInsets.all(10),
                              child: pw.Text('Jaipur',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                          ]),
                        ],
                      ),
                      pw.Table(
                        border: pw.TableBorder.all(),
                        children: [
                          pw.TableRow(children: [
                            pw.Container(
                                margin: pw.EdgeInsets.all(10),
                                child: pw.Text('3 ',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold))),
                            pw.Container(
                                margin: pw.EdgeInsets.all(10),
                                child: pw.Text('Name/s of the Borrower(s)',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold))),
                            pw.Container(
                              margin: pw.EdgeInsets.all(10),
                              child: pw.Text('${data.userName}',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                          ]),
                        ],
                      ),
                      pw.Table(
                        border: pw.TableBorder.all(),
                        children: [
                          pw.TableRow(children: [
                            pw.Container(
                                margin: pw.EdgeInsets.all(10),
                                child: pw.Text('4 ',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold))),
                            pw.Container(
                                margin: pw.EdgeInsets.all(10),
                                child: pw.Text(
                                    'Address/s of the Borrower(s)\nTelephone\nEmail ID',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold))),
                            pw.Container(
                              margin: pw.EdgeInsets.all(10),
                              child: pw.Text(
                                  '${data.userAddress}\n' +
                                      '${data..userPhone}\n${data.userEmail}',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                          ]),
                        ],
                      ),
                      pw.Table(
                        border: pw.TableBorder.all(),
                        children: [
                          pw.TableRow(children: [
                            pw.Container(
                                margin: pw.EdgeInsets.all(10),
                                child: pw.Text('5 ',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold))),
                            pw.Container(
                                margin: pw.EdgeInsets.all(10),
                                child: pw.Text(
                                    'Date of Borrower(s) application ',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold))),
                            pw.Container(
                              margin: pw.EdgeInsets.all(10),
                              child: pw.Text('${data.applicationDate}',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                          ]),
                        ],
                      ),
                      pw.Table(
                        border: pw.TableBorder.all(),
                        children: [
                          pw.TableRow(children: [
                            pw.Container(
                                margin: pw.EdgeInsets.all(10),
                                child: pw.Text('6 ',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold))),
                            pw.Container(
                                margin: pw.EdgeInsets.all(10),
                                child: pw.Text(
                                    'Full Name/s of the Borrower(s) ',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold))),
                            pw.Container(
                              margin: pw.EdgeInsets.all(10),
                              child: pw.Text('${data.userName}',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                          ]),
                        ],
                      ),
                      pw.Table(
                        border: pw.TableBorder.all(),
                        children: [
                          pw.TableRow(children: [
                            pw.Container(
                                margin: pw.EdgeInsets.all(10),
                                child: pw.Text('7 ',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold))),
                            pw.Container(
                                margin: pw.EdgeInsets.all(10),
                                child: pw.Text(
                                    'Name and full address of the Lender',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold))),
                            pw.Container(
                              margin: pw.EdgeInsets.all(10),
                              child: pw.Text(
                                  '${data.bankName}, ${data.bankAddress} ',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                          ]),
                        ],
                      ),
                      pw.Table(
                        border: pw.TableBorder.all(),
                        children: [
                          pw.TableRow(children: [
                            pw.Container(
                                margin: pw.EdgeInsets.all(10),
                                child: pw.Text('8 ',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold))),
                            pw.Container(
                                margin: pw.EdgeInsets.all(10),
                                child: pw.Text('Aggregate limits sanctioned ',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold))),
                            pw.Container(
                              margin: pw.EdgeInsets.all(10),
                              child: pw.Text('${data.approvedAmount}',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                          ]),
                        ],
                      ),
                    ]),
                    decoration: pw.BoxDecoration(border: pw.Border.all()),
                  ),
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

      file = File('${downloadDirectory}/sme_tow.pdf');

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
        title: Text('SME-2 PDF'),
        foregroundColor: Colors.white,
      ),
      body: ref.watch(smetowPdfProvider(id: '${widget.id}')).when(
            data: (SmeTowPdfModal smeTow) {
              // writeOnPdf(smeTow);

              return ListView(
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: smeTow.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: Column(
                          children: [
                            Text(
                              'SME-2',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              child: Column(children: [
                                Text(
                                  'AGREEMENT OF LOAN-CUM-HYPOTHECATION',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold),
                                ),
                                Divider(),
                                Text(
                                    '(To be stamped as an Agreement+ Hypothecation + Indemnity +General Power of Attorney)',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Divider(),
                                Table(
                                  border: TableBorder.all(color: Colors.black),
                                  children: [
                                    TableRow(children: [
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text('1 ',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text('Date of execution ',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: Text(
                                            '${smeTow.data?[index].executionDate}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ]),
                                  ],
                                ),
                                Table(
                                  border: TableBorder.all(color: Colors.black),
                                  children: [
                                    TableRow(children: [
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text('2 ',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text('Place of execution ',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: Text('Jaipur',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ]),
                                  ],
                                ),
                                Table(
                                  border: TableBorder.all(color: Colors.black),
                                  children: [
                                    TableRow(children: [
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text('3 ',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text(
                                              'Name/s of the Borrower(s)',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: Text(
                                            '${smeTow.data?[index].userName}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ]),
                                  ],
                                ),
                                Table(
                                  border: TableBorder.all(color: Colors.black),
                                  children: [
                                    TableRow(children: [
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text('4 ',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text(
                                              'Address/s of the Borrower(s)\nTelephone\nEmail ID',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: Text(
                                            '${smeTow.data?[index].userAddress}\n' +
                                                '${smeTow.data?[index].userPhone}\n${smeTow.data?[index].userEmail}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ]),
                                  ],
                                ),
                                Table(
                                  border: TableBorder.all(color: Colors.black),
                                  children: [
                                    TableRow(children: [
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text('5 ',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text(
                                              'Date of Borrower(s) application ',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: Text(
                                            '${smeTow.data?[index].applicationDate}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ]),
                                  ],
                                ),
                                Table(
                                  border: TableBorder.all(color: Colors.black),
                                  children: [
                                    TableRow(children: [
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text('6 ',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text(
                                              'Full Name/s of the Borrower(s) ',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: Text(
                                            '${smeTow.data?[index].userName}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ]),
                                  ],
                                ),
                                Table(
                                  border: TableBorder.all(color: Colors.black),
                                  children: [
                                    TableRow(children: [
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text('7 ',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text(
                                              'Name and full address of the Lender',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: Text(
                                            '${smeTow.data?[index].bankName}, ${smeTow.data?[index].bankAddress} ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ]),
                                  ],
                                ),
                                Table(
                                  border: TableBorder.all(color: Colors.black),
                                  children: [
                                    TableRow(children: [
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text('8 ',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text(
                                              'Aggregate limits sanctioned ',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: Text(
                                            '${smeTow.data?[index].approvedAmount}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ]),
                                  ],
                                ),
                              ]),
                              decoration: BoxDecoration(border: Border.all()),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                '(The expression "the Borrower(s)" wherever the context permits shall include Proprietor/s, Partners in a partnership firm, Coparceners of a Joint Hindu family, Trustees of a Trust, Society, Company and its/his/her/their respective heirs, executors, administrators, legal representatives, authorised persons, successors and assigns and the expression "the Lender/Branch" shall include its successors and assigns)')
                            // Text('${smeTow.data?[index].applicationDate}')
                            ,
                            Text(
                                "WHEREAS at the request of the Borrower(s), the Lender has granted or agreed to grant or continue certain credit facilities for the purpose of business/s set out in the Borrower(s)'s application and subsequent correspondence thereto (referred to as the 'Borrower's proposal') by way of working capital / fixed capital / flexible loans / foreign currency loans or such other loans / facilities upon execution of documents and creation of securities stipulated in the Letter of Arrangement in the manner and on the terms and conditions hereinafter appearing."),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'NOW IN CONSIDERATION OF THE PREMISES it is agreed by the Borrower(s) hereto as follows: -',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                '1.(a) The Lender, at its discretion may grant or agree to grant or continue, all or any of the credit facilities now or hereafter at any time or from time-to-time up to the abovementioned aggregate limit'),
                            Text(
                                "- the details as to the facilities, limits, interest, rests and terms of repayment are morespecifically mentioned in SCHEDULE-A hereunder written, for the purpose(s) set forth in the Borrower's proposal, which shall be deemed to constitute the basis and part of these presents. The Borrower(s) hereby warrants the correctness of every one of the statements, representations and undertakes to carry out the Borrower's proposal as set out in its entirety with a further undertaking to notify the Lender in writing of any deviations or modifications thereto immediately upon such occurrence. The credit facilities granted or agreed to be granted or continued, now or hereafter by the Lender (hereinafter referred to as the said facilities) shall be availed / utilized exclusively by the Borrower(s) for no purposes other than those mentioned in the Borrower(s)’s proposal"),
                            Text(
                                '2.(a) The Borrower(s) shall pay interest in respect of each of the said facilities at the rates, rests and percentages per annum equal to, as stipulated in Schedule A hereunder or otherwise OR at such rates and rests as may be fixed by the Lender from time to time duly compounded subject to enhancement / revision as hereinafter provided. The interest shall be calculated on the respective daily balances of the amounts under the said facilities and debited thereto on the last working day of the month or quarter or half year as the case may be and compounded at the end of such month or quarter or half-year according to the practices of the Lender. Notice regarding change or the revision in rate of interest and charging of overdue interest is expressly hereby waived by the Borrower(s).'),
                            Text(
                                '(b) The Borrower(s) agrees that the facilities granted and agreed to be granted or continued shall be governed by the terms and conditions as set out in the Letter of Arrangement as also herein. contained as well as those embodied in the relative security documents.\n '),
                            Text(
                                '(b) Without prejudice to the above, the Lender shall also be entitled to charge at its own discretion enhanced rate of interest for any irregularity or breach of the terms or any change in the credit rating hereunder. The borrower agrees to pay such enhanced rate without any demur and such charging shall be without prejudice to the other remedies hereunder or by law to proceed further against the Borrower(s) and or the securities created.'),
                            Text(
                                '3. The Borrower(s) agrees that any or every change in the rates or rests of interest notified by the Lender in their Web-Site or Notice Boards or in newspapers or made through any entries in the statement of account sent to the Borrower(s)/s shall be a suﬃcient notice of such change and be binding on the Borrower(s). The Borrower(s) further acquiesces to the accounting practices of the Lender in this behalf'),
                            Text(
                                '''4. The Borrower(s) expressly agrees that the said facilities or the terms thereof may be revised or cancelled at the Lender’s discretion for any reason whatsoever such as Lender's policy or Borrower(s) conduct of the accounts and the Borrower(s) hereby agrees to repay all the monies at once due to the Lender and or abide by such new or revised terms and conditions.'''),
                            Text(
                                '''5.(a) The Borrower(s) shall pay all the balances owing and outstanding under or at the foot of the accounts under or in respect of the said facilities on demand inclusive of interest compounded monthly or quarterly or half-yearly as the case may be upto the date of payment including accrued but unapplied interest together with all service charges, commitment charges, overdue / enhanced rate of interest, costs, charges and expenses (including the legal costs between the client and advocate on full indemnity basis) and all such monies debited or accrued in the accounts in respect of the said facilities immediately upon demand being made by the Lender or in accordance with the terms stipulated for each of the said facilities as the case may be.'''),
                            Text(
                                '''(b) Without prejudice to the above, in the case of Term Loan facility the Borrower(s) shall repay the amounts of the said Term Loan by monthly or quarterly or half yearly or yearly instalments as stipulated by the Lender. Notwithstanding anything contained herein. or in any law for the time being in force, the Lender may at the request of the Borrower(s), permit or has permitted the Borrower(s) to avail the Term Loan facility either in one lumpsum or in stages as and when the same is requested. Each such portion of the availed Term Loan will be debited to the Term Loan facility and the number of instalments and the amounts in respect of each of the instalments will be intimated to theBorrower(s) by means of a separate communication at the time of disbursal of each portion of the availed Term Loan, each of which communications and the letter/s of request of theBorrower(s) shall become part of these presents upon such issuance and the Borrower(s)hereby agrees to be bound by the terms and conditions stipulated therein by the Lender.'''),
                            Text(
                                '''6.(a) In the case of Open Term Loan facility, the Borrower(s) shall be required to avail and utilise the said facility within such period from the date of its sanction (referred to as ’the currency of sanction') and for such specified purposes as may be expressly stipulated in the Letter of Arrangement by the Lender, provided however that the Borrower(s) shall have the lexibility or the option to avail the said Term Loan either in one lumpsum or in stages or at such intervals or at multiple times as the Borrower(s) may desire subject to strict compliance or adherence to the stipulation as to the maximum time limit of the prescribed period and to the aggregate limit in the said facility. (b) The Borrower(s) expressly agrees that in the event of / in case the limits or portions of the said facility have been / are partially availed and utilized or remain unutilized within the prescribed period, then and in that event, the limit itself or such portion of the unutilized portion of the limit in the said facility shall expire and be not available to the Borrower(s) to any intent and for any purpose of whatsoever nature including the specified purposes prescribed in the Letter of Arrangement. (c) The Borrower(s) acknowledges and agrees that the Lender is / shall be at liberty to eﬀect disbursements in the said facility for each component of the sanction corresponding / relating to each of the specified purposes, as sub-limits or loans and such installment disbursements shall, in case the Lender so chooses, be treated as though such incremental disbursements are individual loans for its accounting purposes / practices and in all such cases the period of'''),
                            Text(
                                '''repayment for each such sub-limits or loans shall commence from the date of respective disbursements for each sub-limits or loans. Notwithstanding the above discretion of th nLender, the Lender may also with the consent of the Borrower(s) combine and constitute all sub-limits or loans as one limit or loan by rearranging or rescheduling the repayment schedules of such sub-limits and loans at the end of the currency of sanction in such manner that the maximum period of repayment shall not exceed the period prescribed in the Letter of Arrangement. (d) The Borrower(s) agrees that in the case of multiple disbursals of the said facility, the instalments for each purpose of disbursements and the amounts in respect of each instalment and the number of instalments will be intimated to the Borrower(s) by the Lender, by separate communications or exchange of letters in this behalf between the Lender and Borrower(s), each of which communications and letter/s of request of the Borrower(s) or the aforesaid said letters exchanged shall become part of these presents and the Borrower(s) hereby agrees to be bound by the terms and conditions stipulated therein by the Lender in such manner that the maximum period of repayment shall not exceed the period stipulated in the Letter of Arrangement.'''),
                            Text(
                                '''7. The Borrower(s) hereby agrees that all present and future stocks, raw materials, goods, book- debts, and vehicles and all other movable assets of the Borrower(s) including receivables, documents of title to goods, outstanding monies, bills, invoices documents,contracts, insurance policies, guarantees, engagements, securities, investments and rights and the present machinery listed in SCHEDULE- B hereunder and all the future machinery belonging to or in the possession or control of the Borrower(s) wherever lying, stored and kept and whether in possession of the Borrower(s) or of the Lender or of any third party whether in India or elsewhere including all such goods, vehicles, other movable assets as may be in the course of shipment, transit or delivery and all the machinery, vehicles, and other equipment items of whatever nature acquired by the Borrower(s) pursuant or subsequent to these presents hereby agreed to be furnished in Form SME- 2.A (hereinafter collectively referred to as "the said assets") shall stand hypothecated to the Lender by way of first charge as security for the due repayment and discharge by the Borrower(s) to the Lender on demand of all the monies, at any time payable by the Borrower(s) under or in respect of the said facilities and whether for principal, interest, service charges, commitment charges, commission, discount or for costs, charges and expenses or all other monies payable hereunder or in respect of any liability undertaken by the Lender for the Borrower(s) and / or which may be incurred by the Lender and also for the due observance, performance and discharge of all obligations arising hereunder Provided however, that where the Lender has at the specific request of the Borrower/s and in its sole discretion communicated in writing to the Borrower/s that in respect of any specific facility/limit, this charge by way of hypothecation will not operate, such facility/limit shall be deemed as not having been secured by hypothecation by the Borrower/s as stated hereinabove notwithstanding the incorporation such specific facility/limit in the Schedules hereunder written.'''),
                            Text(
                                '''8. That all the said assets hereunder secured are the absolute property of the Borrower(s) at its sole disposal and free from any prior encumbrances, attachments, charges and that all further assets that may be secured shall likewise be unencumbered, absolute and disposable property of the Borrower(s). The Borrower(s) further confirms that the said assets are not subject matter of any proceedings or attachments under the Income Tax Act 1961 or any Sales Tax laws or under any other like fiscal laws for the time being in force'''),
                            Text(
                                '''9. The Lender shall not in any way be responsible for the quantity, quality, weight, value and final condition of the said assets when they come into its possession and / or for any loss, destruction or deterioration or damage occasioned by theft, pilferage, robbery, fire, riots and civil commotion, malicious damages or howsoever may arise including any act, negligence, omission, default of the oﬃcers of the Lender or its agents.'''),
                            Text(
                                '''10. The Borrower(s) hereby agrees that notwithstanding anything contained herein. or in any other documents, the entire balances then due under the said facilities shall, if so decided by the Lender, become forthwith due and payable upon the happening of any of the following events and the Lender shall be entitled to enforce its security: (a) Any instalment of the principal or interest remaining unpaid and in arrears for a period of one month after the due date whether demanded or not; (b) The borrower committing any breach or default in the performance or observance of any of the terms contained herein. or in the Borrower(s)’s proposal or any other documents; (c) If any of the representations or the documents furnished by the Borrower(s) in its  application are found to be untrue or false or incorrect, (d) Upon entering into any arrangement or composition with its creditors or committing any act of insolvency; e) Any execution or other similar process being levied or enforced against the borrower; (f) If an order is made or a resolution passed for the winding up or a petition of winding up is filed or notice of meeting to pass such a resolution is issued; (g) A receiver being appointed for all or any part of the borrower’s property; (h) If the borrower ceases to carry on business or threatens not to carry on business; (i) If any circumstances shall occur which in the opinion of the Lender is prejudicial to or imperils or is likely to prejudice or imperil the security or which aﬀects adversely the Borrower(s)'s capacity to repay any amounts under the said facilities; (j) If the Borrower(s) does not submit the required statements or misutilises / diverts the monies or the said assets without the Lender’s prior permission / knowledge; Whether any of the above events has happened or not, the decision of the Lender shall be conclusive, final and binding on the Borrower(s). PROVIDED ALWAYS THAT the Lender may in its discretion refrain from forthwith enforcing its rights hereunder inspite of the happening of any of the above events and provided further that any failure or delay in exercising any right, power or privilege hereunder or under other security documents or any single or partial exercise of such right, power, or privilege shall not impair / extinguish or preclude the Lender any further exercise of the same or operate as a waiver or exercise of any other power or right or privilege. The rights and remedies of the Lender are only cumulative and not exclusive.'''),
                            Text(
                                '''11. The Lender and its nominees shall without notice but at the Borrower(s)'s risk and expenses and as its Attorney, be entitled to enter any place where the said assets, books of accounts, vouchers, records, other documents relating thereto may be and inspect, value, dispose and / or take particulars of all or any part of the said assets and also on any default of the Borrower(s) in payment of any money hereby secured or the performance of any obligation or breach of any terms of this Agreement or terms of sanction or the occurrence of any circumstances which in the opinion of the Lender endangers or is prejudicial to or imperil the security hereby created to take charge of, seize, recover, remove, receive all or any part of the said assets and also all the books of accounts, vouchers, records and other documents relating thereto and thereupon either forthwith or at any time to sell, realize, dispose of and deal with in any manner including by public auction or tender or private contract and whether with or without intervention of the Court all or any part of the said assets and upon such terms as the Lender may deem fit.'''),
                            Text(
                                ''' 12. The Borrower(s) shall at all times indemnify and keep indemnified the Lender from and  against all suits, proceedings, costs, charges, claims and demands whatsoever that may at any time arise or be brought or made by any person against the Lender in respect of any acts, matters and things lawfully done or caused to be done in connection with the said assets. to do all things as are necessary and which the Borrower(s) himself would do if personally present, for all and any of the purposes aforesaid to appoint a substitute or substitutes'''),
                            Text(
                                '''13.(a) The Borrower(s) irrevocably constitutes and appoints the Lender to be its Attorney to do and execute for and in the name and on behalf of the Borrower(s) all or any of the acts , deeds and things that is to say to take over and carry on the business , to sign, register, file any applications, forms , contracts , agreements , transfers , acceptances , receipts , and any other documents and to demand , receive, sign and endorse all negotiable instruments, debts , dividends, mandates or other orders of payment of money by whatever nature or delivery , of property, to transfer or realize or deal with any goods , machinery and other movables or immovables , to appoint selling agents, to appoint proxies for voting in the meeting of any company in which the Borrower(s) hold any shares , debentures , stocks, etc.., to attend and represent before any authority or tribunal and for the purpose to sign , execute and deliver all such documents and make all such declarations as may be necessary , generally to act in the premises as fully and eﬀectually with all intents and purposes and to do all things as are necessary and which the Borrower(s) himself would do if personally present, for all and any of the purposes aforesaid to appoint a substitute or substitutes. (b) . The Borrower(s) hereby ratifies and confirms all the acts, things, deeds performed or to be performed by the Lender or its nominee or its substitutes in pursuance of any of the aforesaid powers “and the powers hereby conferred shall not be determined or aﬀected by the fact of the Borrower(s) acting personally or through another in the premises. (c) The aforesaid powers which may be exercised by the Lender in its sole discretion but not obliged to do so shall subsist in favour of the Lender till all the dues are paid by the Borrower(s).'''),
                            Text(
                                ''' 14. The Borrower(s) agrees and gives consent without any demur or protestation that (a) In the event of default in repayment of any monies or in the performance or breach of any terms or obligations, the Lender and / or the Reserve Lender of India or any other authorized agency will have an absolute discretion or unqualified right, power and authority to disclose or publish names of the borrower(s) and or its directors / partners /oﬃce bearers / constituents / members as DEFAULTER in such manner as they think fit; (b) the Credit Information Bureau (India) Ltd. or any other authorized agency may use, process, publish or furnish for consideration or otherwise the information disclosed and / or data or products prepared. by them to any person, and to other credit granters and confirms that the  Borrower(s) shall not raise any dispute whatsoever in that behalf in all respects and to all intents.'''),
                            Text(
                                '''15. The Borrower(s) agrees that it shall not induct any person/s who is a director on the Board of a company which is/has been identified as a willful defaulter and that in case such a person is found to be on the Board of the Borrower(s), it would at once take expeditious and eﬀective steps for removal of such person/s from its Board.'''),
                            Text(
                                '''16. This Agreement is a continuing security for all the amounts advanced to the Borrower(s) under the said facilities as also for all interest, costs, charges, expenses and / or other monies, indebtedness and liabilities which may from time to time become due and remain unpaid to the Lender hereunder and shall not be determined or be aﬀected by any account/s becoming nil or coming into credit or being closed at any time or fluctuations or partial payments in any accounts and / or fresh account/s being opened in respect of fresh / revised facilities granted /being granted to the Borrower(s).'''),
                            Text(
                                ''' 17. The Lender shall be entitled to adjust, appropriate or set-oﬀ or exercise lien of or on all monies, securities, goods, instruments held to the credit or for the benefit of the Borrower(s) on any account or coming into the control or possession of the Lender in any of its branches whether for any specified purpose or otherwise, with or without any particular mandate and whether singly or jointly, towards the discharge and satisfaction of the liability of the Borrower(s).'''),
                            Text(
                                '''18. The Borrower(s) shall be liable to the Lender notwithstanding any change in the legal status or constitution of the Borrower(s) whether by way of amalgamation, merger, takeover, dissolution, winding up, insolvency, nationalization or otherwise howsoever either by operation of law or by act of the parties but shall remain in full force and be valid and enforceable against the Borrower(s) including the entities who shall come into existence upon such change or constitution as if they were the parties to these presents since its inception till full discharge of all the obligations or payments to the Lender.'''),
                            Text(
                                ''' 19. if the Borrower(s) be more than one individual or entity, each one or any of them is hereby authorised by the others of them to admit and acknowledge their liability to the Lender by any payment into the account or by way of writing or in any manner otherwise and any such acknowledgement of liability or part payment by any one or more of them shall in addition to his / their personal capacity be deemed to have been made on beha'''),
                            Text(
                                ''' 20. The Borrower(s) agrees that the terms and conditions contained herein. and/or the security created on the said assets shall ensure, extend, subsist and be valid and enforceable for the entire aggregate limit including any of the facilities/limits and/or the new facilities/limits within the aggregate limit not intended to be so specifically covered by the securities herein, notwithstanding anything contained to the contrary in any of the relative documents or the granting of increased or totally new facilities/limits or fresh accounts being opened in respect of existing/revised facilities or accounts coming into credit or inter- changeability or cancellation of certain facilities/limits within the aggregate limit granted or agreed to be granted or continued by the Lender to the Borrower(s) by/under these presents.'''),
                            Text(
                                '''21. Nothing herein contained shall prejudice any rights or remedies of the Lender in respect of any other present or future security, guarantee, obligation or decree for any indebtedness or liability of the Borrower(s) to the Lender.'''),
                            Text(
                                ''' 22. The Borrower/s hereby gives free and unambiguous consent for the said facilities granted or agreed to be granted or continued as stated hereinabove by the Lender to the Borrower/s being recovered as a public demand/money in terms of any Legislation relating to recoveries thereof, where such consent is necessary under such legislation'''),
                            Text(
                                '23. Any demand or notice to be made or given to the Borrower(s) hereto may be made or given by Facsimile (Fax), Courier or by leaving The same at or by registered post acknowledgement in an envelope addressed to the Borrower(s) at the address mentioned hereinabove and any / every such demand or notice shall be deemed to have been received as the case may be at which it was left or at which it would have been delivered in the ordinary course of post at the above address.'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'SCHEDULE A HEREINABOVE REFERRED TO',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'THE FACILITIES WITH THE LIMITS GRANTED / AGREED TO BE GRANTED OR CONTINUED',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'BY THE LENDER IN TERMS OF THESE PRESENTS',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'WORKING CAPITAL FACILITIES:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Table(
                              border: TableBorder.all(color: Colors.black),
                              children: [
                                TableRow(children: [
                                  Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text('S.NO. ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text('Name of the facility ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text('Limit (Rupees in lacs) ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text('Rate of Interest (%)',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ]),
                                TableRow(children: [
                                  Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text('1',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                          'Warehouse Receipt Financing ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text(
                                        '${smeTow.data?[index].financeAmount}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text(
                                        '${smeTow.data?[index].interestRate}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ]),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: Text(
                                    'All the above facilities with the limits are payable on demand'),
                              ),
                              decoration: BoxDecoration(border: Border.all()),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('OPEN TERM LOAN',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Loan Amount = 2500000 RS.',
                                  style: TextStyle()),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text('Tenure = 9 Months',
                                    style: TextStyle())),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Vernacular Declarations',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                  'The contents of the document have been explained to me .and I/we have understood the same.',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                  'IN WITNESS WHEREOF the Borrower and Lender has here into put his hand and seal on this agreement:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Borrower',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('Lender',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('................................',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('.................................',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 100,
                  )
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
          String fullPath = "$documentPath/sme_tow.pdf";
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

}
