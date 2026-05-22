import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:dropdown_search/dropdown_search.dart';
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
            data: (data) => SingleChildScrollView(
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
                          child: DropdownSearch<terminal.Terminal?>(
                            popupProps: PopupProps.menu(
                                searchFieldProps: const TextFieldProps(
                                    autofocus: true,
                                    cursorColor: primaryColor,
                                    padding: Pad(left: 10, right: 10),
                                    decoration: InputDecoration(
                                      contentPadding: Pad(left: 10, right: 10),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              color: primaryColor)),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              color: primaryColor)),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              color: primaryColor)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              color: primaryColor)),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              color: primaryColor)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              color: primaryColor)),
                                    )),
                                menuProps: MenuProps(
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                itemBuilder: (context, terminal, isVisible) =>
                                    ColumnSuper(
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          Padding(
                                            padding: const Pad(all: 10),
                                            child: Text(
                                              "${terminal?.name}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: Adaptive.sp(16)),
                                            ),
                                          ),
                                          Container(
                                            height: 1,
                                            color: Colors.grey.withOpacity(0.3),
                                          ),
                                        ]),
                                isFilterOnline: true,
                                title: Padding(
                                  padding: const Pad(all: 10),
                                  child: Text(
                                    'Select Terminal',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: Adaptive.sp(16),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                showSearchBox: true,
                                searchDelay: const Duration(microseconds: 500)),
                            filterFn: (user, filter) =>
                                user?.districtFilterByName(filter) ?? false,
                            // asyncItems: (String filter) => getData(filter),

                            items: data.terminals ?? [],
                            itemAsString: (terminal.Terminal? u) =>
                                u?.name ?? "",
                            onChanged: (terminal.Terminal? data) => ref
                                .watch(terminalProvider.notifier)
                                .state = data,
                            dropdownDecoratorProps:
                                const DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  contentPadding:
                                      Pad(left: 10, bottom: 5, top: 5),
                                  hintText: "Select Terminal",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(
                                          color: secondColorSuperDark))),
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
            error: (e, s) => Text(s.toString()),
            loading: () => loader(context)));
  }
}
