import 'package:flutter/material.dart';

class TRoundedImage extends StatelessWidget {
  final String imagePath; // Can be a network URL or asset path
  final double borderRadius;
  final double width;
  final double height;
  final BoxFit fit;

  const TRoundedImage({
    Key? key,
    required this.imagePath,
    this.borderRadius = 8.0,
    this.width = 100.0,
    this.height = 100.0,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => Container(
          width: width,
          height: height,
          color: Colors.grey[300],
          child: Icon(Icons.broken_image, color: Colors.grey[700]),
        ),
      ),
    );
  }
}
