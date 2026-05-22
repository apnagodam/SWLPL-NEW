import 'package:emp_apnagodam/Data/Models/PVModel.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Domain/Displeased/DispleasedService.dart';
import 'package:emp_apnagodam/Presentation/UI/PV/PVScreen.dart';
import 'package:emp_apnagodam/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../Data/Models/AuditStackModel.dart';
import '../../../Data/Models/TerminalModel.dart' as terminal;

import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Constants/ColorConstant.dart';
import '../../Widgets/widgets.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:emp_apnagodam/Presentation/utils/debouncer.dart' as mDebounce;

class Auditpv extends ConsumerStatefulWidget {
  const Auditpv({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuditpvState();
}

class _AuditpvState extends ConsumerState<Auditpv> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update PV'),
      ),
      body: pvLayout(context, ref),
    );
  }

  pvLayout(BuildContext context, WidgetRef ref) => Padding(
        padding: Pad(all: 10),
        child: ListView(
          children: [
            ref.watch(terminalsProvider).when(
                data: (terminals) => ColumnSuper(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<terminal.Terminal>(
                            isExpanded: true,
                            hint: Text(
                              'Select Terminal',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: terminals.terminals!
                                .map((item) => DropdownMenuItem(
                                      value: item,
                                      child: Text(
                                        "${item.name}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: ref.watch(terminalProvider),
                            onChanged: (value) {
                              ref.watch(terminalProvider.notifier).state =
                                  value;

                              ref.invalidate(stackProvider);
                            },
                            buttonStyleData: const ButtonStyleData(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  border: Border(
                                      top: BorderSide(color: primaryColor),
                                      bottom: BorderSide(color: primaryColor),
                                      left: BorderSide(color: primaryColor),
                                      right: BorderSide(color: primaryColor))),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              height: 40,
                              width: 200,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: Adaptive.h(50),
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
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 8,
                                    ),
                                    hintText: 'Search for trerminal...',
                                    hintStyle: const TextStyle(fontSize: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              searchMatchFn: (item, searchValue) {
                                return item.value?.name
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
                      SizedBox(
                        height: 10,
                      ),
                      ref
                          .watch(auditStacksProvider(
                              terminalId:
                                  ref.watch(terminalProvider)?.id.toString()))
                          .when(
                              data: (stacksData) => SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2<Datum>(
                                        isExpanded: true,
                                        hint: Text(
                                          'Select Stack',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Theme.of(context).hintColor,
                                          ),
                                        ),
                                        items: stacksData.data!
                                            .map((item) => DropdownMenuItem(
                                                  value: item,
                                                  child: Text(
                                                    "${item.stackNumber}",
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
                                        dropdownStyleData: DropdownStyleData(
                                          maxHeight: Adaptive.h(50),
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
                                                    'Search for stack no...',
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
                                            return item.value?.commodityName
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
                              loading: () => loader(context))
                    ]),
                error: (e, s) => Container(),
                loading: () => loader(context)),
            SizedBox(
              height: 10,
            ),
            InkWell(
              child: Container(
                padding: Pad(all: 10),
                child: Text(
                  'Add PV Block',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: primaryColorDark,
                      fontSize: Adaptive.sp(14),
                      fontWeight: FontWeight.w800),
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: primaryColorDark),
                    borderRadius: BorderRadius.circular(10)),
              ),
              onTap: () async {
                ref.watch(listOfBlocks.notifier).state = [
                  ...ref.watch(listOfBlocks),
                  BlockNo(height: '0')
                ];
              },
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: ref.watch(listOfBlocks).length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  ref.watch(listOfBlocks)[index].block_no =
                      (index + 1).toString();
                  return Stack(
                    children: [
                      Card(
                        child: Padding(
                          padding: const Pad(all: 10),
                          child: ColumnSuper(children: [
                            Text(
                              'Block ${index + 1}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: primaryColorDark,
                                  fontSize: Adaptive.sp(16),
                                  decoration: TextDecoration.underline),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              Expanded(
                                  child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: "Dhang",
                                    contentPadding:
                                        const Pad(top: 0, bottom: 0, left: 10),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: primaryColorDark)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                initialValue:
                                    '${ref.watch(listOfBlocks)[index].dhang ?? 0}',
                                onChanged: (value) {
                                  mDebounce.Debouncer(
                                          delay:
                                              const Duration(milliseconds: 500))
                                      .call(() {
                                    ref.watch(listOfBlocks)[index].dhang =
                                        value;
                                    if (ref
                                            .watch(listOfBlocks)[index]
                                            .plusMinusType ==
                                        PlusMinusType.minusType) {
                                      ref.watch(listOfBlocks)[index].total =
                                          '${(((int.tryParse(ref.watch(listOfBlocks)[index].dhang ?? "0"))! + (int.parse(ref.watch(listOfBlocks)[index].danda ?? "0")) * int.parse(ref.watch(listOfBlocks)[index].height ?? "0")) - int.parse(ref.watch(listOfBlocks)[index].plusMinus ?? "0"))}';
                                    } else {
                                      ref.watch(listOfBlocks)[index].total =
                                          '${(((int.parse(ref.watch(listOfBlocks)[index].dhang ?? "0")) + (int.parse(ref.watch(listOfBlocks)[index].danda ?? "0")) * int.parse(ref.watch(listOfBlocks)[index].height ?? "0")) + int.parse(ref.watch(listOfBlocks)[index].plusMinus ?? "0"))}';
                                    }
                                    ref
                                            .watch(listOfBlocks)[index]
                                            .no_of_blocks =
                                        (ref.watch(listOfBlocks).length)
                                            .toString();
                                    setState(() {});
                                  });
                                },
                              )),
                              const SizedBox(
                                width: 5,
                              ),
                              //dhanda
                              Expanded(
                                  child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: "Danda",
                                    contentPadding:
                                        const Pad(top: 0, bottom: 0, left: 10),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: primaryColorDark)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                initialValue:
                                    '${ref.watch(listOfBlocks)[index].danda ?? 0}',
                                onChanged: (value) {
                                  mDebounce.Debouncer(
                                          delay:
                                              const Duration(milliseconds: 500))
                                      .call(() {
                                    ref.watch(listOfBlocks)[index].danda =
                                        value;
                                    if (ref
                                            .watch(listOfBlocks)[index]
                                            .plusMinusType ==
                                        PlusMinusType.minusType) {
                                      ref.watch(listOfBlocks)[index].total =
                                          '${((int.parse(ref.watch(listOfBlocks)[index].dhang ?? "0") + (int.parse(ref.watch(listOfBlocks)[index].danda ?? "0"))) * int.parse(ref.watch(listOfBlocks)[index].height ?? '0')) - int.parse(ref.watch(listOfBlocks)[index].plusMinus ?? "0")}';
                                    } else {
                                      ref.watch(listOfBlocks)[index].total =
                                          '${(((int.parse(ref.watch(listOfBlocks)[index].dhang ?? "0")) + (int.parse(ref.watch(listOfBlocks)[index].danda ?? "0"))) * int.parse(ref.watch(listOfBlocks)[index].height ?? "0")) + int.parse(ref.watch(listOfBlocks)[index].plusMinus ?? "0")}';
                                    }
                                    ref
                                            .watch(listOfBlocks)[index]
                                            .no_of_blocks =
                                        (ref.watch(listOfBlocks).length)
                                            .toString();

                                    setState(() {});
                                  });
                                },
                              )),
                              const SizedBox(
                                width: 5,
                              ),
                              //height
                              Expanded(
                                  child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: "Height",
                                    contentPadding:
                                        const Pad(top: 0, bottom: 0, left: 10),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: primaryColorDark)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                initialValue:
                                    '${ref.watch(listOfBlocks)[index].height ?? 1}',
                                onChanged: (value) {
                                  mDebounce.Debouncer(
                                          delay:
                                              const Duration(milliseconds: 500))
                                      .call(() {
                                    ref.watch(listOfBlocks)[index].height =
                                        value;
                                    if (ref
                                            .watch(listOfBlocks)[index]
                                            .plusMinusType ==
                                        PlusMinusType.minusType) {
                                      ref.watch(listOfBlocks)[index].total =
                                          '${(((int.parse(ref.watch(listOfBlocks)[index].dhang ?? "0")) + (int.parse(ref.watch(listOfBlocks)[index].danda ?? "0")) * int.parse(ref.watch(listOfBlocks)[index].height ?? "0")) - int.parse(ref.watch(listOfBlocks)[index].plusMinus ?? "0"))}';
                                    } else {
                                      ref.watch(listOfBlocks)[index].total =
                                          '${(((int.parse(ref.watch(listOfBlocks)[index].dhang ?? "0")) + (int.parse(ref.watch(listOfBlocks)[index].danda ?? "0"))) * int.parse(ref.watch(listOfBlocks)[index].height ?? "0")) + int.parse(ref.watch(listOfBlocks)[index].plusMinus ?? "0")}';
                                    }
                                    ref
                                            .watch(listOfBlocks)[index]
                                            .no_of_blocks =
                                        (ref.watch(listOfBlocks).length)
                                            .toString();

                                    setState(() {});
                                  });
                                },
                              )),
                            ]),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              Expanded(
                                  child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: "Plus Minus",
                                    contentPadding:
                                        const Pad(top: 0, bottom: 0, left: 10),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: primaryColorDark)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                onChanged: (value) {
                                  mDebounce.Debouncer(
                                          delay:
                                              const Duration(milliseconds: 500))
                                      .call(() {
                                    ref.watch(listOfBlocks)[index].plusMinus =
                                        value;
                                    if (ref
                                            .watch(listOfBlocks)[index]
                                            .plusMinusType ==
                                        PlusMinusType.minusType) {
                                      ref.watch(listOfBlocks)[index].total =
                                          '${(((int.parse(ref.watch(listOfBlocks)[index].dhang ?? "0")) + (int.parse(ref.watch(listOfBlocks)[index].danda ?? "0"))) * ref.watch(listOfBlocks)[index].height.toInt(defaultValue: 1)) - ref.watch(listOfBlocks)[index].plusMinus.toInt(defaultValue: 0)}';
                                    } else {
                                      ref.watch(listOfBlocks)[index].total =
                                          '${(((int.parse(ref.watch(listOfBlocks)[index].dhang ?? "0")) + (ref.watch(listOfBlocks)[index].danda?.toInt() ?? 0)) * ref.watch(listOfBlocks)[index].height.toInt(defaultValue: 1)) + ref.watch(listOfBlocks)[index].plusMinus.toInt(defaultValue: 0)}';
                                    }
                                    ref
                                            .watch(listOfBlocks)[index]
                                            .no_of_blocks =
                                        (ref.watch(listOfBlocks).length)
                                            .toString();

                                    setState(() {});
                                  });
                                },
                                initialValue: '0',
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: SizedBox(
                                child: DropdownMenu<PlusMinusType>(
                                  initialSelection: ref
                                      .watch(listOfBlocks)[index]
                                      .plusMinusType,
                                  label: const Text('+/-'),
                                  onSelected: (PlusMinusType? labour) {
                                    mDebounce.Debouncer(
                                            delay: const Duration(
                                                milliseconds: 500))
                                        .call(() {
                                      ref
                                              .watch(listOfBlocks)[index]
                                              .plusMinusType =
                                          labour ?? PlusMinusType.defaultType;
                                      if (ref
                                              .watch(listOfBlocks)[index]
                                              .plusMinusType ==
                                          PlusMinusType.minusType) {
                                        ref.watch(listOfBlocks)[index].total =
                                            '${(((ref.watch(listOfBlocks)[index].dhang.toInt(defaultValue: 0)) + (ref.watch(listOfBlocks)[index].danda.toInt(defaultValue: 0) ?? 0)) * ref.watch(listOfBlocks)[index].height.toInt(defaultValue: 1)) - ref.watch(listOfBlocks)[index].plusMinus.toInt(defaultValue: 0)}';
                                      } else {
                                        ref.watch(listOfBlocks)[index].total =
                                            '${(((ref.watch(listOfBlocks)[index].dhang.toInt(defaultValue: 0)) + (ref.watch(listOfBlocks)[index].danda.toInt(defaultValue: 0) ?? 0)) * ref.watch(listOfBlocks)[index].height.toInt(defaultValue: 1)) + ref.watch(listOfBlocks)[index].plusMinus.toInt(defaultValue: 0)}';
                                      }
                                      ref
                                              .watch(listOfBlocks)[index]
                                              .no_of_blocks =
                                          (ref.watch(listOfBlocks).length)
                                              .toString();

                                      setState(() {});
                                    });
                                  },
                                  dropdownMenuEntries: PlusMinusType.values
                                      .map<DropdownMenuEntry<PlusMinusType>>(
                                          (PlusMinusType labour) {
                                    return DropdownMenuEntry<PlusMinusType>(
                                      value: labour,
                                      label: labour.title,
                                    );
                                  }).toList(),
                                  width: 100,
                                ),
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text(ref
                                              .watch(listOfBlocks)[index]
                                              .plusMinusType ==
                                          PlusMinusType.minusType
                                      ? '${(((ref.watch(listOfBlocks)[index].dhang.toInt(defaultValue: 0)) + (ref.watch(listOfBlocks)[index].danda.toInt(defaultValue: 0) ?? 0)) * ref.watch(listOfBlocks)[index].height.toInt(defaultValue: 1)) - ref.watch(listOfBlocks)[index].plusMinus.toInt(defaultValue: 0)}'
                                      : '${(((ref.watch(listOfBlocks)[index].dhang.toInt(defaultValue: 0)) + (ref.watch(listOfBlocks)[index].danda.toInt(defaultValue: 0) ?? 0)) * ref.watch(listOfBlocks)[index].height.toInt(defaultValue: 1)) + ref.watch(listOfBlocks)[index].plusMinus.toInt(defaultValue: 0)}')),
                            ])
                          ]),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: FloatingActionButton.small(
                          onPressed: () {
                            ref.watch(listOfBlocks).removeAt(index);
                            setState(() {});
                          },
                          child: Icon(
                            Icons.close,
                            size: Adaptive.sp(20),
                            color: Colors.white,
                          ),
                          shape: CircleBorder(),
                          backgroundColor: Colors.red.shade700,
                        ),
                      )
                    ],
                  );
                }),
            SizedBox(
              height: 10,
            ),
            Visibility(
              visible: ref.watch(listOfBlocks).isNotEmpty,
              child: AnimatedButton(
                width: Adaptive.w(90),
                height: 50,
                color: primaryColorDark,
                isOutline: true,
                isMultiColor: true,
                colors: [primaryColorDark, primaryColorDark],
                borderWidth: 1,
                onTap: () async {
                  var isComplete = true;
                  ref.watch(listOfBlocks).forEach((element) {
                    if (element.total == "0") {
                      isComplete = true;
                    }
                  });

                  if (ref.watch(terminalProvider) == null) {
                    Fluttertoast.showToast(msg: 'Please select terminal!');
                  }

                  if (ref.watch(stackProvider) == null) {
                    Fluttertoast.showToast(msg: 'Please select Stack!');
                  } else {
                    if (isComplete) {
                      ref
                          .watch(postAuditPvProvider(
                                  model: Pvmodel(
                                      terminalId: ref
                                          .watch(terminalProvider)
                                          ?.id
                                          .toString(),
                                      stackNo: double.parse(
                                          "${ref.watch(stackProvider)?.stackNumber}"),
                                      commodityId:
                                          "${ref.watch(stackProvider)?.commodityId}",
                                      blockNo: ref.watch(listOfBlocks)))
                              .future)
                          .then((value) {
                        if (value['status'].toString() == "1") {
                          ref.watch(goRouterProvider).pop();
                        }
                        Fluttertoast.showToast(
                            msg: value['message'].toString());
                      }).onError(
                              (e, s) => showErrorDialog(context, e.toString()));
                    } else {
                      Fluttertoast.showToast(
                          msg: 'Please complete previous block first!');
                    }
                  }
                },
                child: Text(
                  'Submit PV',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Adaptive.sp(14),
                      fontWeight: FontWeight.w800),
                ),
              ),
            )
          ],
        ),
      );

  var pvItemCount = StateProvider((ref) => 0);
  var plusMinusProvider =
      StateProvider<PlusMinusType?>((ref) => PlusMinusType.defaultType);
  var listOfBlocks = StateProvider<List<BlockNo>>((ref) => []);

  var terminalProvider = StateProvider<terminal.Terminal?>((ref) => null);
  var stackProvider = StateProvider<Datum?>((ref) => null);
}
