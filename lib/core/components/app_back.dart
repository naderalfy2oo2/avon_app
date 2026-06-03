import 'dart:math';

import 'package:avon_app/core/components/app_image.dart';
import 'package:flutter/material.dart';

class AppBack extends StatelessWidget {
  const AppBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xff1010100D).withValues(alpha: .05),
            child: Transform.rotate(
              angle: pi,
              child: AppImage(
                image: 'arrow1.svg',
                height: 24,
                width: 24,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
