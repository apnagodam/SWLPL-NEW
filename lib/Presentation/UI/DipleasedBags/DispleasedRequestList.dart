import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Domain/Displeased/DispleasedService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/Presentation/utils/DialogUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DispleasRequestListScreen extends ConsumerStatefulWidget {
  const DispleasRequestListScreen({super.key});

  @override
  ConsumerState<DispleasRequestListScreen> createState() =>
      _DispleasedbagsState();
}

class _DispleasedbagsState extends ConsumerState<DispleasRequestListScreen> {
  TextEditingController reasonController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Displedge Request List'),
      ),
      body: ref.watch(displedgeRequestListProvider).when(
          data: (displedgeList) => (displedgeList.data ?? []).isEmpty
              ? noItems('Displedge Requests', context)
              : ListView(
                  children: [
                    ListView.builder(
                      itemCount: displedgeList.data?.length ?? 0,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        DateTime.parse(
                            displedgeList.data?[index].createdAt.toString() ??
                                "");



                        return Container(
                          margin: Pad(all: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: primaryColor),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const Pad(all: 10),
                            child: ColumnSuper(
                                alignment: Alignment.center,
                                children: [
                                  Padding(
                                    padding: Pad(all: 10),
                                    child: Text.rich(TextSpan(
                                        text:
                                            'Terminal Name: ${displedgeList.data?[index].warehouseName}',
                                        style: TextStyle(
                                            color: primaryColorDark,
                                            fontSize: Adaptive.sp(14),
                                            fontWeight: FontWeight.w700))),
                                  ),
                                  Divider(
                                    height: 2,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${displedgeList.data?[index].userName ?? ''}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: Adaptive.sp(14),
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: Pad(all: 10),
                                            child: Text(
                                              '${displedgeList.data?[index].approvalFor ?? '--'}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        Expanded(
                                          child: ColumnSuper(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              Text(
                                                '${displedgeList.data?[index].commodity ?? ''}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                      ]),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // RowSuper(
                                  //     fill: true,
                                  //     alignment: Alignment.center,
                                  //     children: [
                                  //       Text(
                                  //         'T : $differenceInDays days, ${diffrenceInHours > 23 ? 0 : diffrenceInHours} hours, and ${differenceInMinutes > 60 ? 0 : differenceInMinutes} minutes',
                                  //         textAlign: TextAlign.center,
                                  //         style: TextStyle(
                                  //             color: primaryColor,
                                  //             fontSize: Adaptive.sp(14),
                                  //             fontWeight: FontWeight.w800),
                                  //       ),
                                  //     ]),
                                  //     const SizedBox(
                                  //   height: 10,
                                  // ),
                                  // Text(
                                  //   'Notes : ${displedgeList.data?[index].empDisplegeNotes ?? ''}',
                                  //   textAlign: TextAlign.center,
                                  //   style: TextStyle(
                                  //       color: primaryColorDark,
                                  //       fontSize: Adaptive.sp(14),
                                  //       fontWeight: FontWeight.w800),
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  if (displedgeList.data?[index].status == 1)
                                    AnimatedButton(
                                        child: Text(
                                          'Reject',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: Adaptive.sp(14),
                                              fontWeight: FontWeight.w800),
                                        ),
                                        height: 50,
                                        color: primaryColorDark,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        isOutline: true,
                                        isMultiColor: true,
                                        colors: [Colors.red, Colors.red],
                                        borderWidth: 1,
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (dialogContext) =>
                                                  showConfirmAlertDialog(
                                                      context,
                                                      Form(
                                                          key: formKey,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              ElevarmTextInputField(
                                                                label:
                                                                    'Reject Notes',
                                                                hintText: '',
                                                                helperText:
                                                                    'notes for the rejecting amount',
                                                                suffixIconAssetName:
                                                                    Icons.money,
                                                                onTapSuffix:
                                                                    null,
                                                                errorText: null,
                                                                enabled: true,
                                                                maxLines: 5,
                                                                controller:
                                                                    reasonController,
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                          null ||
                                                                      value
                                                                          .isEmpty) {
                                                                    return "This field cant be empty";
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                },
                                                                isRequired:
                                                                    true,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .name,
                                                              ),
                                                            ],
                                                          )),
                                                      "Reject", approve: () {
                                                    if (formKey.currentState!
                                                        .validate()) {
                                                      ref
                                                          .watch(
                                                              displeaseRejectRequestProvider(
                                                        id: "${displedgeList.data?[index].id}",
                                                        notes: reasonController
                                                            .text
                                                            .toString(),
                                                      ).future)
                                                          .then((value) {
                                                        hideLoaderDialog(
                                                            context);
                                                        // Fluttertoast.showToast(
                                                        //     msg: value[
                                                        //         'message']);
                                                        // Navigator.pop;
                                                        reasonController
                                                            .clear();
                                                        ref.invalidate(
                                                            displedgeRequestListProvider);
                                                      }).onError((e, s) {
                                                        hideLoaderDialog(
                                                            context);
                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                    }
                                                  }, reject: () {
                                                    Navigator.of(context).pop();
                                                  }));
                                        })
                                  else if (displedgeList.data?[index].status ==
                                      2)
                                    Text(
                                      'Approve',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: primaryColorDark,
                                          fontSize: Adaptive.sp(14),
                                          fontWeight: FontWeight.w800),
                                    )
                                  else if (displedgeList.data?[index].status ==
                                      0)
                                    Text(
                                      'Reject',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: Adaptive.sp(14),
                                          fontWeight: FontWeight.w800),
                                    ),

                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AnimatedButton(
                                    height: 50,
                                    color: primaryColorDark,
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    isOutline: true,
                                    isMultiColor: true,
                                    colors: [
                                      primaryColorDark,
                                      primaryColorDark
                                    ],
                                    borderWidth: 1,
                                    onTap: () {
                                      showModalBottomSheet(
                                          isScrollControlled: true,
                                          useSafeArea: true,
                                          context: context,
                                          builder: (bottomsheetContext) =>
                                              ElevarmDraggableBottomSheet(
                                                  initialChildSize: 1,
                                                  title: 'Displedge Details',
                                                  onPressedClose: () =>
                                                      Navigator.of(
                                                              bottomsheetContext)
                                                          .pop(),
                                                  children: [
                                                    Text(
                                                      'Terminal Name: ${displedgeList.data?[index].warehouseName ?? ''}',
                                                      textAlign: TextAlign.left,
                                                      style: ElevarmFontFamilies
                                                          .inter(
                                                        color: ElevarmColors
                                                            .neutral,
                                                        fontSize:
                                                            ElevarmFontSizes.sm,
                                                        fontWeight:
                                                            ElevarmFontWeights
                                                                .regular,
                                                      ),
                                                    ),
                                                    ElevarmDivider(),
                                                    Text(
                                                      'User Name: ${displedgeList.data?[index].userName ?? ''}',
                                                      textAlign: TextAlign.left,
                                                      style: ElevarmFontFamilies
                                                          .inter(
                                                        color: ElevarmColors
                                                            .neutral,
                                                        fontSize:
                                                            ElevarmFontSizes.sm,
                                                        fontWeight:
                                                            ElevarmFontWeights
                                                                .regular,
                                                      ),
                                                    ),
                                                    ElevarmDivider(),
                                                    Text(
                                                      'Commodity: ${displedgeList.data?[index].commodity ?? ''}',
                                                      textAlign: TextAlign.left,
                                                      style: ElevarmFontFamilies
                                                          .inter(
                                                        color: ElevarmColors
                                                            .neutral,
                                                        fontSize:
                                                            ElevarmFontSizes.sm,
                                                        fontWeight:
                                                            ElevarmFontWeights
                                                                .regular,
                                                      ),
                                                    ),
                                                    ElevarmDivider(),
                                                    Text(
                                                      'Stack: ${displedgeList.data?[index].stackNo ?? ''}',
                                                      textAlign: TextAlign.left,
                                                      style: ElevarmFontFamilies
                                                          .inter(
                                                        color: ElevarmColors
                                                            .neutral,
                                                        fontSize:
                                                            ElevarmFontSizes.sm,
                                                        fontWeight:
                                                            ElevarmFontWeights
                                                                .regular,
                                                      ),
                                                    ),
                                                    ElevarmDivider(),
                                                    Text(
                                                      'weight: ${displedgeList.data?[index].netWeight ?? ''}',
                                                      textAlign: TextAlign.left,
                                                      style: ElevarmFontFamilies
                                                          .inter(
                                                        color: ElevarmColors
                                                            .neutral,
                                                        fontSize:
                                                            ElevarmFontSizes.sm,
                                                        fontWeight:
                                                            ElevarmFontWeights
                                                                .regular,
                                                      ),
                                                    ),
                                                    ElevarmDivider(),
                                                    Text(
                                                      'Bags: ${displedgeList.data?[index].bags ?? ''}',
                                                      textAlign: TextAlign.left,
                                                      style: ElevarmFontFamilies
                                                          .inter(
                                                        color: ElevarmColors
                                                            .neutral,
                                                        fontSize:
                                                            ElevarmFontSizes.sm,
                                                        fontWeight:
                                                            ElevarmFontWeights
                                                                .regular,
                                                      ),
                                                    ),
                                                    ElevarmDivider(),
                                                    Text(
                                                      'Notes: ${displedgeList.data?[index].notes ?? ''}',
                                                      textAlign: TextAlign.left,
                                                      style: ElevarmFontFamilies
                                                          .inter(
                                                        color: ElevarmColors
                                                            .neutral,
                                                        fontSize:
                                                            ElevarmFontSizes.sm,
                                                        fontWeight:
                                                            ElevarmFontWeights
                                                                .regular,
                                                      ),
                                                    ),
                                                    ElevarmDivider(),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Image: ',
                                                          textAlign:
                                                              TextAlign.left,
                                                          style:
                                                              ElevarmFontFamilies
                                                                  .inter(
                                                            color: ElevarmColors
                                                                .neutral,
                                                            fontSize:
                                                                ElevarmFontSizes
                                                                    .sm,
                                                            fontWeight:
                                                                ElevarmFontWeights
                                                                    .regular,
                                                          ),
                                                        ),
                                                        InstaImageViewer(
                                                            imageUrl:
                                                                '${displedgeList.data?[index].displedgeImage}',
                                                            child: Icon(
                                                              Icons
                                                                  .remove_red_eye,
                                                              color:
                                                                  primaryColorDark,
                                                            ))
                                                      ],
                                                    ),
                                                    ElevarmDivider(),
                                                    Text(
                                                      'Action Notes : ${displedgeList.data?[index].empDisplegeNotes ?? ''}',
                                                      textAlign: TextAlign.left,
                                                      style: ElevarmFontFamilies
                                                          .inter(
                                                        color: ElevarmColors
                                                            .neutral,
                                                        fontSize:
                                                            ElevarmFontSizes.sm,
                                                        fontWeight:
                                                            ElevarmFontWeights
                                                                .regular,
                                                      ),
                                                    ),
                                                    ElevarmDivider(),
                                                    Text(
                                                      'Approval For:${displedgeList.data?[index].approvalFor ?? ''} ',
                                                      textAlign: TextAlign.left,
                                                      style: ElevarmFontFamilies
                                                          .inter(
                                                        color: ElevarmColors
                                                            .neutral,
                                                        fontSize:
                                                            ElevarmFontSizes.sm,
                                                        fontWeight:
                                                            ElevarmFontWeights
                                                                .regular,
                                                      ),
                                                    ),
                                                    ElevarmDivider(),
                                                    Text(
                                                      'Created Date:${displedgeList.data?[index].createdAt ?? ''} ',
                                                      textAlign: TextAlign.left,
                                                      style: ElevarmFontFamilies
                                                          .inter(
                                                        color: ElevarmColors
                                                            .neutral,
                                                        fontSize:
                                                            ElevarmFontSizes.sm,
                                                        fontWeight:
                                                            ElevarmFontWeights
                                                                .regular,
                                                      ),
                                                    ),
                                                    ElevarmDivider(),
                                                  ]));
                                    },
                                    child: Text(
                                      'View Details',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Adaptive.sp(14),
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                        );
                      },
                    )
                  ],
                ),
          error: (e, s) => Text('$e'),
          loading: () => loader(context)),
    );
  }
}