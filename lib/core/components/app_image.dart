import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class AppImage extends StatelessWidget {
  final String image;
  final double? width, height;
  final Color? color;
  final double? bottomSpace;
  final BoxFit fit;

  const AppImage({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.scaleDown,
    this.bottomSpace,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: bottomSpace != null
          ? EdgeInsets.only(bottom: bottomSpace!)
          : EdgeInsets.zero,
      child: Builder(
        builder: (context) {
          if (image.toLowerCase().endsWith('.svg')) {
            return SvgPicture.asset(
              'assets/icons/$image',
              color: color,
              width: width,
              height: height,
              fit: fit,
            );
          } else if (image.startsWith('http')) {
            return Image.network(
              image,
              width: width,
              height: height,
              color: color,
              fit: fit,
            );
          } else if (image.endsWith('json')) {
            return Lottie.asset(
              "assets/lotties/$image",

              width: width,
              height: height,
              fit: fit,
            );
          }
          return Image.asset(
            'assets/images/$image',
            color: color,
            width: width,
            height: height,
            fit: fit,
          );
        },
      ),
    );
  }
}
