import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/ColorConstant.dart';
import '../../Widgets/widgets.dart';

class WarehouseOnboardingScreen extends ConsumerStatefulWidget {
  const WarehouseOnboardingScreen({super.key});

  @override
  ConsumerState<WarehouseOnboardingScreen> createState() =>
      _WarehouseOnboardingScreenState();
}

class _WarehouseOnboardingScreenState
    extends ConsumerState<WarehouseOnboardingScreen> {
  int _currentStep = 0;
  final _formKeyStep1 = GlobalKey<FormState>();
  final _formKeyStep2 = GlobalKey<FormState>();
  final _formKeyStep3 = GlobalKey<FormState>();
  final _formKeyStep4 = GlobalKey<FormState>();

  final ScrollController _scrollController = ScrollController();

  // ----------------------------------------------------
  // FORM 1 - STEP 1: OFFICE DATA CONTROLLERS
  // ----------------------------------------------------
  final _whsNameController = TextEditingController();
  final _ownerNameController = TextEditingController();
  final _ownerPanController = TextEditingController();
  final _ownerAddressController = TextEditingController();
  final _whsAddressController = TextEditingController();
  final _areaController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _stateController = TextEditingController();

  DateTime? _leaseExpiryDate;
  final _leaseExpiryDateController = TextEditingController();
  final _capacityController = TextEditingController();
  String _capacityUnit = 'MT'; // MT or QTL
  final _rateController = TextEditingController();

  final _apmcNameController = TextEditingController();
  final _apmcLocationController = TextEditingController();

  final _areaManagerNameController = TextEditingController();
  final _areaManagerPhoneController = TextEditingController();
  final _whsContactNameController = TextEditingController();
  final _whsContactPhoneController = TextEditingController();
  final _stateHeadNameController = TextEditingController();
  final _stateHeadPhoneController = TextEditingController();

  final _policeStationNameController = TextEditingController();
  final _policeStationAddressController = TextEditingController();
  final _policeStationPhoneController = TextEditingController();
  final _fireBrigadeNameController = TextEditingController();
  final _fireBrigadeAddressController = TextEditingController();

  final _officeRemarksController = TextEditingController();

  // ----------------------------------------------------
  // STEP 2: OWNER BANK DETAILS CONTROLLERS
  // ----------------------------------------------------
  final _bankAccountHolderController = TextEditingController();
  final _bankNameController = TextEditingController();
  final _branchNameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _confirmAccountNumberController = TextEditingController();
  final _ifscController = TextEditingController();

  // ----------------------------------------------------
  // FORM 2 - STEP 3: FIELD DATA / PHYSICAL VERIFICATION
  // ----------------------------------------------------
  bool _addressVerified = true;
  int _noOfFacings = 1;

  bool _facingNorth = false;
  final _facingNorthDetailsController = TextEditingController();

  bool _facingEast = false;
  final _facingEastDetailsController = TextEditingController();

  bool _facingWest = false;
  final _facingWestDetailsController = TextEditingController();

  bool _facingSouth = false;
  final _facingSouthDetailsController = TextEditingController();

  final _dgPinLocationController = TextEditingController();
  final _dgPinCoordinatesController = TextEditingController();
  final _landmarksController = TextEditingController();

  bool _stackPlanPrepared = false;
  final _stackPlanRefController = TextEditingController();
  bool _dgPinLandmarksSuperimposed = false;
  final _approachRoadRemarksController = TextEditingController();

  // Vendors & Contacts
  final _kanta1NameController = TextEditingController();
  final _kanta1AddressController = TextEditingController();
  final _kanta1PhoneController = TextEditingController();

  final _kanta2NameController = TextEditingController();
  final _kanta2AddressController = TextEditingController();
  final _kanta2PhoneController = TextEditingController();

  final _labourThekedar1NameController = TextEditingController();
  final _labourThekedar1PhoneController = TextEditingController();
  final _labourThekedar2NameController = TextEditingController();
  final _labourThekedar2PhoneController = TextEditingController();

  final _transporter1NameController = TextEditingController();
  final _transporter1PhoneController = TextEditingController();
  final _transporter2NameController = TextEditingController();
  final _transporter2PhoneController = TextEditingController();

  final _fieldPoliceThanaNameController = TextEditingController();
  final _fieldPoliceThanaAddressController = TextEditingController();
  final _fieldPoliceThanaPhoneController = TextEditingController();

  final _fieldFireBrigadeNameController = TextEditingController();
  final _fieldFireBrigadeAddressController = TextEditingController();
  final _fieldFireBrigadePhoneController = TextEditingController();

  final _whistleBlower1NameController = TextEditingController();
  final _whistleBlower1PhoneController = TextEditingController();
  final _whistleBlower2NameController = TextEditingController();
  final _whistleBlower2PhoneController = TextEditingController();

  final _fieldApmcNameController = TextEditingController();
  final _fieldApmcLocationController = TextEditingController();
  final _commodity1Controller = TextEditingController();
  final _commodity2Controller = TextEditingController();
  final _commodity3Controller = TextEditingController();
  final _otherCommodityRemarksController = TextEditingController();

  // ----------------------------------------------------
  // STEP 4: INFRASTRUCTURE, CCTV & PHOTOS
  // ----------------------------------------------------
  bool _cctvInstalled = false;
  final _cctvVendorController = TextEditingController();
  final _cctvUserIdController = TextEditingController();
  final _cctvPasswordController = TextEditingController();
  final _cctvCamerasCoverageController = TextEditingController();

  File? _northViewPhoto;
  File? _eastViewPhoto;
  File? _westViewPhoto;
  File? _southViewPhoto;
  final List<File> _additionalPhotos = [];
  final _additionalPhotoDetailsController = TextEditingController();

  bool _isFetchingLocation = false;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _scrollController.dispose();

    _whsNameController.dispose();
    _ownerNameController.dispose();
    _ownerPanController.dispose();
    _ownerAddressController.dispose();
    _whsAddressController.dispose();
    _areaController.dispose();
    _pincodeController.dispose();
    _stateController.dispose();

    _leaseExpiryDateController.dispose();
    _capacityController.dispose();
    _rateController.dispose();

    _apmcNameController.dispose();
    _apmcLocationController.dispose();

    _areaManagerNameController.dispose();
    _areaManagerPhoneController.dispose();
    _whsContactNameController.dispose();
    _whsContactPhoneController.dispose();
    _stateHeadNameController.dispose();
    _stateHeadPhoneController.dispose();

    _policeStationNameController.dispose();
    _policeStationAddressController.dispose();
    _policeStationPhoneController.dispose();
    _fireBrigadeNameController.dispose();
    _fireBrigadeAddressController.dispose();

    _officeRemarksController.dispose();

    _bankAccountHolderController.dispose();
    _bankNameController.dispose();
    _branchNameController.dispose();
    _accountNumberController.dispose();
    _confirmAccountNumberController.dispose();
    _ifscController.dispose();

    _facingNorthDetailsController.dispose();
    _facingEastDetailsController.dispose();
    _facingWestDetailsController.dispose();
    _facingSouthDetailsController.dispose();

    _dgPinLocationController.dispose();
    _dgPinCoordinatesController.dispose();
    _landmarksController.dispose();
    _stackPlanRefController.dispose();
    _approachRoadRemarksController.dispose();

    _kanta1NameController.dispose();
    _kanta1AddressController.dispose();
    _kanta1PhoneController.dispose();
    _kanta2NameController.dispose();
    _kanta2AddressController.dispose();
    _kanta2PhoneController.dispose();

    _labourThekedar1NameController.dispose();
    _labourThekedar1PhoneController.dispose();
    _labourThekedar2NameController.dispose();
    _labourThekedar2PhoneController.dispose();

    _transporter1NameController.dispose();
    _transporter1PhoneController.dispose();
    _transporter2NameController.dispose();
    _transporter2PhoneController.dispose();

    _fieldPoliceThanaNameController.dispose();
    _fieldPoliceThanaAddressController.dispose();
    _fieldPoliceThanaPhoneController.dispose();
    _fieldFireBrigadeNameController.dispose();
    _fieldFireBrigadeAddressController.dispose();
    _fieldFireBrigadePhoneController.dispose();

    _whistleBlower1NameController.dispose();
    _whistleBlower1PhoneController.dispose();
    _whistleBlower2NameController.dispose();
    _whistleBlower2PhoneController.dispose();

    _fieldApmcNameController.dispose();
    _fieldApmcLocationController.dispose();
    _commodity1Controller.dispose();
    _commodity2Controller.dispose();
    _commodity3Controller.dispose();
    _otherCommodityRemarksController.dispose();

    _cctvVendorController.dispose();
    _cctvUserIdController.dispose();
    _cctvPasswordController.dispose();
    _cctvCamerasCoverageController.dispose();
    _additionalPhotoDetailsController.dispose();

    super.dispose();
  }

  // ----------------------------------------------------
  // GPS AUTO FETCH
  // ----------------------------------------------------
  Future<void> _fetchCurrentCoordinates() async {
    setState(() => _isFetchingLocation = true);
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Fluttertoast.showToast(msg: 'Location permissions are denied');
          setState(() => _isFetchingLocation = false);
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        Fluttertoast.showToast(
            msg: 'Location permissions permanently denied. Enable in Settings.');
        setState(() => _isFetchingLocation = false);
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          timeLimit: const Duration(seconds: 10));
      setState(() {
        _dgPinCoordinatesController.text =
            "${position.latitude.toStringAsFixed(6)}, ${position.longitude.toStringAsFixed(6)}";
      });
      Fluttertoast.showToast(msg: "Coordinates captured successfully!");
    } catch (e) {
      Fluttertoast.showToast(msg: "Could not fetch GPS coordinates: $e");
    } finally {
      if (mounted) setState(() => _isFetchingLocation = false);
    }
  }

  // ----------------------------------------------------
  // IMAGE PICKER HELPER
  // ----------------------------------------------------
  Future<void> _showImageSourceDialog({required Function(File) onSelected}) async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Select Image Source",
                style: TextStyle(
                    fontSize: Adaptive.sp(16),
                    fontWeight: FontWeight.bold,
                    color: primaryColorDark),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async {
                      Navigator.pop(ctx);
                      final picked = await pickImage(source: ImageSource.camera);
                      if (picked != null) onSelected(File(picked.path));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: primaryColor.withOpacity(0.12),
                          child: const Icon(Icons.camera_alt_rounded,
                              color: primaryColor, size: 28),
                        ),
                        const SizedBox(height: 8),
                        Text("Camera",
                            style: TextStyle(
                                fontSize: Adaptive.sp(14),
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.pop(ctx);
                      final picked = await pickImage(source: ImageSource.gallery);
                      if (picked != null) onSelected(File(picked.path));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: secondaryColor.withOpacity(0.18),
                          child: const Icon(Icons.photo_library_rounded,
                              color: secondColorSuperDark, size: 28),
                        ),
                        const SizedBox(height: 8),
                        Text("Gallery",
                            style: TextStyle(
                                fontSize: Adaptive.sp(14),
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  // ----------------------------------------------------
  // STEP NAVIGATION
  // ----------------------------------------------------
  void _nextStep() {
    if (_currentStep == 0) {
      if (!_formKeyStep1.currentState!.validate()) {
        Fluttertoast.showToast(msg: "Please fix required Office Data fields");
        return;
      }
    } else if (_currentStep == 1) {
      if (!_formKeyStep2.currentState!.validate()) {
        Fluttertoast.showToast(msg: "Please check Bank Details");
        return;
      }
      if (_accountNumberController.text !=
          _confirmAccountNumberController.text) {
        Fluttertoast.showToast(msg: "Account numbers do not match");
        return;
      }
    } else if (_currentStep == 2) {
      if (!_formKeyStep3.currentState!.validate()) {
        Fluttertoast.showToast(msg: "Please fill required Field Visit details");
        return;
      }
    }

    if (_currentStep < 3) {
      setState(() => _currentStep++);
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  // ----------------------------------------------------
  // SUBMISSION
  // ----------------------------------------------------
  void _submitForm() {
    if (!_formKeyStep4.currentState!.validate()) {
      Fluttertoast.showToast(msg: "Please complete required CCTV/Photos fields");
      return;
    }

    setState(() => _isSubmitting = true);

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() => _isSubmitting = false);

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          contentPadding: const EdgeInsets.all(20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_circle_rounded,
                    color: primaryColor, size: 50),
              ),
              const SizedBox(height: 16),
              Text(
                "Onboarding Submitted!",
                style: TextStyle(
                  fontSize: Adaptive.sp(18),
                  fontWeight: FontWeight.bold,
                  color: primaryColorDark,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Warehouse '${_whsNameController.text.trim().isNotEmpty ? _whsNameController.text.trim() : "Warehouse"}' onboarding details have been saved successfully and sent for Custodian verification.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Adaptive.sp(14),
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.pop(ctx);
                    context.pop();
                  },
                  child: Text(
                    "Back to Dashboard",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Adaptive.sp(15),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  // ----------------------------------------------------
  // BUILD MAIN UI
  // ----------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f9fa),
      appBar: AppBar(
        title: const Text(
          'Warehouse Onboarding',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 1,
      ),
      body: Column(
        children: [
          _buildStepHeader(),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: _buildCurrentStepContent(),
            ),
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }

  // ----------------------------------------------------
  // STEP HEADER
  // ----------------------------------------------------
  Widget _buildStepHeader() {
    final steps = [
      {'title': 'Office Data', 'icon': Icons.description_outlined},
      {'title': 'Bank Details', 'icon': Icons.account_balance_outlined},
      {'title': 'Field Visit', 'icon': Icons.verified_outlined},
      {'title': 'CCTV & Photos', 'icon': Icons.camera_alt_outlined},
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        children: List.generate(steps.length * 2 - 1, (index) {
          if (index.isOdd) {
            final prevStep = index ~/ 2;
            final isPassed = _currentStep > prevStep;
            return Expanded(
              child: Container(
                height: 3,
                color: isPassed ? primaryColor : Colors.grey.shade300,
              ),
            );
          }

          final stepIdx = index ~/ 2;
          final isActive = _currentStep == stepIdx;
          final isDone = _currentStep > stepIdx;

          return GestureDetector(
            onTap: () {
              if (stepIdx < _currentStep) {
                setState(() => _currentStep = stepIdx);
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: isDone
                        ? primaryColor
                        : isActive
                            ? primaryColor
                            : Colors.grey.shade200,
                    shape: BoxShape.circle,
                    boxShadow: isActive
                        ? [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.35),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            )
                          ]
                        : null,
                  ),
                  child: Icon(
                    isDone
                        ? Icons.check
                        : (steps[stepIdx]['icon'] as IconData),
                    size: 20,
                    color: isDone || isActive ? Colors.white : Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  steps[stepIdx]['title'] as String,
                  style: TextStyle(
                    fontSize: Adaptive.sp(11.5),
                    fontWeight:
                        isActive ? FontWeight.bold : FontWeight.w500,
                    color: isActive ? primaryColorDark : Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // ----------------------------------------------------
  // STEP CONTENT ROUTING
  // ----------------------------------------------------
  Widget _buildCurrentStepContent() {
    switch (_currentStep) {
      case 0:
        return _buildStep1OfficeData();
      case 1:
        return _buildStep2BankDetails();
      case 2:
        return _buildStep3FieldVerification();
      case 3:
        return _buildStep4CCTVAndPhotos();
      default:
        return const SizedBox.shrink();
    }
  }

  // ----------------------------------------------------
  // STEP 1: FORM 1 - OFFICE DATA
  // ----------------------------------------------------
  Widget _buildStep1OfficeData() {
    return Form(
      key: _formKeyStep1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // _buildInfoBanner(
          //   title: "FORM 1 – OFFICE DATA",
          //   subtitle:
          //       "To be filled by Office / Onboarding Coordination Team before physical field visit.",
          //   icon: Icons.assignment_outlined,
          // ),
          // const SizedBox(height: 14),

          // Card 1: Basic Information
          _buildSectionCard(
            title: "Warehouse & Owner Details",
            icon: Icons.store_mall_directory_rounded,
            children: [
              _buildTextField(
                controller: _whsNameController,
                label: "Warehouse / WHS Name",
                hint: "e.g., Shri Ram Agro Warehouse",
                isRequired: true,
                prefixIcon: Icons.apartment,
              ),
              _buildTextField(
                controller: _ownerNameController,
                label: "Warehouse Owner Name",
                hint: "Full legal name of owner",
                isRequired: true,
                prefixIcon: Icons.person_outline,
              ),
              _buildTextField(
                controller: _ownerPanController,
                label: "Owner PAN Number",
                hint: "ABCDE1234F",
                isRequired: true,
                textCapitalization: TextCapitalization.characters,
                prefixIcon: Icons.badge_outlined,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) return "Owner PAN is required";
                  if (val.trim().length != 10) return "PAN must be 10 characters";
                  return null;
                },
              ),
              _buildTextField(
                controller: _ownerAddressController,
                label: "Owner Address",
                hint: "Permanent / Billing address",
                prefixIcon: Icons.home_outlined,
                maxLines: 2,
              ),
              _buildTextField(
                controller: _whsAddressController,
                label: "Warehouse Address",
                hint: "Physical site address",
                isRequired: true,
                prefixIcon: Icons.location_on_outlined,
                maxLines: 2,
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _areaController,
                      label: "Area / Tehsil",
                      hint: "e.g., Reengus",
                      prefixIcon: Icons.map_outlined,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(
                      controller: _pincodeController,
                      label: "Pincode",
                      hint: "332404",
                      isRequired: true,
                      keyboardType: TextInputType.number,
                      prefixIcon: Icons.pin_drop_outlined,
                      validator: (val) {
                        if (val == null || val.trim().isEmpty) return "Pincode required";
                        if (val.trim().length != 6) return "6 digits required";
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              _buildTextField(
                controller: _stateController,
                label: "State",
                hint: "e.g., Rajasthan",
                prefixIcon: Icons.public,
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Card 2: Commercial & Capacity
          _buildSectionCard(
            title: "Capacity & Commercial Terms",
            icon: Icons.currency_rupee_rounded,
            children: [
              _buildDatePickerField(
                label: "Lease Expiry Date",
                controller: _leaseExpiryDateController,
                prefixIcon: Icons.calendar_today_outlined,
                selectedDate: _leaseExpiryDate,
                onDateSelected: (date) {
                  setState(() {
                    _leaseExpiryDate = date;
                    _leaseExpiryDateController.text =
                        DateFormat('dd-MM-yyyy').format(date);
                  });
                },
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: _buildTextField(
                      controller: _capacityController,
                      label: "Warehouse Capacity",
                      hint: "e.g., 5000",
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      prefixIcon: Icons.inventory_2_outlined,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: DropdownButtonFormField<String>(
                        value: _capacityUnit,
                        decoration: InputDecoration(
                          labelText: "Unit",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                        ),
                        items: const [
                          DropdownMenuItem(value: 'MT', child: Text('MT')),
                          DropdownMenuItem(value: 'QTL', child: Text('QTL')),
                        ],
                        onChanged: (v) => setState(() => _capacityUnit = v!),
                      ),
                    ),
                  ),
                ],
              ),
              _buildTextField(
                controller: _rateController,
                label: "Warehouse Rate / Rent",
                hint: "₹ per QTL / month",
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                prefixIcon: Icons.payments_outlined,
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _apmcNameController,
                      label: "APMC Name",
                      hint: "Nearby APMC",
                      prefixIcon: Icons.storefront_outlined,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(
                      controller: _apmcLocationController,
                      label: "APMC Location",
                      hint: "City / Market yard",
                      prefixIcon: Icons.place_outlined,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Card 3: Key Company Contacts
          _buildSectionCard(
            title: "Key Responsible Team",
            icon: Icons.group_outlined,
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _areaManagerNameController,
                      label: "Area Manager Name",
                      hint: "Manager Name",
                      prefixIcon: Icons.badge_outlined,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(
                      controller: _areaManagerPhoneController,
                      label: "Area Manager Contact",
                      hint: "10-digit number",
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone_outlined,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _whsContactNameController,
                      label: "WHS Contact Name",
                      hint: "Supervisor / Caretaker",
                      prefixIcon: Icons.person_pin_circle_outlined,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(
                      controller: _whsContactPhoneController,
                      label: "WHS Contact Number",
                      hint: "10-digit number",
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone_outlined,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _stateHeadNameController,
                      label: "State Head Name",
                      hint: "State Head Name",
                      prefixIcon: Icons.person_outline,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(
                      controller: _stateHeadPhoneController,
                      label: "State Head Number",
                      hint: "10-digit number",
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone_outlined,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Card 4: Emergency Contacts & Remarks
          _buildSectionCard(
            title: "Emergency Stations & Office Remarks",
            icon: Icons.local_police_outlined,
            children: [
              _buildTextField(
                controller: _policeStationNameController,
                label: "Police Station Name",
                hint: "Local Police Station",
                prefixIcon: Icons.local_police_outlined,
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _policeStationAddressController,
                      label: "Police Station Address",
                      hint: "Address / Landmark",
                      prefixIcon: Icons.location_on_outlined,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(
                      controller: _policeStationPhoneController,
                      label: "Police Station Phone",
                      hint: "Phone / Landline",
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone_outlined,
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              _buildTextField(
                controller: _fireBrigadeNameController,
                label: "Fire Brigade Name",
                hint: "Local Fire Station",
                prefixIcon: Icons.fire_extinguisher_outlined,
              ),
              _buildTextField(
                controller: _fireBrigadeAddressController,
                label: "Fire Brigade Address",
                hint: "Address / Station location",
                prefixIcon: Icons.location_on_outlined,
              ),
              const Divider(height: 24),
              _buildTextField(
                controller: _officeRemarksController,
                label: "Office Remarks / Initial Screening",
                hint: "Notes, commercial feasibility, eligibility remarks",
                prefixIcon: Icons.notes_rounded,
                maxLines: 3,
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ----------------------------------------------------
  // STEP 2: OWNER BANK DETAILS
  // ----------------------------------------------------
  Widget _buildStep2BankDetails() {
    return Form(
      key: _formKeyStep2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          _buildSectionCard(
            title: "Bank Account Information",
            icon: Icons.account_balance_wallet_outlined,
            children: [
              _buildTextField(
                controller: _bankAccountHolderController,
                label: "Account Holder Name",
                hint: "As per bank passbook / cheque",
                isRequired: true,
                prefixIcon: Icons.person_outline,
              ),
              _buildTextField(
                controller: _bankNameController,
                label: "Bank Name",
                hint: "e.g., State Bank of India, HDFC Bank",
                isRequired: true,
                prefixIcon: Icons.account_balance_outlined,
              ),
              _buildTextField(
                controller: _branchNameController,
                label: "Branch Name",
                hint: "Branch city / location",
                prefixIcon: Icons.location_city_outlined,
              ),
              _buildTextField(
                controller: _accountNumberController,
                label: "Account Number",
                hint: "Enter bank account number",
                isRequired: true,
                keyboardType: TextInputType.number,
                prefixIcon: Icons.numbers_outlined,
              ),
              _buildTextField(
                controller: _confirmAccountNumberController,
                label: "Confirm Account Number",
                hint: "Re-enter bank account number",
                isRequired: true,
                keyboardType: TextInputType.number,
                prefixIcon: Icons.check_circle_outline,
                validator: (val) {
                  if (val == null || val.isEmpty) return "Please re-enter account number";
                  if (val != _accountNumberController.text) {
                    return "Account numbers do not match";
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: _ifscController,
                label: "IFSC Code",
                hint: "e.g., SBIN0001234",
                isRequired: true,
                textCapitalization: TextCapitalization.characters,
                prefixIcon: Icons.vpn_key_outlined,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) return "IFSC is required";
                  if (val.trim().length != 11) return "IFSC must be 11 characters";
                  return null;
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ----------------------------------------------------
  // STEP 3: FORM 2 - FIELD DATA / PHYSICAL VERIFICATION
  // ----------------------------------------------------
  Widget _buildStep3FieldVerification() {
    return Form(
      key: _formKeyStep3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [



          // Section 1: Location & Facings
          _buildSectionCard(
            title: "1. Warehouse Location & Physical Verification",
            icon: Icons.pin_drop_rounded,
            children: [
              _buildSwitchRow(
                label: "Warehouse Location / Address Verified",
                value: _addressVerified,
                onChanged: (val) => setState(() => _addressVerified = val),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: DropdownButtonFormField<int>(
                  value: _noOfFacings,
                  decoration: InputDecoration(
                    labelText: "No. of Warehouse Facings",
                    prefixIcon: const Icon(Icons.compass_calibration_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                  items: const [
                    DropdownMenuItem(value: 1, child: Text('1 Facing')),
                    DropdownMenuItem(value: 2, child: Text('2 Facings')),
                    DropdownMenuItem(value: 3, child: Text('3 Facings')),
                    DropdownMenuItem(value: 4, child: Text('4 Facings')),
                  ],
                  onChanged: (v) => setState(() => _noOfFacings = v!),
                ),
              ),
              const Divider(),
              Text(
                "Facings & Orientation Details:",
                style: TextStyle(
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold,
                    color: primaryColorDark),
              ),
              const SizedBox(height: 8),
              _buildFacingInput(
                title: "Facing – North",
                isChecked: _facingNorth,
                onToggle: (v) => setState(() => _facingNorth = v),
                controller: _facingNorthDetailsController,
              ),
              _buildFacingInput(
                title: "Facing – East",
                isChecked: _facingEast,
                onToggle: (v) => setState(() => _facingEast = v),
                controller: _facingEastDetailsController,
              ),
              _buildFacingInput(
                title: "Facing – West",
                isChecked: _facingWest,
                onToggle: (v) => setState(() => _facingWest = v),
                controller: _facingWestDetailsController,
              ),
              _buildFacingInput(
                title: "Facing – South",
                isChecked: _facingSouth,
                onToggle: (v) => setState(() => _facingSouth = v),
                controller: _facingSouthDetailsController,
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Section 2: DG Pin & Landmarks
          _buildSectionCard(
            title: "Geotagging & Accessibility",
            icon: Icons.my_location_rounded,
            children: [
              _buildTextField(
                controller: _dgPinLocationController,
                label: "DG Pin / Exact Location",
                hint: "e.g., Highway milestone, gate reference",
                prefixIcon: Icons.place_outlined,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _dgPinCoordinatesController,
                      label: "DG Pin Coordinates / Reference",
                      hint: "Latitude, Longitude",
                      prefixIcon: Icons.gps_fixed_outlined,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: _isFetchingLocation
                          ? null
                          : _fetchCurrentCoordinates,
                      icon: _isFetchingLocation
                          ? const SizedBox(
                              width: 14,
                              height: 14,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2, color: Colors.white),
                            )
                          : const Icon(Icons.gps_fixed, size: 16, color: Colors.white),
                      label: Text(
                        "Auto GPS",
                        style: TextStyle(
                            fontSize: Adaptive.sp(12), color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              _buildTextField(
                controller: _landmarksController,
                label: "Nearby Landmarks",
                hint: "Prominent temples, petrol pumps, junctions",
                prefixIcon: Icons.assistant_direction_outlined,
              ),
              const Divider(height: 24),
              _buildSwitchRow(
                label: "Stack Plan Prepared",
                value: _stackPlanPrepared,
                onChanged: (v) => setState(() => _stackPlanPrepared = v),
              ),
              _buildTextField(
                controller: _stackPlanRefController,
                label: "Stack Plan Reference / Attachment Notes",
                hint: "Drawing reference, layout id, or physical stack count",
                prefixIcon: Icons.layers_outlined,
              ),
              _buildSwitchRow(
                label: "DG Pin + Landmarks Superimposed",
                value: _dgPinLandmarksSuperimposed,
                onChanged: (v) =>
                    setState(() => _dgPinLandmarksSuperimposed = v),
              ),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _approachRoadRemarksController,
                label: "Approach Road / Accessibility Remarks",
                hint: "Paved/Kutcha road, trailer turning radius, restrictions",
                prefixIcon: Icons.add_road_outlined,
                maxLines: 2,
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Section 3: Kantas & Logistics Partners
          _buildSectionCard(
            title: "Kantas, Labour & Transporters",
            icon: Icons.local_shipping_outlined,
            children: [
              _buildSubHeading("Dharam Kanta (Weighbridge) 1"),
              _buildTextField(
                controller: _kanta1NameController,
                label: "Kanta 1 – Name",
                hint: "e.g., Balaji Dharam Kanta",
                prefixIcon: Icons.scale_outlined,
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _kanta1AddressController,
                      label: "Kanta 1 – Address",
                      hint: "Address / Distance",
                      prefixIcon: Icons.location_on_outlined,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildTextField(
                      controller: _kanta1PhoneController,
                      label: "Kanta 1 – Contact",
                      hint: "Contact number",
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone_outlined,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _buildSubHeading("Dharam Kanta (Weighbridge) 2"),
              _buildTextField(
                controller: _kanta2NameController,
                label: "Kanta 2 – Name",
                hint: "Secondary weighbridge",
                prefixIcon: Icons.scale_outlined,
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _kanta2AddressController,
                      label: "Kanta 2 – Address",
                      hint: "Address / Distance",
                      prefixIcon: Icons.location_on_outlined,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildTextField(
                      controller: _kanta2PhoneController,
                      label: "Kanta 2 – Contact",
                      hint: "Contact number",
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone_outlined,
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              _buildSubHeading("Labour Thekedars (Contractors)"),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _labourThekedar1NameController,
                      label: "Labour Thekedar 1 – Name",
                      hint: "Thekedar Name",
                      prefixIcon: Icons.engineering_outlined,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildTextField(
                      controller: _labourThekedar1PhoneController,
                      label: "Number",
                      hint: "Phone",
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone_outlined,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _labourThekedar2NameController,
                      label: "Labour Thekedar 2 – Name",
                      hint: "Thekedar Name",
                      prefixIcon: Icons.engineering_outlined,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildTextField(
                      controller: _labourThekedar2PhoneController,
                      label: "Number",
                      hint: "Phone",
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone_outlined,
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              _buildSubHeading("Transporters"),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _transporter1NameController,
                      label: "Transporter 1 – Name / ID",
                      hint: "Transporter name",
                      prefixIcon: Icons.commute_outlined,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildTextField(
                      controller: _transporter1PhoneController,
                      label: "Number",
                      hint: "Phone",
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone_outlined,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _transporter2NameController,
                      label: "Transporter 2 – Name / ID",
                      hint: "Transporter name",
                      prefixIcon: Icons.commute_outlined,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildTextField(
                      controller: _transporter2PhoneController,
                      label: "Number",
                      hint: "Phone",
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone_outlined,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Section 4: Local Authorities & Whistle Blowers
          _buildSectionCard(
            title: "Local Authorities & Whistle Blowers",
            icon: Icons.shield_outlined,
            children: [
              _buildSubHeading("Field Police Thana"),
              _buildTextField(
                controller: _fieldPoliceThanaNameController,
                label: "Police Thana – Name",
                hint: "Local thana name",
                prefixIcon: Icons.local_police_outlined,
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _fieldPoliceThanaAddressController,
                      label: "Address",
                      hint: "Thana location",
                      prefixIcon: Icons.location_on_outlined,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildTextField(
                      controller: _fieldPoliceThanaPhoneController,
                      label: "Contact Number",
                      hint: "Contact",
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone_outlined,
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              _buildSubHeading("Field Fire Brigade"),
              _buildTextField(
                controller: _fieldFireBrigadeNameController,
                label: "Fire Brigade – Name",
                hint: "Fire station name",
                prefixIcon: Icons.fire_extinguisher_outlined,
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _fieldFireBrigadeAddressController,
                      label: "Address",
                      hint: "Station location",
                      prefixIcon: Icons.location_on_outlined,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildTextField(
                      controller: _fieldFireBrigadePhoneController,
                      label: "Contact Number",
                      hint: "Contact",
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone_outlined,
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              _buildSubHeading("Whistle Blowers (Confidential Local Contacts)"),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _whistleBlower1NameController,
                      label: "Whistle Blower 1 – Name",
                      hint: "Contact name",
                      prefixIcon: Icons.visibility_outlined,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildTextField(
                      controller: _whistleBlower1PhoneController,
                      label: "Number",
                      hint: "Phone",
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone_outlined,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _whistleBlower2NameController,
                      label: "Whistle Blower 2 – Name",
                      hint: "Contact name",
                      prefixIcon: Icons.visibility_outlined,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildTextField(
                      controller: _whistleBlower2PhoneController,
                      label: "Number",
                      hint: "Phone",
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone_outlined,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Section 5: Commodities & Market
          _buildSectionCard(
            title: "Commodities & Local Market",
            icon: Icons.grass_rounded,
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _fieldApmcNameController,
                      label: "APMC Name",
                      hint: "Mandi name",
                      prefixIcon: Icons.storefront_outlined,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildTextField(
                      controller: _fieldApmcLocationController,
                      label: "APMC Location",
                      hint: "Distance / Yard",
                      prefixIcon: Icons.place_outlined,
                    ),
                  ),
                ],
              ),
              _buildTextField(
                controller: _commodity1Controller,
                label: "Commodity 1",
                hint: "e.g., Wheat, Mustard",
                prefixIcon: Icons.spa_outlined,
              ),
              _buildTextField(
                controller: _commodity2Controller,
                label: "Commodity 2",
                hint: "e.g., Gram, Barley",
                prefixIcon: Icons.spa_outlined,
              ),
              _buildTextField(
                controller: _commodity3Controller,
                label: "Commodity 3",
                hint: "e.g., Bajra, Soybean",
                prefixIcon: Icons.spa_outlined,
              ),
              _buildTextField(
                controller: _otherCommodityRemarksController,
                label: "Other Commodity / Remarks",
                hint: "Special storage parameters, quality observations",
                prefixIcon: Icons.rate_review_outlined,
                maxLines: 2,
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ----------------------------------------------------
  // STEP 4: CCTV & DIRECTIONAL PHOTOS
  // ----------------------------------------------------
  Widget _buildStep4CCTVAndPhotos() {
    return Form(
      key: _formKeyStep4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 14),

          // Card 1: CCTV Details
          _buildSectionCard(
            title: "CCTV Surveillance System",
            icon: Icons.videocam_rounded,
            children: [
              _buildSwitchRow(
                label: "CCTV Installed",
                value: _cctvInstalled,
                onChanged: (val) => setState(() => _cctvInstalled = val),
              ),
              if (_cctvInstalled) ...[
                const SizedBox(height: 8),
                _buildTextField(
                  controller: _cctvVendorController,
                  label: "CCTV Company / Vendor Name",
                  hint: "e.g., CP Plus, Hikvision, Dahua",
                  prefixIcon: Icons.business_outlined,
                ),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _cctvUserIdController,
                        label: "CCTV ID / User ID",
                        hint: "Login username",
                        prefixIcon: Icons.account_circle_outlined,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildTextField(
                        controller: _cctvPasswordController,
                        label: "CCTV Password",
                        hint: "Portal / NVR password",
                        prefixIcon: Icons.lock_outline,
                      ),
                    ),
                  ],
                ),
                _buildTextField(
                  controller: _cctvCamerasCoverageController,
                  label: "No. of Cameras / Coverage Remarks",
                  hint: "e.g., 8 Cameras, covers gate, stacks & weighbridge",
                  prefixIcon: Icons.camera_indoor_outlined,
                  maxLines: 2,
                ),
              ],
            ],
          ),
          const SizedBox(height: 14),

          // Card 2: Directional Photos
          _buildSectionCard(
            title: "Directional Site Photos",
            icon: Icons.photo_camera_rounded,
            children: [
              Text(
                "Capture or upload 4-directional views of the warehouse site:",
                style: TextStyle(
                    fontSize: Adaptive.sp(13.5),
                    color: Colors.black87,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildPhotoUploadCard(
                      label: "North View Photo",
                      direction: "North",
                      file: _northViewPhoto,
                      onSelect: (f) => setState(() => _northViewPhoto = f),
                      onRemove: () => setState(() => _northViewPhoto = null),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildPhotoUploadCard(
                      label: "East View Photo",
                      direction: "East",
                      file: _eastViewPhoto,
                      onSelect: (f) => setState(() => _eastViewPhoto = f),
                      onRemove: () => setState(() => _eastViewPhoto = null),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _buildPhotoUploadCard(
                      label: "West View Photo",
                      direction: "West",
                      file: _westViewPhoto,
                      onSelect: (f) => setState(() => _westViewPhoto = f),
                      onRemove: () => setState(() => _westViewPhoto = null),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildPhotoUploadCard(
                      label: "South View Photo",
                      direction: "South",
                      file: _southViewPhoto,
                      onSelect: (f) => setState(() => _southViewPhoto = f),
                      onRemove: () => setState(() => _southViewPhoto = null),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Card 3: Additional Photos & Details
          _buildSectionCard(
            title: "Additional Photos & Attachments",
            icon: Icons.collections_bookmark_outlined,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Additional Photos (${_additionalPhotos.length})",
                    style: TextStyle(
                      fontSize: Adaptive.sp(14),
                      fontWeight: FontWeight.bold,
                      color: primaryColorDark,
                    ),
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: primaryColor,
                    ),
                    onPressed: () {
                      _showImageSourceDialog(
                        onSelected: (f) {
                          setState(() => _additionalPhotos.add(f));
                        },
                      );
                    },
                    icon: const Icon(Icons.add_a_photo_outlined, size: 18),
                    label: const Text("Add Photo"),
                  ),
                ],
              ),
              if (_additionalPhotos.isNotEmpty) ...[
                const SizedBox(height: 8),
                SizedBox(
                  height: 95,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _additionalPhotos.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (ctx, i) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              _additionalPhotos[i],
                              width: 95,
                              height: 95,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: InkWell(
                              onTap: () => setState(
                                  () => _additionalPhotos.removeAt(i)),
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  color: Colors.black54,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.close,
                                    size: 14, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
              const SizedBox(height: 10),
              _buildTextField(
                controller: _additionalPhotoDetailsController,
                label: "Additional Photos & Attachment Details",
                hint: "Describe stack arrangements, gate condition, etc.",
                prefixIcon: Icons.description_outlined,
                maxLines: 3,
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ----------------------------------------------------
  // REUSABLE UI BUILDERS
  // ----------------------------------------------------
  Widget _buildInfoBanner({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: primaryColor.withOpacity(0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: primaryColor,
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold,
                    color: primaryColorDark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: Adaptive.sp(12),
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: primaryColor, size: 22),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: Adaptive.sp(15),
                    fontWeight: FontWeight.bold,
                    color: primaryColorDark,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget _buildSubHeading(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: Adaptive.sp(13.5),
          fontWeight: FontWeight.w600,
          color: primaryColorDark,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    bool isRequired = false,
    TextInputType keyboardType = TextInputType.text,
    TextCapitalization textCapitalization = TextCapitalization.none,
    IconData? prefixIcon,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        maxLines: maxLines,
        validator: validator ??
            (isRequired
                ? (val) {
                    if (val == null || val.trim().isEmpty) {
                      return "$label is required";
                    }
                    return null;
                  }
                : null),
        style: TextStyle(fontSize: Adaptive.sp(14)),
        decoration: InputDecoration(
          labelText: isRequired ? "$label *" : label,
          labelStyle: TextStyle(
            color: Colors.black87,
            fontSize: Adaptive.sp(13.5),
          ),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: Adaptive.sp(13)),
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: primaryColor, size: 20)
              : null,
          filled: true,
          fillColor: const Color(0xfffcfcfc),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: primaryColor, width: 1.5),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePickerField({
    required String label,
    required TextEditingController controller,
    required IconData prefixIcon,
    DateTime? selectedDate,
    required Function(DateTime) onDateSelected,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () async {
          final now = DateTime.now();
          final picked = await showDatePicker(
            context: context,
            initialDate: selectedDate ?? now.add(const Duration(days: 365)),
            firstDate: DateTime(2020),
            lastDate: DateTime(2045),
            builder: (ctx, child) => Theme(
              data: Theme.of(ctx).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: primaryColor,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
              ),
              child: child!,
            ),
          );
          if (picked != null) onDateSelected(picked);
        },
        child: IgnorePointer(
          child: TextFormField(
            controller: controller,
            style: TextStyle(fontSize: Adaptive.sp(14)),
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(
                color: Colors.black87,
                fontSize: Adaptive.sp(13.5),
              ),
              hintText: "Select Date (DD-MM-YYYY)",
              prefixIcon: Icon(prefixIcon, color: primaryColor, size: 20),
              suffixIcon: const Icon(Icons.arrow_drop_down, color: primaryColor),
              filled: true,
              fillColor: const Color(0xfffcfcfc),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchRow({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xfff8f9fa),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: Adaptive.sp(13.5),
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                value ? "YES" : "NO",
                style: TextStyle(
                  fontSize: Adaptive.sp(12.5),
                  fontWeight: FontWeight.bold,
                  color: value ? primaryColor : Colors.grey,
                ),
              ),
              const SizedBox(width: 6),
              CupertinoSwitch(
                value: value,
                activeColor: primaryColor,
                onChanged: onChanged,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFacingInput({
    required String title,
    required bool isChecked,
    required ValueChanged<bool> onToggle,
    required TextEditingController controller,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xfffafbfc),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isChecked ? primaryColor.withOpacity(0.4) : Colors.grey.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: Adaptive.sp(13.5),
                  fontWeight: FontWeight.bold,
                  color: isChecked ? primaryColorDark : Colors.black87,
                ),
              ),
              Row(
                children: [
                  Text(
                    isChecked ? "Yes" : "No",
                    style: TextStyle(
                      fontSize: Adaptive.sp(12),
                      fontWeight: FontWeight.w600,
                      color: isChecked ? primaryColor : Colors.grey,
                    ),
                  ),
                  Checkbox(
                    value: isChecked,
                    activeColor: primaryColor,
                    onChanged: (v) => onToggle(v ?? false),
                  ),
                ],
              ),
            ],
          ),
          if (isChecked) ...[
            const SizedBox(height: 4),
            TextFormField(
              controller: controller,
              style: TextStyle(fontSize: Adaptive.sp(13)),
              decoration: InputDecoration(
                hintText: "Enter $title details (road, open land, shed, etc.)",
                hintStyle:
                    TextStyle(color: Colors.grey.shade400, fontSize: Adaptive.sp(12)),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPhotoUploadCard({
    required String label,
    required String direction,
    required File? file,
    required Function(File) onSelect,
    required VoidCallback onRemove,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xfffcfcfc),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: file != null ? primaryColor : Colors.grey.shade300,
          width: file != null ? 1.5 : 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: Adaptive.sp(12.5),
              fontWeight: FontWeight.bold,
              color: primaryColorDark,
            ),
          ),
          const SizedBox(height: 8),
          if (file != null) ...[
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    file,
                    width: double.infinity,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                InkWell(
                  onTap: onRemove,
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, size: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.green.shade300),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle, size: 13, color: Colors.green.shade700),
                  const SizedBox(width: 4),
                  Text(
                    "Attached",
                    style: TextStyle(
                      fontSize: Adaptive.sp(11),
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            InkWell(
              onTap: () => _showImageSourceDialog(onSelected: onSelect),
              child: Container(
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: primaryColor.withOpacity(0.1),
                      child: const Icon(Icons.add_a_photo_outlined,
                          color: primaryColor, size: 20),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Tap to Attach",
                      style: TextStyle(
                        fontSize: Adaptive.sp(11.5),
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ----------------------------------------------------
  // BOTTOM NAVIGATION ACTION BAR
  // ----------------------------------------------------
  Widget _buildBottomBar() {
    return Container(

      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration:BoxDecoration( color: Colors.white,
          boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 6,
          offset: const Offset(0, -3),
        ),
      ]),
      child: SafeArea(
        child: Row(
          children: [
            if (_currentStep > 0) ...[
              Expanded(
                flex: 1,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: primaryColor),
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: _previousStep,
                  child: Text(
                    "Previous",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: Adaptive.sp(14),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              flex: 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: _isSubmitting
                    ? null
                    : (_currentStep == 3 ? _submitForm : _nextStep),
                child: _isSubmitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _currentStep == 3
                                ? "Submit Onboarding"
                                : "Next Step",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Adaptive.sp(14.5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Icon(
                            _currentStep == 3
                                ? Icons.done_all_rounded
                                : Icons.arrow_forward_rounded,
                            size: 18,
                            color: Colors.white,
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
