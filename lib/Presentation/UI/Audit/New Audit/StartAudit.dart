import 'package:button_animations/button_animations.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Data/Models/AuditStartModal.dart' as terminal;

class AuditStartScreen extends ConsumerStatefulWidget {
  const AuditStartScreen({super.key});

  @override
  ConsumerState<AuditStartScreen> createState() => _AuditneighbourState();
}

class _AuditneighbourState extends ConsumerState<AuditStartScreen> {
  final reasonKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  var terminalProvider = StateProvider<terminal.Terminal?>((ref) => null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Audit Start'),
        ),
        body: ref.watch(getStartAuditProvider).when(
            data: (AuditStart) => SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, right: 10, left: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
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
                              items: AuditStart.terminals!
                                  .map((item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(
                                          ' ${item.name}' +
                                              "${item.warehouseCode}",
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
                              },
                              buttonStyleData: const ButtonStyleData(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border(
                                        top: BorderSide(color: primaryColor),
                                        bottom: BorderSide(color: primaryColor),
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
                                      hintText: 'Search for Terminal...',
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
                          height: 20,
                        ),
                        AnimatedButton(
                          height: 50,
                          color: Colors.green,
                          width: MediaQuery.of(context).size.width / 2,
                          isOutline: true,
                          isMultiColor: true,
                          colors: const [primaryColorDark, primaryColorDark],
                          borderWidth: 1,
                          onTap: () {
                            ref
                                .watch(postStartAuditStackProvider(
                                        terminalId:
                                            '${ref.watch(terminalProvider.notifier).state?.id}')
                                    .future)
                                .then((value) {
                              if (value.status.toString() == "1") {
                                context.goNamed('active_audit');
                                ref.invalidate(activeAuditProvider);
                              }
                              Fluttertoast.showToast(
                                  msg: value.message.toString());
                            });
                          },
                          child: Text(
                            'Start Audit',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Adaptive.sp(14),
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            error: (e, s) => Text(''),
            loading: () => loader(context)));
  }
}
