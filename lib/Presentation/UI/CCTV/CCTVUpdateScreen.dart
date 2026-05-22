import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

class Cctvupdatescreen extends ConsumerStatefulWidget {
  const Cctvupdatescreen(
      {super.key,
      required this.caseId,
      required this.customerName,
      required this.inOut,
      required this.warehouseId});

  final String? caseId;
  final String? customerName;
  final String? inOut;
  final String? warehouseId;
  @override
  ConsumerState<Cctvupdatescreen> createState() => _CctvupdatescreenState();
}

var firstCCTVImageProvider = StateProvider<Uint8List?>((ref) => null);
var secondCCTVImageProvider = StateProvider<Uint8List?>((ref) => null);

class _CctvupdatescreenState extends ConsumerState<Cctvupdatescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update CCTV Report'),
      ),
      body: ListView(
        padding: Pad(all: 10),
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${widget.caseId}",
                maxLines: 2,
                style: TextStyle(
                    fontSize: Adaptive.sp(16), fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: Adaptive.sh(15),
                      child: InkWell(
                        child: DottedBorder(
                          color: primaryColorDark,
                          borderType: BorderType.RRect,
                          padding: const Pad(all: 10),
                          radius: const Radius.circular(5),
                          child: Center(
                            child: ref.watch(firstCCTVImageProvider) == null
                                ? ColumnSuper(
                                    children: const [
                                      Icon(
                                        Icons.file_upload_rounded,
                                        color: primaryColorDark,
                                      ),
                                      Text(
                                        'CCTV 1',
                                        style: TextStyle(
                                            color: primaryColorDark,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                : InkWell(
                                    onTap: () async {
                                      showLoaderDialog(context);
                                      try {
                                        pickImage().then((value) async {
                                          if (mounted) {
                                            hideLoaderDialog(context);
                                          }
                                          if (value != null) {
                                            var u8int =
                                                await value.readAsBytes();
                                            createStampedImage(u8int, ref)
                                                .then((value) {
                                              ref
                                                  .watch(firstCCTVImageProvider
                                                      .notifier)
                                                  .state = value;
                                            });
                                          }
                                        });
                                      } catch (e, s) {
                                        hideLoaderDialog(context);

                                        debugPrintStack(
                                          stackTrace: s,
                                        );
                                      }
                                      // checkLocationPermission(ref);
                                    },
                                    child: ZoomOverlay(
                                      modalBarrierColor: Colors.black12,
                                      // Optional
                                      minScale: 0.5,
                                      // Optional
                                      maxScale: 3.0,
                                      // Optional
                                      animationCurve: Curves.fastOutSlowIn,
                                      // Defaults to fastOutSlowIn which mimics IOS instagram behavior
                                      animationDuration:
                                          const Duration(milliseconds: 300),
                                      // Defaults to 100 Milliseconds. Recommended duration is 300 milliseconds for Curves.fastOutSlowIn
                                      twoTouchOnly: true,
                                      // Defaults to false
                                      onScaleStart: () {},
                                      // optional VoidCallback
                                      onScaleStop: () {},
                                      // optional VoidCallback
                                      child: Image.memory(
                                        ref.watch(firstCCTVImageProvider) ??
                                            Uint8List(0),
                                        fit: BoxFit.contain,
                                        height: 250,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        onTap: () async {
                          showLoaderDialog(context);
                          try {
                            pickImage().then((value) async {
                              if (mounted) {
                                hideLoaderDialog(context);
                              }
                              if (value != null) {
                                var u8int = await value.readAsBytes();
                                createStampedImage(u8int, ref).then((value) {
                                  ref
                                      .watch(firstCCTVImageProvider.notifier)
                                      .state = value;
                                });
                              }
                            });
                          } catch (e, s) {
                            hideLoaderDialog(context);
                            debugPrintStack(
                              stackTrace: s,
                            );
                          }
                          // hideLoaderDialog(context);
                          // checkLocationPermission(ref);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: Adaptive.sh(15),
                      child: InkWell(
                        child: DottedBorder(
                          color: primaryColorDark,
                          borderType: BorderType.RRect,
                          padding: const Pad(all: 10),
                          radius: const Radius.circular(5),
                          child: Center(
                            child: ref.watch(secondCCTVImageProvider) == null
                                ? ColumnSuper(
                                    children: const [
                                      Icon(
                                        Icons.file_upload_rounded,
                                        color: primaryColorDark,
                                      ),
                                      Text(
                                        'CCTV 2',
                                        style: TextStyle(
                                            color: primaryColorDark,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                : InkWell(
                                    onTap: () async {
                                      try {
                                        pickImage().then((value) async {
                                          if (value != null) {
                                            var u8int =
                                                await value.readAsBytes();
                                            createStampedImage(u8int, ref)
                                                .then((value) {
                                              ref
                                                  .watch(secondCCTVImageProvider
                                                      .notifier)
                                                  .state = value;
                                            });
                                          }
                                        });
                                      } catch (e, s) {
                                        debugPrintStack(
                                          stackTrace: s,
                                        );
                                      }
                                      // checkLocationPermission(ref);
                                    },
                                    child: ZoomOverlay(
                                      modalBarrierColor: Colors.black12,
                                      // Optional
                                      minScale: 0.5,
                                      // Optional
                                      maxScale: 3.0,
                                      // Optional
                                      animationCurve: Curves.fastOutSlowIn,
                                      // Defaults to fastOutSlowIn which mimics IOS instagram behavior
                                      animationDuration:
                                          const Duration(milliseconds: 300),
                                      // Defaults to 100 Milliseconds. Recommended duration is 300 milliseconds for Curves.fastOutSlowIn
                                      twoTouchOnly: true,
                                      // Defaults to false
                                      onScaleStart: () {},
                                      // optional VoidCallback
                                      onScaleStop: () {},
                                      // optional VoidCallback
                                      child: Image.memory(
                                        ref.watch(secondCCTVImageProvider) ??
                                            Uint8List(0),
                                        fit: BoxFit.contain,
                                        height: 250,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        onTap: () async {
                          showLoaderDialog(context);
                          try {
                            pickImage().then((value) async {
                              if (mounted) {
                                hideLoaderDialog(context);
                              }
                              if (value != null) {
                                var u8int = await value.readAsBytes();
                                createStampedImage(u8int, ref).then((value) {
                                  ref
                                      .watch(secondCCTVImageProvider.notifier)
                                      .state = value;
                                });
                              }
                            });
                          } catch (e, s) {
                            debugPrintStack(
                              stackTrace: s,
                            );
                          }
                          // hideLoaderDialog(context);
                          // checkLocationPermission(ref);
                        },
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
