import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Data/Models/ApproverModel.dart';
import 'package:emp_apnagodam/Data/Models/DispleasedCommodityModel.dart'
    as commodity;
import 'package:emp_apnagodam/Data/SharedPrefs/SharedUtility.dart';
import 'package:emp_apnagodam/Domain/Displeased/DispleasedService.dart';
import 'package:emp_apnagodam/Presentation/UI/Attendance/InAppCameraModule.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../../Data/Models/DispleasedStackModel.dart' as stack;
import '../../../Data/Models/DispleasedTerminalModel.dart' as user;
import '../../../Data/Models/TerminalModel.dart' as terminal;
import '../../Constants/ColorConstant.dart';
import '../../Widgets/widgets.dart';

class Displeasedbags extends ConsumerStatefulWidget {
  const Displeasedbags({super.key});

  @override
  ConsumerState<Displeasedbags> createState() => _DispleasedbagsState();
}

class _DispleasedbagsState extends ConsumerState<Displeasedbags> {
  TextEditingController searchController = TextEditingController();

  TextEditingController netWeightController = TextEditingController();
  TextEditingController totalBagsController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: Text('Add Displeased Bags'),
        ),
        body: displeasedBagsLayout(context, ref),
      ),
    );
  }

  displeasedBagsLayout(BuildContext context, WidgetRef ref) => Padding(
      padding: Pad(all: 10),
      child: ref.watch(terminalsProvider).when(
          data: (data) => ListView(
                children: [
                  ref
                      .watch(displeasedUsersProvider(
                          terminalId:
                              "${ref.watch(sharedUtilityProvider).getUser()?.terminal}"))
                      .when(
                          data: (data) => SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<user.Datum>(
                                    isExpanded: true,
                                    hint: Text(
                                      'Select User',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    items: data.data!
                                        .map((item) => DropdownMenuItem(
                                              value: item,
                                              child: Text(
                                                item.fname ?? "",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    value: ref.watch(usersProvider),
                                    onChanged: (value) {
                                      ref.watch(usersProvider.notifier).state =
                                          value;
                                      ref.invalidate(commodityProvider);
                                      ref.invalidate(stackProvider);
                                    },
                                    buttonStyleData: const ButtonStyleData(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          border: Border(
                                              top: BorderSide(
                                                  color: primaryColor),
                                              bottom: BorderSide(
                                                  color: primaryColor),
                                              left: BorderSide(
                                                  color: primaryColor),
                                              right: BorderSide(
                                                  color: primaryColor))),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      height: 40,
                                      width: 200,
                                    ),
                                    dropdownStyleData: const DropdownStyleData(
                                      maxHeight: 200,
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                    ),
                                    dropdownSearchData: DropdownSearchData(
                                      searchController: searchController,
                                      searchInnerWidgetHeight: 50,
                                      searchInnerWidget: Container(
                                        height: 50,
                                        padding: const EdgeInsets.only(
                                          top: 8,
                                          bottom: 4,
                                          right: 8,
                                          left: 8,
                                        ),
                                        child: TextFormField(
                                          expands: true,
                                          maxLines: null,
                                          controller: searchController,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 8,
                                            ),
                                            hintText: 'Search for User...',
                                            hintStyle:
                                                const TextStyle(fontSize: 12),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ),
                                      searchMatchFn: (item, searchValue) {
                                        return item.value?.fname
                                                ?.toLowerCase()
                                                .contains(searchValue) ??
                                            false;
                                      },
                                    ),
                                    //This to clear the search value when you close the menu
                                    onMenuStateChange: (isOpen) {
                                      if (!isOpen) {
                                        searchController.clear();
                                      }
                                    },
                                  ),
                                ),
                              ),
                          error: (e, s) => Container(),
                          loading: () => CupertinoActivityIndicator()),
                  SizedBox(
                    height: 10,
                  ),
                  ref.watch(usersProvider) == null
                      ? SizedBox()
                      : ref
                          .watch(displeasedCommoditiesProvider(
                              terminalId:
                                  "${ref.watch(sharedUtilityProvider).getUser()?.terminal}",
                              userId: "${ref.watch(usersProvider)?.userId}"))
                          .when(
                              data: (data) => SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2<commodity.Datum>(
                                        isExpanded: true,
                                        hint: Text(
                                          'Select Commodity',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Theme.of(context).hintColor,
                                          ),
                                        ),
                                        items: data.data!
                                            .map((item) => DropdownMenuItem(
                                                  value: item,
                                                  child: Text(
                                                    item.category ?? "",
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        value: ref.watch(commodityProvider),
                                        onChanged: (value) {
                                          ref
                                              .watch(commodityProvider.notifier)
                                              .state = value;
                                          ref.invalidate(stackProvider);
                                        },
                                        buttonStyleData: const ButtonStyleData(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                              border: Border(
                                                  top: BorderSide(
                                                      color: primaryColor),
                                                  bottom: BorderSide(
                                                      color: primaryColor),
                                                  left: BorderSide(
                                                      color: primaryColor),
                                                  right: BorderSide(
                                                      color: primaryColor))),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          height: 40,
                                          width: 200,
                                        ),
                                        dropdownStyleData:
                                            const DropdownStyleData(
                                          maxHeight: 200,
                                        ),
                                        menuItemStyleData:
                                            const MenuItemStyleData(
                                          height: 40,
                                        ),
                                        dropdownSearchData: DropdownSearchData(
                                          searchController: searchController,
                                          searchInnerWidgetHeight: 50,
                                          searchInnerWidget: Container(
                                            height: 50,
                                            padding: const EdgeInsets.only(
                                              top: 8,
                                              bottom: 4,
                                              right: 8,
                                              left: 8,
                                            ),
                                            child: TextFormField(
                                              expands: true,
                                              maxLines: null,
                                              controller: searchController,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 8,
                                                ),
                                                hintText:
                                                    'Search for Commodity...',
                                                hintStyle: const TextStyle(
                                                    fontSize: 12),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ),
                                          searchMatchFn: (item, searchValue) {
                                            return item.value?.category
                                                    ?.toLowerCase()
                                                    .contains(searchValue) ??
                                                false;
                                          },
                                        ),
                                        //This to clear the search value when you close the menu
                                        onMenuStateChange: (isOpen) {
                                          if (!isOpen) {
                                            searchController.clear();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                              error: (e, s) => Container(),
                              loading: () => CupertinoActivityIndicator()),
                  SizedBox(
                    height: 10,
                  ),
                  ref.watch(commodityProvider) == null
                      ? SizedBox()
                      : ref
                          .watch(displeasedStacksProvider(
                              terminalId:
                                  "${ref.watch(sharedUtilityProvider).getUser()?.terminal}",
                              userId: "${ref.watch(usersProvider)?.userId}",
                              commodityId:
                                  "${ref.watch(commodityProvider)?.commodity}"))
                          .when(
                              data: (data) => SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2<stack.Datum>(
                                        isExpanded: true,
                                        hint: Text(
                                          'Select Stack',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Theme.of(context).hintColor,
                                          ),
                                        ),
                                        items: data.data!
                                            .map((item) => DropdownMenuItem(
                                                  value: item,
                                                  child: Text(
                                                    item.stackNo ?? "",
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        value: ref.watch(stackProvider),
                                        onChanged: (value) {
                                          ref
                                              .watch(stackProvider.notifier)
                                              .state = value;
                                        },
                                        buttonStyleData: const ButtonStyleData(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                              border: Border(
                                                  top: BorderSide(
                                                      color: primaryColor),
                                                  bottom: BorderSide(
                                                      color: primaryColor),
                                                  left: BorderSide(
                                                      color: primaryColor),
                                                  right: BorderSide(
                                                      color: primaryColor))),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          height: 40,
                                          width: 200,
                                        ),
                                        dropdownStyleData:
                                            const DropdownStyleData(
                                          maxHeight: 200,
                                        ),
                                        menuItemStyleData:
                                            const MenuItemStyleData(
                                          height: 40,
                                        ),
                                        dropdownSearchData: DropdownSearchData(
                                          searchController: searchController,
                                          searchInnerWidgetHeight: 50,
                                          searchInnerWidget: Container(
                                            height: 50,
                                            padding: const EdgeInsets.only(
                                              top: 8,
                                              bottom: 4,
                                              right: 8,
                                              left: 8,
                                            ),
                                            child: TextFormField(
                                              expands: true,
                                              maxLines: null,
                                              controller: searchController,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 8,
                                                ),
                                                hintText: 'Search for Stack...',
                                                hintStyle: const TextStyle(
                                                    fontSize: 12),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ),
                                          searchMatchFn: (item, searchValue) {
                                            return item.value?.stackNo
                                                    ?.toLowerCase()
                                                    .contains(searchValue) ??
                                                false;
                                          },
                                        ),
                                        //This to clear the search value when you close the menu
                                        onMenuStateChange: (isOpen) {
                                          if (!isOpen) {
                                            searchController.clear();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                              error: (e, s) => Container(),
                              loading: () => CupertinoActivityIndicator()),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: netWeightController,
                    decoration: InputDecoration(
                        label: const Text("Enter Net Weight(Qtl)*"),
                        contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: totalBagsController,
                    decoration: InputDecoration(
                        label: const Text("Enter total bags*"),
                        contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ref.watch(approverListProvider).when(
                      data: (data) => SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<Employee>(
                                isExpanded: true,
                                hint: Text(
                                  'Select Approver',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: data.employees!
                                    .map((item) => DropdownMenuItem(
                                          value: item,
                                          child: Text(
                                            item.employee ?? "",
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                value: ref.watch(approverProvider),
                                onChanged: (value) {
                                  ref.watch(approverProvider.notifier).state =
                                      value;
                                },
                                buttonStyleData: const ButtonStyleData(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border: Border(
                                          top: BorderSide(color: primaryColor),
                                          bottom:
                                              BorderSide(color: primaryColor),
                                          left: BorderSide(color: primaryColor),
                                          right:
                                              BorderSide(color: primaryColor))),
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  height: 40,
                                  width: 200,
                                ),
                                dropdownStyleData: const DropdownStyleData(
                                  maxHeight: 200,
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                                dropdownSearchData: DropdownSearchData(
                                  searchController: searchController,
                                  searchInnerWidgetHeight: 50,
                                  searchInnerWidget: Container(
                                    height: 50,
                                    padding: const EdgeInsets.only(
                                      top: 8,
                                      bottom: 4,
                                      right: 8,
                                      left: 8,
                                    ),
                                    child: TextFormField(
                                      expands: true,
                                      maxLines: null,
                                      controller: searchController,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 8,
                                        ),
                                        hintText: 'Search for Approver...',
                                        hintStyle:
                                            const TextStyle(fontSize: 12),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  searchMatchFn: (item, searchValue) {
                                    return item.value?.employee
                                            ?.toLowerCase()
                                            .contains(searchValue) ??
                                        false;
                                  },
                                ),
                                //This to clear the search value when you close the menu
                                onMenuStateChange: (isOpen) {
                                  if (!isOpen) {
                                    searchController.clear();
                                  }
                                },
                              ),
                            ),
                          ),
                      error: (e, s) => Container(),
                      loading: () => CupertinoActivityIndicator()),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: InkWell(
                      child: DottedBorder(
                        color: primaryColorDark,
                        borderType: BorderType.RRect,
                        padding: Pad(all: 20),
                        radius: Radius.circular(5),
                        child: Center(
                            child: ref.watch(screenShotImage) == null
                                ? ColumnSuper(
                                    children: const [
                                      Icon(
                                        Icons.file_upload_rounded,
                                        color: primaryColorDark,
                                      ),
                                      Text(
                                        'Displeased Bags Image',
                                        style: TextStyle(
                                            color: primaryColorDark,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                : zoomWidget(ref.watch(screenShotImage))),
                      ),
                      onTap: () async {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (bottomsheetContext) =>
                                ElevarmDraggableBottomSheet(
                                    initialChildSize: 1,
                                    title: 'Capture Displeased Image',
                                    onPressedClose: () => Navigator.of(
                                            bottomsheetContext,
                                            rootNavigator: false)
                                        .pop(),
                                    children: [
                                      InAppCameraModule(
                                        captureImage: (mediaCapture) {
                                          if (mediaCapture!.status ==
                                              MediaCaptureStatus.success) {
                                            ref
                                                .watch(screenShotImage.notifier)
                                                .state = File(mediaCapture
                                                        .captureRequest.path ??
                                                    "")
                                                .readAsBytesSync();
                                            Navigator.of(bottomsheetContext,
                                                    rootNavigator: false)
                                                .pop();
                                          }
                                        },
                                      )
                                    ]));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: notesController,
                    maxLines: 5,
                    decoration: InputDecoration(
                        label: const Text('Notes'),
                        contentPadding: const Pad(all: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimatedButton(
                    color: primaryColorDark,
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: 50,
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    isOutline: true,
                    isMultiColor: true,
                    colors: [primaryColorDark, primaryColorDark],
                    borderWidth: 1,
                    onTap: () {
                      if (ref.watch(usersProvider) == null) {
                        Fluttertoast.showToast(msg: 'please select user');
                      } else if (ref.watch(commodityProvider) == null) {
                        Fluttertoast.showToast(msg: 'please select commodity');
                      } else if (ref.watch(stackProvider) == null) {
                        Fluttertoast.showToast(msg: 'please select stack');
                      } else if (ref.watch(approverProvider) == null) {
                        Fluttertoast.showToast(msg: 'please select approver');
                      } else if (ref.watch(screenShotImage) == null) {
                        Fluttertoast.showToast(msg: 'please select image');
                      } else if (netWeightController.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'please input netweight');
                      } else if (totalBagsController.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'please input total bags');
                      } else if (notesController.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'please input notes');
                      } else {
                        showLoaderDialog(context);

                        ref
                            .watch(displeasedRequestProvider(
                                    userId: ref
                                        .watch(usersProvider)
                                        ?.userId
                                        .toString(),
                                    terminalId:
                                        "${ref.watch(sharedUtilityProvider).getUser()?.terminal}",
                                    commodityId: ref
                                        .watch(commodityProvider)
                                        ?.commodity
                                        .toString(),
                                    stackid: ref
                                        .watch(stackProvider)
                                        ?.stackNo
                                        .toString(),
                                    quantity:
                                        netWeightController.text.toString(),
                                    bags: totalBagsController.text.toString(),
                                    image: base64Encode(
                                        ref.watch(screenShotImage) ??
                                            Uint8List(0)),
                                    approvedBy: ref
                                        .watch(approverProvider)
                                        ?.id
                                        .toString(),
                                    notes: notesController.text.toString())
                                .future)
                            .then((value) {
                          hideLoaderDialog(context);
                          if (value.status.toString() == "1") {
                            context.go('/');
                          }
                        }).onError((e, s) {
                          showErrorDialog(context, e.toString());
                        });
                      }
                    },
                  )
                ],
              ),
          error: (e, s) => Container(),
          loading: () => displeasedBagsShimmer()));
  var terminalProvider = StateProvider<terminal.Terminal?>((ref) => null);

  var usersProvider = StateProvider<user.Datum?>((ref) => null);
  var commodityProvider = StateProvider<commodity.Datum?>((ref) => null);
  var stackProvider = StateProvider<stack.Datum?>((ref) => null);
  var approverProvider = StateProvider<Employee?>((ref) => null);
  var screenShotImage = StateProvider<Uint8List?>((ref) => null);
}
