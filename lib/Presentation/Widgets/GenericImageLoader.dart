import 'dart:io';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class GenericImageLoader extends StatelessWidget {
  final String? imageUrl;
  final String? assetPath;
  final File? fileImage;
  final double width;
  final double height;
  final BoxFit fit;

  const GenericImageLoader({
    Key? key,
    this.imageUrl,
    this.assetPath,
    this.fileImage,
    this.width = double.infinity,
    this.height = 200.0,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null) {
      return _buildNetworkImage();
    } else if (assetPath != null) {
      return _buildAssetImage();
    } else if (fileImage != null) {
      return _buildFileImage();
    } else {
      return _buildPlaceholder();
    }
  }

  Widget _buildNetworkImage() {
    return InstaImageViewer(
        child: Image.network(
      imageUrl!,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(child: CircularProgressIndicator());
      },
      errorBuilder: (context, error, stackTrace) {
        return _buildErrorWidget();
      },
    ));
  }

  Widget _buildAssetImage() {
    return InstaImageViewer(
        child: Image.asset(
      assetPath!,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return _buildErrorWidget();
      },
    ));
  }

  Widget _buildFileImage() {
    return InstaImageViewer(
        child: Image.file(
      fileImage!,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return _buildErrorWidget();
      },
    ));
  }

  Widget _buildPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[300],
      child: Center(
        child: Text(
          'No Image Available',
          style: TextStyle(color: Colors.black54),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[300],
      child: Center(
        child: Text(
          'Failed to load image',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
