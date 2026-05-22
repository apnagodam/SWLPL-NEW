
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InAppCameraModule extends ConsumerWidget {
  const InAppCameraModule({super.key, required this.captureImage});
  final dynamic Function(MediaCapture?) captureImage;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IntrinsicHeight(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.2,
            child: CameraAwesomeBuilder.awesome(
              topActionsBuilder: (_) => Container(),
              saveConfig: SaveConfig.photo(),
              sensorConfig: SensorConfig.single(
                  aspectRatio: CameraAspectRatios.ratio_4_3),
              availableFilters: [],
              imageAnalysisConfig: AnalysisConfig(
                  androidOptions: AndroidAnalysisOptions.jpeg(width: 1200),
                  cupertinoOptions: CupertinoAnalysisOptions.bgra8888()),
              onMediaCaptureEvent: captureImage,
              onMediaTap: captureImage,
            ),
          ),
        ],
      ),
    );
  }
}
