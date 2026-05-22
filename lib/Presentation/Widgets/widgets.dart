// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:async';
import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Data/SharedPrefs/SharedUtility.dart';
import 'package:emp_apnagodam/Presentation/UI/TruckBook/CreateTruckBook.dart';
import 'package:emp_apnagodam/Presentation/utils/DynamicShimmerList.dart';
import 'package:emp_apnagodam/Presentation/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:image/image.dart' as ui;
import 'package:image_picker/image_picker.dart';
import 'package:image_watermark/image_watermark.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:watermark_unique/image_format.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';
import 'package:watermark_unique/watermark_unique.dart';
import 'package:file_picker/file_picker.dart';

import '../Constants/ColorConstant.dart';

part 'widgets.g.dart';

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset("assets/loader.json", height: 100, width: 100),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Loading...",
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
        )
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showErrorDialog(BuildContext context, String error,
    {VoidCallbackAction? action}) {
  AlertDialog alert = AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.error,
          color: Colors.red,
          size: 80,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "$error",
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
        ),
        SizedBox(
          height: 10,
        ),
        AnimatedButton(
          color: primaryColorDark,
          height: 50,
          isOutline: true,
          isMultiColor: true,
          colors: const [primaryColorDark, primaryColorDark],
          borderWidth: 1,
          onTap: () {
            hideLoaderDialog(context);
          },
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

errorWidget(String error) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.error,
          color: Colors.red,
          size: 80,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "$error",
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
        ),
        SizedBox(
          height: 10,
        ),
        AnimatedButton(
          color: primaryColorDark,
          height: 50,
          isOutline: true,
          isMultiColor: true,
          colors: const [primaryColorDark, primaryColorDark],
          borderWidth: 1,
          onTap: () {},
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );

logoutWidget(String error, BuildContext context) => Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: Colors.red,
            size: 80,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Session Expired Please Login Again!",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
          ),
          SizedBox(
            height: 10,
          ),
          AnimatedButton(
            color: primaryColorDark,
            height: 50,
            isOutline: true,
            isMultiColor: true,
            colors: const [primaryColorDark, primaryColorDark],
            borderWidth: 1,
            onTap: () {
              context.go('/login');
            },
            child: const Text(
              "Login",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );

checkLocationPermission() async {
  await Geolocator.requestPermission().then((value) {
    if (value == LocationPermission.deniedForever) {
      Geolocator.openLocationSettings();
    }
  });
}

zoomWidget(Uint8List? image) => ZoomOverlay(
      modalBarrierColor: Colors.black12,
      minScale: 0.5,
      maxScale: 3.0,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 300),
      twoTouchOnly: true,
      onScaleStart: () {},
      onScaleStop: () {},
      child: Image.memory(
        image ?? Uint8List(0),
        fit: BoxFit.fill,
        height: 250,
      ),
    );

Future<bool> requestLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    Fluttertoast.showToast(msg: "Location Services are disabled.");
    Geolocator.openLocationSettings();
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      Fluttertoast.showToast(msg: "Location permission denied.");
    }
  }

  if (permission == LocationPermission.deniedForever) {
    Geolocator.openLocationSettings();
    return false;
  }

  return true;
}

Future<bool> isLocationPermissionGranted() async {
  LocationPermission permission = await Geolocator.checkPermission();
  return permission == LocationPermission.whileInUse ||
      permission == LocationPermission.always;
}

showLocationError(BuildContext context, String error) {
  AlertDialog alert = AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.location_disabled,
          color: Colors.red,
          size: 80,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "$error",
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
        ),
        SizedBox(
          height: 10,
        ),
        AnimatedButton(
          color: primaryColorDark,
          height: 50,
          isOutline: true,
          isMultiColor: true,
          colors: const [primaryColorDark, primaryColorDark],
          borderWidth: 1,
          onTap: () async {
            if (!await isLocationPermissionGranted()) {
              await requestLocationPermission();
            }
          },
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

locationDisabledLayout(String error) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.location_disabled,
          color: Colors.red,
          size: 80,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "$error",
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
        ),
        SizedBox(
          height: 10,
        ),
        AnimatedButton(
          color: primaryColorDark,
          height: 50,
          isOutline: true,
          isMultiColor: true,
          colors: const [primaryColorDark, primaryColorDark],
          borderWidth: 1,
          onTap: () async {
            if (!await isLocationPermissionGranted()) {
              await requestLocationPermission();
            }
          },
          child: const Text(
            "Fix",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );

hideLoaderDialog(BuildContext context) =>
    Navigator.of(context, rootNavigator: true).pop();

loader(BuildContext context) => DynamicShimmerList();

Future<XFile?> pickImage({ImageSource source = ImageSource.camera}) async {
  var result = await ImagePicker().pickImage(
      source: source, maxWidth: 1600, maxHeight: 1800, imageQuality: 50);

  return result;
}

noItems(String items, BuildContext context) => Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: ColumnSuper(
        children: [
          Lottie.asset("assets/no_items.json",
              height: 150, width: 150, animate: true),
          SizedBox(
            height: 10,
          ),
          Text(
            "No $items...",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: Adaptive.sp(18)),
          )
        ],
      ),
    );

cupertinoAppBar(String title, BuildContext context) => CupertinoNavigationBar(
      backgroundColor: primaryColor,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          )),
      middle: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );

Future<Uint8List?> createStampedImage(Uint8List u8int, WidgetRef ref) async {
  final tempDir = await getTemporaryDirectory();
  File file = await File('${tempDir.path}/image.png').create();
  file.writeAsBytesSync(u8int);

  // final image = await ;

  // watermarkedImgBytes = await ImageWatermark.addTextWatermark(
  //   watermarkText:
  //       '\n${ref.watch(sharedUtilityProvider).getUser()?.firstName} ${ref.watch(sharedUtilityProvider).getUser()?.lastName} (${ref.watch(sharedUtilityProvider).getUser()?.empId})\n${ref.watch(addressProvider)} \n${ref.watch(locationProvider)?.latitude ?? 0.0}, ${ref.watch(locationProvider)?.longitude ?? 0.0}  \n${DateTime.now()}',
  //   dstX: 20,
  //   dstY: 20,
  //   font: ui.arial24,
  //   imgBytes: u8int,
  //   color: Colors.white,
  // );

  return WatermarkUnique().addTextWatermarkUint8List(
    filePath: file.path, // image file path
    text:
        '\n${ref.watch(sharedUtilityProvider).getUser()?.firstName} ${ref.watch(sharedUtilityProvider).getUser()?.lastName} (${ref.watch(sharedUtilityProvider).getUser()?.empId})\n${ref.watch(addressProvider)} \n${ref.watch(locationProvider)?.latitude ?? 0.0}, ${ref.watch(locationProvider)?.longitude ?? 0.0}  \n${DateTime.now()}', // watermark text
    x: 10, // position by x
    y: 20, // position by y
    textSize: 18, // text size
    color: Colors.white, // color of text
    isNeedRotateToPortrait:
        true, // rotation image to portrait (Default: false) ONLY ANDROID
    backgroundTextColor:
        Colors.black.withOpacity(0.6), // color of background text (optional)
    backgroundTextPaddingLeft: 12, // padding of background text (optional)
    backgroundTextPaddingTop: 12, // padding of background text (optional)
    backgroundTextPaddingRight: 12, // padding of background text (optional)
    backgroundTextPaddingBottom: 12, // padding of background text (optional)
  );
}

titleWidget(
        {required String text,
        MainAxisAlignment alignment = MainAxisAlignment.start}) =>
    Row(
      mainAxisAlignment: alignment,
      children: [
        Text(
          "$text",
          textAlign: TextAlign.left,
          style: ElevarmFontFamilies.inter(
            color: primaryColor,
            fontSize: ElevarmFontSizes.sm,
            fontWeight: ElevarmFontWeights.bold,
          ),
        )
      ],
    );
ElevarmPrimaryButton simpleButton(
        {required String text, required VoidCallback callback}) =>
    ElevarmPrimaryButton.text(
      text: text,
      onPressed: callback,
      buttonThemeData:
          ElevarmPrimaryButtonThemeData(primaryColor: primaryColor),
    );
Future<String?> createStampedImageFile(XFile imageFile, WidgetRef ref) async {
  await requestLocationPermission();
  return WatermarkUnique().addTextWatermark(
    filePath: imageFile.path, // image file path
    text:
        '\n${ref.watch(sharedUtilityProvider).getUser()?.firstName} ${ref.watch(sharedUtilityProvider).getUser()?.lastName} (${ref.watch(sharedUtilityProvider).getUser()?.empId})\n${ref.watch(addressProvider)} \n${ref.watch(locationProvider)?.latitude ?? 0.0}, ${ref.watch(locationProvider)?.longitude ?? 0.0}  \n${DateTime.now()}', // watermark text
    x: 10, // position by x
    y: 20, // position by y
    quality: 35, //
    textSize: 18, // text size
    color: Colors.white, // color of text
    imageFormat: ImageFormat.jpeg,
    isNeedRotateToPortrait:
        true, // rotation image to portrait (Default: false) ONLY ANDROID
    backgroundTextColor:
        Colors.black.withOpacity(0.6), // color of background text (optional)
    backgroundTextPaddingLeft: 12, // padding of background text (optional)
    backgroundTextPaddingTop: 12, // padding of background text (optional)
    backgroundTextPaddingRight: 12, // padding of background text (optional)
    backgroundTextPaddingBottom: 12, // padding of background text (optional)
  );
}

@riverpod
Future<Uint8List?> createStampedImage2(CreateStampedImage2Ref ref,
    {required Uint8List u8int}) async {
  Uint8List watermarkedImgBytes = Uint8List(0);

  watermarkedImgBytes = await ImageWatermark.addTextWatermark(
    watermarkText:
        '\n${ref.watch(sharedUtilityProvider).getUser()?.firstName} ${ref.watch(sharedUtilityProvider).getUser()?.lastName} (${ref.watch(sharedUtilityProvider).getUser()?.empId})\n${ref.watch(addressProvider)} \n${ref.watch(locationProvider)?.latitude ?? 0.0}, ${ref.watch(locationProvider)?.longitude ?? 0.0}  \n${DateTime.now()}',
    dstX: 20,
    dstY: 20,
    font: ui.arial24,
    imgBytes: u8int,
    color: Colors.white,
  );

  return watermarkedImgBytes;
}

@riverpod
Stream<Uint8List> stampedImage(StampedImageRef ref, Uint8List u8int) async* {
  Uint8List watermarkedImgBytes = Uint8List(0);

  // await requestLocationPermission();
  // ref.watch(locationProvider.notifier).state =
  //     await Geolocator.getCurrentPosition();

  // ref
  //     .watch(getAddressProvider(
  //             latLng:
  //                 '${ref.watch(locationProvider)?.latitude},${ref.watch(locationProvider)?.longitude}')
  //         .future)
  //     .then((address) {
  //       if(address.results!=null){
  //         if(address.results!.isNotEmpty){
  //           ref.watch(addressProvider.notifier).state =
  //           "${address.results?[0].formattedAddress}";
  //         }
  //
  //       }
  //
  // });

  watermarkedImgBytes = await ImageWatermark.addTextWatermark(
    watermarkText:
        '\n${ref.watch(sharedUtilityProvider).getUser()?.firstName} ${ref.watch(sharedUtilityProvider).getUser()?.lastName} (${ref.watch(sharedUtilityProvider).getUser()?.empId})\n${ref.watch(addressProvider)} \n${ref.watch(locationProvider)?.latitude ?? 0.0}, ${ref.watch(locationProvider)?.longitude ?? 0.0}  \n${DateTime.now()}',
    dstX: 20,
    dstY: 20,
    font: ui.arial24,
    imgBytes: u8int,
    color: Colors.white,
  );

  yield watermarkedImgBytes;
}

class FilePickerWidget extends ConsumerWidget {
  FilePickerWidget(
      {super.key, required this.onImageSelection, required this.title});
  Function(File) onImageSelection;
  String title = '';
  final refImage = StateProvider<File?>((ref) => null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(refImage) == null
        ? ElevarmInputFileCard(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );
              if (result != null) {
                ref.watch(refImage.notifier).state =
                    File(result.files.single.path!);
                onImageSelection(File(result.files.single.path!));
              }
            },
            clickToUploadLabel: '$title',
            orDragAndDropLabel: ', Tap to Upload $title Image',
            subtitle: 'PNG, JPG, JPEG,PDF ',
            textColor: primaryColor,
          )
        : ElevarmFileUploadCard(
            title: '${ref.watch(refImage)?.name}',
            subtitle: '${ref.watch(refImage)?.name}',
            actionIconAssetName: ElevarmIconsOutline.eye,
            iconColor: primaryColor,
            iconBackgroundColor: primaryColor.withOpacity(0.1),
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );
              if (result != null) {
                ref.watch(refImage.notifier).state =
                    File(result.files.single.path!);
                onImageSelection(File(result.files.single.path!));
              }
            },
            onTapAction: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );
              if (result != null) {
                ref.watch(refImage.notifier).state =
                    File(result.files.single.path!);
                onImageSelection(File(result.files.single.path!));
              }
            },
          );
  }
}

Future<void> showImageSourceFilePickerDialog(
    BuildContext context, Function(XFile) onImagePicked) async {
  final ImagePicker picker = ImagePicker();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: const Text('Select Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () async {
                Navigator.of(context, rootNavigator: false)
                    .pop(); // Close the dialog
                final XFile? image =
                    await picker.pickImage(source: ImageSource.camera);
                if (image != null) {
                  onImagePicked(image);
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Storage'),
              onTap: () async {
                Navigator.of(context, rootNavigator: false)
                    .pop(); // Close the dialog

                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );
                if (result != null) {
                  onImagePicked(XFile(result.files.single.path!));
                }
              },
            ),
          ],
        ),
      );
    },
  );
}

shimmerCaseId() => DynamicShimmerList();

runninggCaseIdShimmer() => DynamicShimmerList();
attendanceShimmer() => DynamicShimmerList();

secondKantaShimmer() => DynamicShimmerList();
generateLeadsShimmer() => DynamicShimmerList();
generateLeadsListShimmer() => DynamicShimmerList();
createVoucherShimmer() => DynamicShimmerList();
voucherListShimmer() => DynamicShimmerList();
cancelCaseIdShimmer() => DynamicShimmerList();
displeasedBagsShimmer() => DynamicShimmerList();
