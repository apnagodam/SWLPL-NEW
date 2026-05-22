// ignore_for_file: unused_field
import 'dart:io';
import 'package:button_animations/button_animations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Domain/Conveyance/ConveyanceService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddVendorVoucher extends ConsumerStatefulWidget {
  const AddVendorVoucher({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GuardinscreenState();
}

class _GuardinscreenState extends ConsumerState<AddVendorVoucher> {
  final approvalAmount = TextEditingController();
  TextEditingController _controller = TextEditingController();
  TextEditingController _dateFromController = TextEditingController();
  TextEditingController _dateToController = TextEditingController();
  TextEditingController reasonController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  String? selectedGroupfirm;

  final _selectedVendorIdProvider = StateProvider<String?>((ref) => null);
  final _selectedExpenseIdProvider = StateProvider<String?>((ref) => null);
  final _selectedVendorApproverProvider = StateProvider<String?>((ref) => null);
  final _selectedExpenseTerminalIdProvider =
      StateProvider<String?>((ref) => null);

  final _expenseImageProvider = StateProvider<File?>((ref) => null);
  final _OtherExpenseexpenseImageProvider = StateProvider<File?>((ref) => null);

  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();

    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
      _controller.text = formattedDate;
    }
  }

  Future<void> _pickDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      String formattedDate = "${selectedDate.toLocal()}".split(' ')[0];
      controller.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add Voucher"),
      ),
      body: Form(
          key: formKey,
          child: ref.watch(vendorListProvider).when(
              data: (vendorList) => ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Date*'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _controller,
                        readOnly: true,
                        decoration: InputDecoration(
                            labelText: 'Select Date',
                            hintText: 'Click to select a date',
                            suffixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder()),
                        onTap: () {
                          _selectDate(context);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field cant be empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Vendors*'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton<String>(
                          underline: SizedBox.shrink(),
                          isExpanded: true,
                          value: ref.watch(_selectedVendorIdProvider),
                          hint: Text('Select Vendor'),
                          onChanged: (String? newValue) {
                            setState(() {
                              ref
                                  .watch(_selectedVendorIdProvider.notifier)
                                  .state = newValue;
                            });
                          },
                          items: vendorList.data?.map((vendor) {
                            return DropdownMenuItem<String>(
                              value: vendor.id.toString(),
                              child: Text(
                                '${vendor.phone} (${vendor.vendorFirstName} ${vendor.vendorLastName})',
                              ),
                            );
                          }).toList(),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      if (ref.watch(_selectedVendorIdProvider) != null)
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Expenses Name*'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ref
                                .watch(VendorExpensesListProvider(
                                    id: "${ref.watch(_selectedVendorIdProvider)}"))
                                .when(
                                    data: (vendorExpenses) => Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: DropdownButton<String>(
                                            underline: SizedBox.shrink(),
                                            isExpanded: true,
                                            value: ref.watch(
                                                _selectedExpenseIdProvider),
                                            hint:
                                                Text('Select Vendor Expenses'),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                ref
                                                    .watch(
                                                        _selectedExpenseIdProvider
                                                            .notifier)
                                                    .state = newValue;
                                              });
                                            },
                                            items: vendorExpenses.data
                                                ?.map((vendorExpenses) {
                                              return DropdownMenuItem<String>(
                                                value: vendorExpenses.id
                                                    .toString(),
                                                child: Text(
                                                  '${vendorExpenses.expensesName}',
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade300),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                    error: (e, s) => Text(''),
                                    loading: () => loader(context))
                          ],
                        ),
                      if (ref.watch(_selectedExpenseIdProvider) != null)
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            ref.watch(_selectedVendorIdProvider) == null
                                ? Text('')
                                : Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text('Terminal Name*'),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      // Text('$selectedExpenseId'),
                                      ref
                                          .watch(VendorExpensesTerminalListProvider(
                                              id:
                                                  '${ref.watch(_selectedVendorIdProvider)}'))
                                          .when(
                                              data: (vendorTerminalExpenses) =>
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10),
                                                    child:
                                                        DropdownButton<String>(
                                                      underline:
                                                          SizedBox.shrink(),
                                                      isExpanded: true,
                                                      value: ref.watch(
                                                          _selectedExpenseTerminalIdProvider),
                                                      hint: Text(
                                                          'Select terminal'),
                                                      onChanged:
                                                          (String? newValue) {
                                                        setState(() {
                                                          ref
                                                              .watch(
                                                                  _selectedExpenseTerminalIdProvider
                                                                      .notifier)
                                                              .state = newValue;
                                                        });
                                                      },
                                                      items: vendorTerminalExpenses
                                                          .data
                                                          ?.map(
                                                              (vendorExpensesTerminal) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value:
                                                              vendorExpensesTerminal
                                                                  .id
                                                                  .toString(),
                                                          child: Text(
                                                            '${vendorExpensesTerminal.name}',
                                                          ),
                                                        );
                                                      }).toList(),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors
                                                              .grey.shade300),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  ),
                                              error: (e, s) => Text(''),
                                              loading: () => loader(context)),
                                    ],
                                  ),
                            SizedBox(
                              height: 10,
                            ),
                            if (ref.watch(_selectedExpenseTerminalIdProvider) !=
                                null)
                              Column(
                                children: [
                                  ElevarmTextInputField(
                                    label: 'Approval Amount',
                                    hintText: '',
                                    helperText: 'Amount to be approved',
                                    suffixIconAssetName: Icons.money,
                                    onTapSuffix: null,
                                    errorText: null,
                                    enabled: true,
                                    controller: approvalAmount,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "This field cant be empty";
                                      } else {
                                        return null;
                                      }
                                    },
                                    isRequired: true,
                                    keyboardType: TextInputType.number,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(child: Text('Expense Image*')),
                                      Expanded(
                                          child: Text('Other Expense Image'))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: DottedBorder(
                                          child: InkWell(
                                            onTap: () {
                                              _picker
                                                  .pickImage(
                                                      source:
                                                          ImageSource.gallery)
                                                  .then((value) {
                                                if (value != null) {
                                                  ref
                                                      .watch(
                                                          _expenseImageProvider
                                                              .notifier)
                                                      .state = File(value.path);
                                                }
                                              });
                                            },
                                            child: Container(
                                              height: 200,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 10),
                                              child: Center(
                                                child: ref.watch(
                                                            _expenseImageProvider) ==
                                                        null
                                                    ? Text('Select Image')
                                                    : Image.file(
                                                        ref.watch(
                                                                _expenseImageProvider) ??
                                                            File(''),
                                                        fit: BoxFit.contain,
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: DottedBorder(
                                          child: InkWell(
                                            onTap: () {
                                              _picker
                                                  .pickImage(
                                                      source:
                                                          ImageSource.gallery)
                                                  .then((value) {
                                                if (value != null) {
                                                  ref
                                                      .watch(
                                                          _OtherExpenseexpenseImageProvider
                                                              .notifier)
                                                      .state = File(value.path);
                                                }
                                              });
                                            },
                                            child: Container(
                                              height: 200,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 10),
                                              child: Center(
                                                child: ref.watch(
                                                            _OtherExpenseexpenseImageProvider) ==
                                                        null
                                                    ? Text('Select Image')
                                                    : Image.file(
                                                        ref.watch(
                                                                _OtherExpenseexpenseImageProvider) ??
                                                            File(''),
                                                        fit: BoxFit.contain,
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('Approve By*'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ref
                                      .watch(VendorApproverNameProvider(
                                          id:
                                              '${ref.watch(_selectedVendorIdProvider)}',
                                          amount: approvalAmount.text,
                                          expensesid: ref.watch(
                                              _selectedExpenseIdProvider)))
                                      .when(
                                          data: (vendorApproverName) =>
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: DropdownButton<String>(
                                                  underline: SizedBox.shrink(),
                                                  isExpanded: true,
                                                  value: ref.watch(
                                                      _selectedVendorApproverProvider),
                                                  hint: Text(
                                                      'Select Vendor Expenses'),
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      ref
                                                          .watch(
                                                              _selectedVendorApproverProvider
                                                                  .notifier)
                                                          .state = newValue;
                                                    });
                                                  },
                                                  items: vendorApproverName.data
                                                      ?.map((vendorApprover) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: vendorApprover.id
                                                          .toString(),
                                                      child: Text(
                                                        '${vendorApprover.firstName}' +
                                                            " " +
                                                            '${vendorApprover.lastName}',
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          Colors.grey.shade300),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                          error: (e, s) => Text(''),
                                          loading: () => loader(context)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('Group Firm*'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ref.watch(venderGroupFirmListProvider).when(
                                      data: (groupFirm) => Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: DropdownButton<String>(
                                              underline: SizedBox.shrink(),
                                              isExpanded: true,
                                              value: selectedGroupfirm,
                                              hint: Text('Select GroupFirm'),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  selectedGroupfirm = newValue;
                                                });
                                              },
                                              items: groupFirm.data
                                                  ?.map((groupFirmName) {
                                                return DropdownMenuItem<String>(
                                                  value: groupFirmName.id
                                                      .toString(),
                                                  child: Text(
                                                    '${groupFirmName.name}',
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey.shade300),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                      error: (e, s) => Text(''),
                                      loading: () => loader(context)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(child: Text('Voucher From')),
                                      Expanded(child: Text('  Voucher To'))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: _dateFromController,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Voucher From',
                                            hintText: 'Select Date From',
                                            suffixIcon: IconButton(
                                              icon: Icon(Icons.calendar_today),
                                              onPressed: () => _pickDate(
                                                  context, _dateFromController),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "This field cant be empty";
                                            } else {
                                              return null;
                                            }
                                          },
                                          readOnly: true,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller: _dateToController,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Voucher to',
                                            hintText: 'Select Date To',
                                            suffixIcon: IconButton(
                                              icon: Icon(Icons.calendar_today),
                                              onPressed: () => _pickDate(
                                                  context, _dateToController),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "This field cant be empty";
                                            } else {
                                              return null;
                                            }
                                          },
                                          readOnly: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  ElevarmTextInputField(
                                    label: 'Extra Notes',
                                    hintText: '',
                                    helperText: 'Extra details',
                                    suffixIconAssetName: Icons.money,
                                    onTapSuffix: null,
                                    errorText: null,
                                    enabled: true,
                                    maxLines: 5,
                                    controller: reasonController,
                                    isRequired: false,
                                    keyboardType: TextInputType.name,
                                  ),
                                  SizedBox(
                                    height: 15,
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
                                      if (formKey.currentState!.validate()) {
                                        showLoaderDialog(context);
                                        ref
                                            .watch(CreateVendorVoucherProvider(
                                                    amount: approvalAmount.text,
                                                    approveBy: ref.watch(
                                                        _selectedVendorApproverProvider),
                                                    expenseDate:
                                                        _controller.text,
                                                    expid: ref.watch(
                                                        _selectedExpenseIdProvider),
                                                    fromDate:
                                                        _dateFromController
                                                            .text,
                                                    groupFirm:
                                                        selectedGroupfirm,
                                                    image: ref.watch(
                                                        _expenseImageProvider),
                                                    imageSecond: ref.watch(
                                                        _OtherExpenseexpenseImageProvider),
                                                    purpose:
                                                        reasonController.text,
                                                    terminalId: ref.watch(
                                                        _selectedExpenseTerminalIdProvider),
                                                    toDate:
                                                        _dateToController.text,
                                                    vendorId: ref.watch(
                                                        _selectedVendorIdProvider))
                                                .future)
                                            .then((value) {
                                          hideLoaderDialog(context);
                                          Fluttertoast.showToast(
                                              msg: value['message']);
                                          Navigator.of(context).pop();
                                        }).onError((e, s) {
                                          hideLoaderDialog(context);
                                          Navigator.of(context).pop();
                                        });
                                      }
                                    },
                                    child: Text(
                                      'Add Voucher',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Adaptive.sp(14),
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ],
                              )
                          ],
                        )
                    ],
                  ),
              error: (e, s) => Text(''),
              loading: () => loader(context))),
    );
  }
}
