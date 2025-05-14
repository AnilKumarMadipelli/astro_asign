import 'dart:io';

import 'package:assignment/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImage extends StatefulWidget {
  final String? imageUrl; // URL for network image
  final String? assetPath; // Asset path for local image
  final String? filePath; // File path for local file image
  final double? width; // Optional width
  final double? height; // Optional height
  final BoxFit fit;

  const CustomImage({
    super.key,
    this.imageUrl,
    this.assetPath,
    this.filePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  _CustomImageState createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkImageSource();
  }

  void _checkImageSource() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (widget.imageUrl != null && !_isSvg(widget.imageUrl!)) {
        _preloadNetworkImage();
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  void _preloadNetworkImage() {
    final image = NetworkImage(widget.imageUrl!);
    final imageConfiguration = const ImageConfiguration();
    final ImageStream stream = image.resolve(imageConfiguration);
    stream.addListener(
      ImageStreamListener(
        (imageInfo, synchronousCall) {
          setState(() {
            _isLoading = false;
          });
        },
        onError: (error, stackTrace) {
          setState(() {
            _isLoading = false;
          });
        },
      ),
    );
  }

  bool _isSvg(String path) => path.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    final double height =
        widget.height ?? ResponsiveUtil.getHeight(context) * 0.3;
    final double width = widget.width ?? ResponsiveUtil.getWidth(context) * 0.5;

    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (widget.imageUrl != null) {
      if (_isSvg(widget.imageUrl!)) {
        return SvgPicture.network(
          widget.imageUrl!,
          width: width,
          height: height,
          fit: widget.fit,
          placeholderBuilder: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      } else {
        return Image.network(
          widget.imageUrl!,
          width: width,
          height: height,
          fit: widget.fit,
        );
      }
    } else if (widget.assetPath != null) {
      if (_isSvg(widget.assetPath!)) {
        return SvgPicture.asset(
          widget.assetPath!,
          width: width,
          height: height,
          fit: widget.fit,
        );
      } else {
        return Image.asset(
          widget.assetPath!,
          width: width,
          height: height,
          fit: widget.fit,
        );
      }
    } else if (widget.filePath != null) {
      if (_isSvg(widget.filePath!)) {
        return SvgPicture.file(
          File(widget.filePath!),
          width: width,
          height: height,
          fit: widget.fit,
        );
      } else {
        return Image.file(
          File(widget.filePath!),
          width: width,
          height: height,
          fit: widget.fit,
        );
      }
    }

    return const SizedBox.shrink();
  }
}
