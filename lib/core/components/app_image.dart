import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class AppImage extends StatelessWidget {
  final String image;
  final double? width, height;
  final Color? color;
  final bool isCircle;
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
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    final myFit = isCircle ? BoxFit.cover : fit;
    return Padding(
      padding: bottomSpace != null
          ? EdgeInsets.only(bottom: bottomSpace!)
          : EdgeInsets.zero,
      child: Builder(
        builder: (context) {
          Widget child;
          if (image.toLowerCase().endsWith('.svg')) {
            child = SvgPicture.asset(
              'assets/icons/$image',
              color: color,
              width: width,
              height: height,
              fit: myFit,
            );
          } else if (image.startsWith('http')) {
            child = Image.network(
              image,
              width: width,
              height: height,
              color: color,
              fit: myFit,
            );
          } else if (image.endsWith('json')) {
            child = Lottie.asset(
              "assets/lotties/$image",

              width: width,
              height: height,
              fit: myFit,
            );
          } else {
            child = Image.asset(
              'assets/images/$image',
              color: color,
              width: width,
              height: height,
              fit: myFit,
            );
          }

          if (isCircle) return ClipOval(child: child);
          return child;
        },
      ),
    );
  }
}
