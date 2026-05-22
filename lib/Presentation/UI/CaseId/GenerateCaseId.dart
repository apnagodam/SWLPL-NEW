import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Data/Models/GenerateCaseIdCommodityModel.dart';
import 'package:emp_apnagodam/Data/Models/GenerateCaseIdContractorModel.dart';
import 'package:emp_apnagodam/Data/Models/GenerateCaseIdStackModel.dart';
import 'package:emp_apnagodam/Data/Models/GenerateCaseIdTripIdModel.dart';
import 'package:emp_apnagodam/Data/Models/GenerateCaseIdUserModel.dart';
import 'package:emp_apnagodam/Data/SharedPrefs/SharedUtility.dart';
import 'package:emp_apnagodam/Domain/Authentication/AuthenticationService.dart';
import 'package:emp_apnagodam/Domain/CaseId/CaseIdService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/Presentation/utils/Enums.dart';
import 'package:emp_apnagodam/Presentation/utils/extensions.dart';
import 'package:emp_apnagodam/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class Generatecaseid extends ConsumerStatefulWidget {
  const Generatecaseid({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GeneratecaseidState();
}

class _GeneratecaseidState extends ConsumerState<Generatecaseid> {
  final _commodityProvider = StateProvider<CommodityDatum?>((ref) => null);
  final _commodityTypeProvider =
      StateProvider<CommodityType?>((ref) => CommodityType.kisani);
  final _customerProvider = StateProvider<GeneratedUserDatum?>((ref) => null);
  final _driverNoController = TextEditingController();
  final _labourContractorProvider =
      StateProvider<ContractorDatum?>((ref) => null);

  final _manditaxAvailabilityProvider = StateProvider<bool>((ref) => false);

  final _labourTypeProvider = StateProvider<LabourType?>((ref) => null);
  final _stackProvider = StateProvider<StackDatum?>((ref) => null);
  final _transportTypeProvider = StateProvider<TransportType?>((ref) => null);
  final _tripIdProvider = StateProvider<TripIdDatum?>((ref) => null);
  final _validationKey = GlobalKey<FormState>();
  final _vehicleNumberController = TextEditingController();
  final _contractorPhoneController = TextEditingController();
  final _contractorRateController = TextEditingController();
  final _vehicleTypeProvider = StateProvider<VehicleType?>((ref) => null);
  final _vehicleRegistrationTypeProvider =
      StateProvider<RegistrationType?>((ref) => null);
  final _weightControllerKG = TextEditingController();
  final _weightControllerQtl = TextEditingController();

  _customerLayout(BuildContext context) =>
      ref.watch(getGeneratedCaseIdUserListProvider).when(
            data: (data) => SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DropdownSearch<GeneratedUserDatum?>(
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
                            side: const BorderSide(color: primaryColor),
                            borderRadius: BorderRadius.circular(8))),
                    itemBuilder: (context, terminal, isVisible) =>
                        ColumnSuper(alignment: Alignment.centerLeft, children: [
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
                        'Select Customer',
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

                items: data.data ?? [],
                itemAsString: (GeneratedUserDatum? u) => u?.name ?? "",
                onChanged: (GeneratedUserDatum? data) =>
                    ref.watch(_customerProvider.notifier).state = data,
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      contentPadding: Pad(left: 10, bottom: 5, top: 5),
                      hintText: "Select Customer",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: secondColorSuperDark))),
                ),
              ),
            ),
            error: (e, s) => Container(),
            loading: () => Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: primaryColor,
              child: Container(
                height: context.fullHeight,
                width: context.fullWidth,
                alignment: Alignment.center,
                child: ElevarmTextInputField(
                  hintText: 'Select Customer',
                  suffixIconAssetName: Icons.money,
                  onTapSuffix: null,
                  errorText: null,
                  enabled: false,
                  isRequired: true,
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
          );

  _commodityLayout(BuildContext context) => ref
      .watch(getGeneratedCaseIdCommodityListProvider(
          userId: "${ref.watch(_customerProvider)?.id}"))
      .when(
        data: (data) => SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DropdownSearch<CommodityDatum?>(
            popupProps: PopupProps.menu(
                searchFieldProps: const TextFieldProps(
                    autofocus: true,
                    cursorColor: primaryColor,
                    padding: Pad(left: 10, right: 10),
                    decoration: InputDecoration(
                      contentPadding: Pad(left: 10, right: 10),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: primaryColor)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: primaryColor)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: primaryColor)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: primaryColor)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: primaryColor)),
                    )),
                menuProps: MenuProps(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.circular(8))),
                itemBuilder: (context, terminal, isVisible) =>
                    ColumnSuper(alignment: Alignment.centerLeft, children: [
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
                    'Select Commodity',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: Adaptive.sp(16), fontWeight: FontWeight.bold),
                  ),
                ),
                showSearchBox: true,
                searchDelay: const Duration(microseconds: 500)),
            filterFn: (user, filter) =>
                user?.districtFilterByName(filter) ?? false,
            // asyncItems: (String filter) => getData(filter),

            items: data.data ?? [],
            itemAsString: (CommodityDatum? u) => u?.name ?? "",
            onChanged: (CommodityDatum? data) =>
                ref.watch(_commodityProvider.notifier).state = data,
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                  contentPadding: Pad(left: 10, bottom: 5, top: 5),
                  hintText: "Select Commodity",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: secondColorSuperDark))),
            ),
          ),
        ),
        error: (e, s) => Container(),
        loading: () => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: primaryColor,
          child: Container(
            height: context.fullHeight,
            width: context.fullWidth,
            alignment: Alignment.center,
            child: ElevarmTextInputField(
              hintText: 'Select Customer',
              suffixIconAssetName: Icons.person,
              onTapSuffix: null,
              errorText: null,
              enabled: false,
              isRequired: true,
              keyboardType: TextInputType.text,
            ),
          ),
        ),
      );

  _stacklayout(BuildContext context) => ref
      .watch(getGeneratedCaseIdStackListProvider(
          userId: "${ref.watch(_customerProvider)?.id}",
          commodityId: "${ref.watch(_commodityProvider)?.id}"))
      .when(
        data: (data) => SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DropdownSearch<StackDatum?>(
            popupProps: PopupProps.menu(
                searchFieldProps: const TextFieldProps(
                    autofocus: true,
                    cursorColor: primaryColor,
                    padding: Pad(left: 10, right: 10),
                    decoration: InputDecoration(
                      contentPadding: Pad(left: 10, right: 10),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: primaryColor)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: primaryColor)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: primaryColor)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: primaryColor)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: primaryColor)),
                    )),
                menuProps: MenuProps(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.circular(8))),
                itemBuilder: (context, terminal, isVisible) =>
                    ColumnSuper(alignment: Alignment.centerLeft, children: [
                      Padding(
                        padding: const Pad(all: 10),
                        child: Text(
                          "${terminal?.stackNumber}",
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
                    'Select Stack',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: Adaptive.sp(16), fontWeight: FontWeight.bold),
                  ),
                ),
                showSearchBox: true,
                searchDelay: const Duration(microseconds: 500)),
            filterFn: (user, filter) =>
                user?.districtFilterByName(filter) ?? false,
            // asyncItems: (String filter) => getData(filter),

            items: data.data ?? [],
            itemAsString: (StackDatum? u) => u?.stackNumber ?? "",
            onChanged: (StackDatum? data) =>
                ref.watch(_stackProvider.notifier).state = data,
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                  contentPadding: Pad(left: 10, bottom: 5, top: 5),
                  hintText: "Select Stack",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: secondColorSuperDark))),
            ),
          ),
        ),
        error: (e, s) => Container(),
        loading: () => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: primaryColor,
          child: Container(
            height: context.fullHeight,
            width: context.fullWidth,
            alignment: Alignment.center,
            child: ElevarmTextInputField(
              hintText: 'Select Customer',
              suffixIconAssetName: Icons.person,
              onTapSuffix: null,
              errorText: null,
              enabled: false,
              isRequired: true,
              keyboardType: TextInputType.text,
            ),
          ),
        ),
      );

  _transportTypeLayout(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DropdownSearch<TransportType?>(
          popupProps: PopupProps.menu(
              searchFieldProps: const TextFieldProps(
                  autofocus: true,
                  cursorColor: primaryColor,
                  padding: Pad(left: 10, right: 10),
                  decoration: InputDecoration(
                    contentPadding: Pad(left: 10, right: 10),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            style: BorderStyle.solid, color: primaryColor)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            style: BorderStyle.solid, color: primaryColor)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            style: BorderStyle.solid, color: primaryColor)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            style: BorderStyle.solid, color: primaryColor)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            style: BorderStyle.solid, color: primaryColor)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            style: BorderStyle.solid, color: primaryColor)),
                  )),
              menuProps: MenuProps(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: primaryColor),
                      borderRadius: BorderRadius.circular(8))),
              itemBuilder: (context, terminal, isVisible) =>
                  ColumnSuper(alignment: Alignment.centerLeft, children: [
                    Padding(
                      padding: const Pad(all: 10),
                      child: Text(
                        "${terminal?.type}",
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
                  'Select Transport Type',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: Adaptive.sp(16), fontWeight: FontWeight.bold),
                ),
              ),
              showSearchBox: true,
              searchDelay: const Duration(microseconds: 500)),
          items: TransportType.values,
          itemAsString: (TransportType? u) => u?.type ?? "",
          onChanged: (TransportType? data) =>
              ref.watch(_transportTypeProvider.notifier).state = data,
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
                contentPadding: Pad(left: 10, bottom: 5, top: 5),
                hintText: "Select Transport Type",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: secondColorSuperDark))),
          ),
        ),
      );

  _companyTransportLayout() => ref
      .watch(tripIdProvider(
          userId: "${ref.watch(_customerProvider)?.id}",
          commodityId: "${ref.watch(_commodityProvider)?.id}"))
      .when(
        data: (data) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: DropdownSearch<TripIdDatum?>(
              popupProps: PopupProps.menu(
                  searchFieldProps: const TextFieldProps(
                      autofocus: true,
                      cursorColor: primaryColor,
                      padding: Pad(left: 10, right: 10),
                      decoration: InputDecoration(
                        contentPadding: Pad(left: 10, right: 10),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                      )),
                  menuProps: MenuProps(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.circular(8))),
                  itemBuilder: (context, terminal, isVisible) =>
                      ColumnSuper(alignment: Alignment.centerLeft, children: [
                        Padding(
                          padding: const Pad(all: 10),
                          child: Text(
                            "${terminal?.tripRequestId}",
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
                      'Select Trip Id',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  showSearchBox: true,
                  searchDelay: const Duration(microseconds: 500)),
              filterFn: (user, filter) => user?.filter(filter) ?? false,
              // asyncItems: (String filter) => getData(filter),

              items: data.data ?? [],
              itemAsString: (TripIdDatum? u) => u?.tripRequestId ?? "",
              onChanged: (TripIdDatum? data) {
                _vehicleNumberController.text = "";
                _driverNoController.text = "";
                if (data != null) {
                  ref
                      .watch(tripIdDriverDetailsProvider(tripId: "${data.id}")
                          .future)
                      .then((value) {
                    _vehicleNumberController.text =
                        "${value.data?.vehicleNo ?? ""}";
                    _driverNoController.text =
                        "${value.data?.driverNumber ?? ""}";
                  });
                } else {
                  _vehicleNumberController.text = "";
                  _driverNoController.text = "";
                }
                ref.watch(_tripIdProvider.notifier).state = data;
              },
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    contentPadding: Pad(left: 10, bottom: 5, top: 5),
                    hintText: "Select TripId",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: secondColorSuperDark))),
              ),
            ),
          );
        },
        error: (e, s) => Container(),
        loading: () => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: primaryColor,
          child: Container(
            height: context.fullHeight,
            width: context.fullWidth,
            alignment: Alignment.center,
            child: ElevarmTextInputField(
              hintText: 'Select Customer',
              suffixIconAssetName: Icons.money,
              onTapSuffix: null,
              errorText: null,
              enabled: false,
              isRequired: true,
              keyboardType: TextInputType.text,
            ),
          ),
        ),
      );

  _clientTransportLayout() => Column(
        children: [
          titleWidget(text: "Select Vehicle Type"),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: DropdownSearch<VehicleType?>(
              popupProps: PopupProps.menu(
                  searchFieldProps: const TextFieldProps(
                      autofocus: true,
                      cursorColor: primaryColor,
                      padding: Pad(left: 10, right: 10),
                      decoration: InputDecoration(
                        contentPadding: Pad(left: 10, right: 10),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                      )),
                  menuProps: MenuProps(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.circular(8))),
                  itemBuilder: (context, terminal, isVisible) =>
                      ColumnSuper(alignment: Alignment.centerLeft, children: [
                        Padding(
                          padding: const Pad(all: 10),
                          child: Text(
                            "${terminal?.type}",
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
                      'Select Vehicle Type',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  showSearchBox: true,
                  searchDelay: const Duration(microseconds: 500)),
              items: VehicleType.values,
              itemAsString: (VehicleType? u) => u?.type ?? "",
              onChanged: (VehicleType? data) =>
                  ref.watch(_vehicleTypeProvider.notifier).state = data,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    contentPadding: Pad(left: 10, bottom: 5, top: 5),
                    hintText: "Select Vehicle Type",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: secondColorSuperDark))),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          if (ref.watch(_vehicleTypeProvider) == VehicleType.Tractor)
            Column(
              children: [
                titleWidget(text: "Select Registration Type"),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DropdownSearch<RegistrationType?>(
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
                                side: const BorderSide(color: primaryColor),
                                borderRadius: BorderRadius.circular(8))),
                        itemBuilder: (context, terminal, isVisible) =>
                            ColumnSuper(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Padding(
                                    padding: const Pad(all: 10),
                                    child: Text(
                                      "${terminal?.label}",
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
                            'Select Registration Type',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: Adaptive.sp(16),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        showSearchBox: true,
                        searchDelay: const Duration(microseconds: 500)),
                    items: RegistrationType.values,
                    itemAsString: (RegistrationType? u) => u?.label ?? "",
                    onChanged: (RegistrationType? data) => ref
                        .watch(_vehicleRegistrationTypeProvider.notifier)
                        .state = data,
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          contentPadding: Pad(left: 10, bottom: 5, top: 5),
                          hintText: "Select Registration Type",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(color: secondColorSuperDark))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
        ],
      );

  _driverLayout() => Column(
        children: [
          if (ref.watch(_vehicleRegistrationTypeProvider) !=
                  RegistrationType.UnRegistered ||
              ref.watch(_vehicleTypeProvider) != VehicleType.Tractor ||
              ref.watch(_transportTypeProvider) ==
                  TransportType.companyTransport)
            Column(
              children: [
                titleWidget(text: 'Enter Vehicle No.'),
                ElevarmTextInputField(
                  hintText: 'Enter Vehicle No.',
                  suffixIconAssetName: Icons.car_rental,
                  onTapSuffix: null,
                  errorText: null,
                  enabled: true,
                  controller: _vehicleNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field cant be empty";
                    } else {
                      return null;
                    }
                  },
                  isRequired: true,
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          titleWidget(text: "Enter Driver No."),
          ElevarmTextInputField(
            hintText: 'Enter Driver No.',
            suffixIconAssetName: Icons.phone,
            onTapSuffix: null,
            errorText: null,
            enabled: true,
            maxLength: 10,
            controller: _driverNoController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "This field cant be empty";
              } else if (value.length != 10) {
                return "Number should be of 10 digits!";
              } else {
                return null;
              }
            },
            isRequired: true,
            keyboardType: TextInputType.number,
          ),
        ],
      );

  _weightLayout() => Column(
        children: [
          titleWidget(text: "Enter Weight(KG)"),
          ElevarmTextInputField(
            hintText: 'Enter Weight',
            suffixIconAssetName: Icons.monitor_weight,
            onTapSuffix: null,
            errorText: null,
            enabled: true,
            controller: _weightControllerKG,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "This field cant be empty";
              } else if (value.toString() == "0") {
                return "This field cant be 0";
              } else {
                return null;
              }
            },
            onChanged: (value) {
              if (value.isNotEmpty && num.parse('${value}') > 0) {
                _weightControllerQtl.text =
                    "${(num.parse("${value}") / 100).toStringAsFixed(2)}";
              } else {
                _weightControllerQtl.text = "0";
              }
            },
            isRequired: true,
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 10,
          ),
          titleWidget(text: "Enter Weight(Quintal)"),
          ElevarmTextInputField(
            hintText: 'Weight in Quintal',
            suffixIconAssetName: Icons.monitor_weight,
            onTapSuffix: null,
            errorText: null,
            enabled: false,
            controller: _weightControllerQtl,
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
        ],
      );

  _contractorLayout(bool manditaxAvailability) => Column(
        children: [
          titleWidget(text: 'Select Labour Type'),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: DropdownSearch<LabourType?>(
              popupProps: PopupProps.menu(
                  searchFieldProps: const TextFieldProps(
                      autofocus: true,
                      cursorColor: primaryColor,
                      padding: Pad(left: 10, right: 10),
                      decoration: InputDecoration(
                        contentPadding: Pad(left: 10, right: 10),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                      )),
                  menuProps: MenuProps(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.circular(8))),
                  itemBuilder: (context, terminal, isVisible) =>
                      ColumnSuper(alignment: Alignment.centerLeft, children: [
                        Padding(
                          padding: const Pad(all: 10),
                          child: Text(
                            "${terminal?.type}",
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
                      'Select Labour Type',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  showSearchBox: true,
                  searchDelay: const Duration(microseconds: 500)),
              items: LabourType.values,
              itemAsString: (LabourType? u) => u?.type ?? "",
              onChanged: (LabourType? data) =>
                  ref.watch(_labourTypeProvider.notifier).state = data,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    contentPadding: Pad(left: 10, bottom: 5, top: 5),
                    hintText: "Select Labour Type",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: secondColorSuperDark))),
              ),
            ),
          ),
          if (ref.watch(_labourTypeProvider) == LabourType.companyLabour)
            _companyLabourLayout(),
          SizedBox(
            height: 10,
          ),
          if (manditaxAvailability) _clientLabourLayout()
        ],
      );

  _companyLabourLayout() => Column(
        children: [
          SizedBox(
            height: 10,
          ),
          titleWidget(text: 'Select Labour Contractor'),
          ref.watch(getGeneratedCaseIdContractorListProvider).when(
                data: (data) => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DropdownSearch<ContractorDatum?>(
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
                                side: const BorderSide(color: primaryColor),
                                borderRadius: BorderRadius.circular(8))),
                        itemBuilder: (context, terminal, isVisible) =>
                            ColumnSuper(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Padding(
                                    padding: const Pad(all: 10),
                                    child: Text(
                                      "${terminal?.contractorName}",
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
                            'Select Labour Contractor',
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

                    items: data.data ?? [],
                    itemAsString: (ContractorDatum? u) =>
                        u?.contractorName ?? "",
                    onChanged: (ContractorDatum? data) => ref
                        .watch(_labourContractorProvider.notifier)
                        .state = data,
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          contentPadding: Pad(left: 10, bottom: 5, top: 5),
                          hintText: "Select Labour Contractor",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(color: secondColorSuperDark))),
                    ),
                  ),
                ),
                error: (e, s) => Container(),
                loading: () => Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: primaryColor,
                  child: Container(
                    height: context.fullHeight,
                    width: context.fullWidth,
                    alignment: Alignment.center,
                    child: ElevarmTextInputField(
                      hintText: 'Loading...',
                      suffixIconAssetName: Icons.money,
                      onTapSuffix: null,
                      errorText: null,
                      enabled: false,
                      isRequired: true,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
              ),
          SizedBox(
            height: 10,
          ),
          if (ref.watch(_labourContractorProvider) != null)
            ref
                .watch(getGeneratedCaseIdContractorRateListProvider(
                    commodityId: "${ref.watch(_commodityProvider)?.id}",
                    contractorId:
                        "${ref.watch(_labourContractorProvider)?.id}"))
                .when(
                  data: (data) {
                    _contractorPhoneController.text = '';
                    _contractorRateController.text = '';
                    if (data.data != null) {
                      _contractorPhoneController.text =
                          "${data.data?.contractorPhone}";
                      _contractorRateController.text =
                          "${data.data?.labourRate}";
                    }
                    return Column(
                      children: [
                        titleWidget(text: 'Labour Contractor Phone Number'),
                        ElevarmTextInputField(
                          hintText: 'Contractor Phone Number',
                          suffixIconAssetName: Icons.phone,
                          onTapSuffix: null,
                          errorText: null,
                          enabled: false,
                          controller: _contractorPhoneController,
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
                        titleWidget(text: 'Labour Contractor Rate Per Qtl.'),
                        ElevarmTextInputField(
                          hintText: 'Contractor Rate Per Qtl.',
                          suffixIconAssetName: Icons.line_weight,
                          onTapSuffix: null,
                          errorText: null,
                          enabled: false,
                          controller: _contractorRateController,
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
                      ],
                    );
                  },
                  error: (e, s) => Container(),
                  loading: () => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: primaryColor,
                    child: Container(
                      height: context.fullHeight,
                      width: context.fullWidth,
                      alignment: Alignment.center,
                      child: ElevarmTextInputField(
                        hintText: 'Loading...',
                        suffixIconAssetName: Icons.money,
                        onTapSuffix: null,
                        errorText: null,
                        enabled: false,
                        isRequired: true,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                )
        ],
      );

  _clientLabourLayout() => Column(
        children: [
          titleWidget(text: 'Select Commodity Type'),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: DropdownSearch<CommodityType?>(
              popupProps: PopupProps.menu(
                  searchFieldProps: const TextFieldProps(
                      autofocus: true,
                      cursorColor: primaryColor,
                      padding: Pad(left: 10, right: 10),
                      decoration: InputDecoration(
                        contentPadding: Pad(left: 10, right: 10),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: primaryColor)),
                      )),
                  menuProps: MenuProps(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.circular(8))),
                  itemBuilder: (context, terminal, isVisible) =>
                      ColumnSuper(alignment: Alignment.centerLeft, children: [
                        Padding(
                          padding: const Pad(all: 10),
                          child: Text(
                            "${terminal?.type}",
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
                      'Select Commodity Type',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  showSearchBox: true,
                  searchDelay: const Duration(microseconds: 500)),
              items: CommodityType.values,
              itemAsString: (CommodityType? u) => u?.type ?? "",
              onChanged: (CommodityType? data) =>
                  ref.watch(_commodityTypeProvider.notifier).state = data,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    contentPadding: Pad(left: 10, bottom: 5, top: 5),
                    hintText: "Select Commodity Type",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: secondColorSuperDark))),
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Case ID'),
        centerTitle: true,
      ),
      body: Form(
          key: _validationKey,
          child: SingleChildScrollView(
            keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag, //this will dismiss

            child: Padding(
              padding: Pad(all: 10),
              child: Column(
                children: [
                  ref.watch(profileDataProvider).when(
                      data: (data) {
                        Future.delayed(Duration.zero).then((value) {
                          ref
                              .watch(_manditaxAvailabilityProvider.notifier)
                              .state = data.profileData?.manditaxAvailability
                                  .toString() ==
                              "1";
                        });
                        return titleWidget(
                            text: '${data.profileData?.terminalName}',
                            alignment: MainAxisAlignment.center);
                      },
                      error: (e, s) => Container(),
                      loading: () => Container()),
                  SizedBox(
                    height: 10,
                  ),
                  titleWidget(text: 'Select Customer'),
                  _customerLayout(context),
                  SizedBox(
                    height: 10,
                  ),
                  if (ref.watch(_customerProvider) != null)
                    Column(
                      children: [
                        titleWidget(text: 'Select Commodity'),
                        _commodityLayout(context),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  if (ref.watch(_commodityProvider) != null)
                    Column(
                      children: [
                        titleWidget(text: 'Select Stack'),
                        _stacklayout(context),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  if (ref.watch(_stackProvider) != null)
                    Column(
                      children: [
                        titleWidget(text: 'Select TransportType'),
                        _transportTypeLayout(context),
                        SizedBox(
                          height: 10,
                        ),
                        if (ref.watch(_transportTypeProvider) != null)
                          ref.watch(_transportTypeProvider) ==
                                  TransportType.companyTransport
                              ? _companyTransportLayout()
                              : _clientTransportLayout(),
                        SizedBox(
                          height: 10,
                        ),
                        _driverLayout(),
                        SizedBox(
                          height: 10,
                        ),
                        _weightLayout(),
                        SizedBox(
                          height: 10,
                        ),
                        _contractorLayout(
                            ref.watch(_manditaxAvailabilityProvider)),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  SizedBox(
                    width: context.fullWidth,
                    child: ElevarmPrimaryButton.text(
                      buttonThemeData: ElevarmPrimaryButtonThemeData(
                          primaryColor: primaryColor),
                      text: 'Submit',
                      onPressed: () async {
                        if (_validateEntries()) {
                          if (_validationKey.currentState!.validate()) {
                            showLoaderDialog(context);
                            ref
                                .watch(generateCaseIdProvider(params: {
                              'terminal_id':
                                  "${ref.watch(sharedUtilityProvider).getUser()?.terminal}",
                              'customer_uid':
                                  "${ref.watch(_customerProvider)?.id}",
                              'commodity_id':
                                  "${ref.watch(_commodityProvider)?.id}",
                              'stack_id': "${ref.watch(_stackProvider)?.id}",
                              'transporter_type':
                                  "${ref.watch(_transportTypeProvider)?.value}",
                              'vehicle_type':
                                  "${ref.watch(_vehicleTypeProvider) == null ? 1 : ref.watch(_vehicleTypeProvider)?.value}",
                              'vehicle': ref.watch(
                                              _vehicleRegistrationTypeProvider) ==
                                          null ||
                                      ref.watch(
                                              _vehicleRegistrationTypeProvider) ==
                                          RegistrationType.Registered
                                  ? _vehicleNumberController.text
                                  : ref
                                      .watch(_vehicleRegistrationTypeProvider)!
                                      .label,
                              'driver_number': _driverNoController.text,
                              'trip_id': "${ref.watch(_tripIdProvider)?.id}",
                              'weight': _weightControllerKG.text,
                              'contractor_type':
                                  "${ref.watch(_labourTypeProvider)?.value}",
                              'labour_contractor_id':
                                  "${ref.watch(_labourContractorProvider)?.id}",
                              'contractor_name':
                                  "${ref.watch(_labourContractorProvider)?.contractorName}",
                              'contractor_no': _contractorPhoneController.text,
                              'labour_rate_per_bags':
                                  _contractorRateController.text,
                              'sales_status':
                                  ref.watch(_commodityTypeProvider)?.title,
                            }).future)
                                .then((value) {
                              hideLoaderDialog(context);

                              if (value['status'].toString() == "1") {
                                ref.watch(goRouterProvider).pop();
                              }
                              Fluttertoast.showToast(
                                  msg: value['message'].toString());
                            }).onError((e, s) {
                              hideLoaderDialog(context);
                            });
                          }
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  bool _validateEntries() {
    if (ref.watch(_customerProvider) == null) {
      Fluttertoast.showToast(msg: 'Please select Customer');
      return false;
    } else if (ref.watch(_commodityProvider) == null) {
      Fluttertoast.showToast(msg: 'Please select commodity');
      return false;
    } else if (ref.watch(_stackProvider) == null) {
      Fluttertoast.showToast(msg: 'Please select stack');
      return false;
    } else if (ref.watch(_transportTypeProvider) == null) {
      Fluttertoast.showToast(msg: 'Please select transport type');
      return false;
    } else if (ref.watch(_vehicleTypeProvider) == VehicleType.Tractor &&
        ref.watch(_vehicleRegistrationTypeProvider) == null) {
      Fluttertoast.showToast(msg: 'Please select registration type');
      return false;
    } else if (ref.watch(_labourTypeProvider) == null) {
      Fluttertoast.showToast(msg: 'Please select labour type');
      return false;
    } else if (ref.watch(_transportTypeProvider) != null &&
        ref.watch(_transportTypeProvider) == TransportType.clientTransport) {
      if (ref.watch(_vehicleTypeProvider) == null) {
        Fluttertoast.showToast(msg: 'please select vehicle type');
        return false;
      }
    } else if (ref.watch(_transportTypeProvider) != null &&
        ref.watch(_transportTypeProvider) == TransportType.companyTransport) {
      if (ref.watch(_tripIdProvider) == null) {
        Fluttertoast.showToast(msg: 'please select tripId');
        return false;
      }
    } else if (ref.watch(_labourTypeProvider) != null &&
        ref.watch(_labourTypeProvider) == LabourType.companyLabour) {
      if (ref.watch(_labourContractorProvider) == null) {
        Fluttertoast.showToast(msg: 'Please select labour contractor');
        return false;
      }
    }

    return true;
  }
}
