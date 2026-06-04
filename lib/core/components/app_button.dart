import 'package:avon_app/core/components/app_image.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final bool isLoading;
  final void Function()? onPressed;
  final String text;
  final String? Icon;
  const AppButton({
    super.key,
    this.text = "",
    this.onPressed,
    this.Icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return FilledButton.icon(
      icon: Icon != null ? AppImage(image: Icon!) : null,
      onPressed: onPressed ?? () {},
      label: Text(text),
    );
  }
}
