import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Domain/Maintenance/Fumigation/FumigationService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FumigationCleaningScreen extends ConsumerStatefulWidget {
  const FumigationCleaningScreen({
    super.key,
  });

  @override
  ConsumerState<FumigationCleaningScreen> createState() =>
      _LockAndKeyScreenState();
}

class _LockAndKeyScreenState extends ConsumerState<FumigationCleaningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Fumigation'),
        actions: [
          IconButton(
              onPressed: () => context.goNamed('add_fumigation'),
              icon: Icon(Icons.add))
        ],
        foregroundColor: Colors.white,
      ),
      body: ref.watch(fumigationListProvider).when(
          data: (fumigationData) => ListView(
                children: [
                  Container(
                    color: primaryColorDark,
                    padding: const Pad(all: 10),
                    child: IntrinsicHeight(
                      child: Row(children: [
                        Expanded(
                            child: Text(
                          "Terminal Name",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: Adaptive.sp(14)),
                        )),
                        const VerticalDivider(),
                        Expanded(
                            child: Text(
                          "Stack No.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: Adaptive.sp(14)),
                        )),
                        const VerticalDivider(),
                        Expanded(
                            child: Text(
                          "Commodity",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: Adaptive.sp(14)),
                        )),
                        const VerticalDivider(),
                        Expanded(
                            child: Text(
                          "Action",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: Adaptive.sp(14)),
                        )),
                      ]),
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: fumigationData.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Container(
                        color: index % 2 == 0
                            ? Colors.grey.withOpacity(0.2)
                            : Colors.white,
                        padding: const Pad(all: 10),
                        child: IntrinsicHeight(
                          child: Row(children: [
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    // var selectedData =
                                    //     fumigationData.data?[index];

                                    return ElevarmBottomSheet(
                                        initialChildSize: 0.65,
                                        title: 'Fumigation',
                                        onPressedClose: () {
                                          Navigator.pop(context);
                                        },
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text.rich(TextSpan(
                                                      text:
                                                          'Terminal: ${fumigationData.data?[index].warehouseName ?? ""}')),
                                                  SizedBox(height: 10),
                                                  ElevarmDivider(),
                                                  SizedBox(height: 10),
                                                  Text.rich(TextSpan(
                                                      text:
                                                          'Stack No.:  ${fumigationData.data?[index].stackNo ?? ""}')),
                                                  SizedBox(height: 10),
                                                  ElevarmDivider(),
                                                  SizedBox(height: 10),
                                                  Text.rich(TextSpan(
                                                      text:
                                                          'Commodity.:  ${fumigationData.data?[index].commodity ?? ""}')),
                                                  SizedBox(height: 10),
                                                  ElevarmDivider(),
                                                  SizedBox(height: 10),
                                                  Text.rich(TextSpan(
                                                      text:
                                                          'Fumigation Date.:  ${fumigationData.data?[index].date ?? ""}')),
                                                  SizedBox(height: 10),
                                                  ElevarmDivider(),
                                                  SizedBox(height: 10),
                                                  Text.rich(TextSpan(
                                                      text:
                                                          'De-Gas Date:  ${fumigationData.data?[index].deGasDate ?? ""}')),
                                                 SizedBox(height: 10),
                                                  ElevarmDivider(),
                                                  SizedBox(height: 10),
                                                  Text.rich(TextSpan(
                                                      text:
                                                          'Due Date:  ${fumigationData.data?[index].nextDate ?? ""}')),
                                                  SizedBox(height: 10),
                                                  ElevarmDivider(),
                                                  SizedBox(height: 10),
                                                  Text.rich(TextSpan(
                                                      text:
                                                          'Fumigation Agency:  ${fumigationData.data?[index].fumiAgency ?? ""}')),
                                                  SizedBox(height: 10),
                                                  ElevarmDivider(),
                                                  SizedBox(height: 10),
                                                  Text.rich(TextSpan(
                                                      text:
                                                          'Dose:  ${fumigationData.data?[index].dose ?? ""}')),
                                                  SizedBox(height: 10),
                                                  ElevarmDivider(),
                                                  SizedBox(height: 10),
                                                  Row(children: [
                                                    Text('Service Slip :- '),
                                                    fumigationData.data?[index]
                                                                    .image ==
                                                                null ||
                                                            fumigationData
                                                                .data?[index]
                                                                .image
                                                                .isEmpty
                                                        ? Icon(
                                                            Icons
                                                                .remove_red_eye,
                                                            color: Color(
                                                                0xff1107173),
                                                          )
                                                        : InstaImageViewer(
                                                            child:
                                                                Image.network(
                                                              '${fumigationData.data?[index].image}',
                                                              fit: BoxFit.contain,
                                                              height: 40,
                                                              loadingBuilder: (
                                                                BuildContext
                                                                    context,
                                                                Widget child,
                                                                ImageChunkEvent?
                                                                    loadingProgress,
                                                              ) {
                                                                if (loadingProgress ==
                                                                    null) {
                                                                  return child;
                                                                } else {
                                                                  return Center(
                                                                    child:
                                                                        CircularProgressIndicator(),
                                                                  );
                                                                }
                                                              },
                                                              errorBuilder: (
                                                                BuildContext
                                                                    context,
                                                                Object error,
                                                                StackTrace?
                                                                    stackTrace,
                                                              ) {
                                                                return Icon(
                                                                  Icons
                                                                      .image_not_supported_outlined,
                                                                  color: Colors
                                                                      .red,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                  ]),
                                                  SizedBox(height: 10),
                                                  ElevarmDivider(),
                                                  SizedBox(height: 10),
                                                  Text.rich(TextSpan(
                                                      text:
                                                          'Dose:  ${fumigationData.data?[index].remark ?? ""}')),
                                                  SizedBox(height: 10),
                                                  ElevarmDivider(),
                                                  SizedBox(height: 10),
                                                  Text.rich(TextSpan(
                                                      text:
                                                          'Generated By:  ${fumigationData.data?[index].userName ?? ""}')),
                                                  SizedBox(
                                                    height: 10,
                                                    child: Divider(),
                                                  ),
                                                  SizedBox(height: 10),
                                                  ElevarmDivider(),
                                                  SizedBox(height: 10),
                                                ],
                                              ),
                                            ),
                                          )
                                        ]);
                                  },
                                );
                              },
                              child: Text(
                                "${fumigationData.data?[index].warehouseName ?? "--"}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: primaryColorDark,
                                    fontSize: Adaptive.sp(14)),
                              ),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              "${fumigationData.data?[index].stackNo ?? "--"}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              "${fumigationData.data?[index].commodity ?? "--"}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: fumigationData.data?[index].deGasDate ==
                                        null
                                    ? MaterialButton(
                                        color: primaryColorDark,
                                        onPressed: () {
                                          ElevarmConfirmAlertDialog(
                                                  title: 'Confirmation Dialog',
                                                  subtitle:
                                                      'Are you sure you want to submit Degas',
                                                  onPositiveButton: () {
                                                    showLoaderDialog(context);

                                                    ref
                                                        .watch(updateDegasProvider(
                                                                id: "${fumigationData.data?[index].id}")
                                                            .future)
                                                        .then((value) {
                                                      hideLoaderDialog(context);
                                                      if (value['status']
                                                              .toString() ==
                                                          "1") {
                                                        ref.invalidate(
                                                            fumigationListProvider);
                                                      }
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                                  },
                                                  onNegativeButton: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  positiveText: 'yes',
                                                  negativeText: 'no',
                                                  variant: ElevarmDialogVariant
                                                      .basic)
                                              .show(context);
                                        },
                                        child: Text(
                                          'De-Gas',
                                          style: GoogleFonts.roboto(
                                              fontSize: 12.10,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    : Center(
                                        child: Text(
                                          '${fumigationData.data?[index].deGasDate ?? "--"}',
                                          style: GoogleFonts.roboto(
                                              fontSize: 12.10,
                                              color: primaryColorDark,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )),
                          ]),
                        ),
                      );
                    },
                  )
                ],
              ),
          error: (e, s) => Text('$e'),
          loading: () => voucherListShimmer()),
    );
  }
}
