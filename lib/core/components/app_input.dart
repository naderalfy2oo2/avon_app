import 'package:avon_app/core/components/app_image.dart';
import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  final void Function(int value)? onCountryCodeChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? suffixIcon, hint, label;
  final bool withCountryCode, isPassword;
  final double? bottomSpace;
  const AppInput({
    super.key,
    this.suffixIcon,
    this.hint,
    this.label,
    this.withCountryCode = false,
    this.isPassword = false,
    this.bottomSpace,
    this.controller,
    this.onCountryCodeChanged,
    this.validator,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  late int SelectedcountryCode;
  final list = [10, 20, 30];
  bool isHidden = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SelectedcountryCode = list.first;

    widget.onCountryCodeChanged?.call(SelectedcountryCode);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomSpace ?? 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.withCountryCode)
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 6),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).inputDecorationTheme.enabledBorder!.borderSide.color,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<int>(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                  value: SelectedcountryCode,
                  icon: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8),
                    child: AppImage(
                      image: 'down.svg',
                      height: 6,
                      width: 8,
                      fit: BoxFit.fill,
                    ),
                  ),

                  items: list
                      .map((e) => DropdownMenuItem(value: e, child: Text('$e')))
                      .toList(),

                  onChanged: (value) {
                    if (value == null) return;

                    SelectedcountryCode = value;

                    widget.onCountryCodeChanged?.call(value);

                    setState(() {});
                  },
                ),
              ),
            ),
          Expanded(
            child: TextFormField(
              validator: widget.validator,
              controller: widget.controller,
              obscureText: widget.isPassword && isHidden,
              decoration: InputDecoration(
                hintText: widget.hint,
                labelText: widget.label,

                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: () {
                          isHidden = !isHidden;
                          setState(() {});
                        },
                        icon: AppImage(
                          image: isHidden
                              ? 'visibility_off.svg'
                              : 'visibility.svg',
                        ),
                      )
                    : widget.suffixIcon != null
                    ? AppImage(image: widget.suffixIcon!, height: 18, width: 18)
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
