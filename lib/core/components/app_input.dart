import 'dart:async';

import 'package:avon_app/core/components/app_image.dart';
import 'package:avon_app/core/components/logic/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  final void Function(String value)? onCountryCodeChanged;
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
  List<CountryModel>? list;
  Future<void> getData() async {
    final resp = await Dio().get('https://cosmatics.growfet.com/api/Countries');

    list = CountriesData.fromJson({"list": resp.data}).list;
    print(resp.data);

    SelectedcountryCode = list!.first.code;

    widget.onCountryCodeChanged?.call(SelectedcountryCode);
    setState(() {});
  }

  late String SelectedcountryCode;

  bool isHidden = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
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
                child: list == null
                    ? CircularProgressIndicator()
                    : DropdownButton<String>(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 3,
                        ),
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

                        items: list!
                            .map(
                              (e) => DropdownMenuItem(
                                value: e.code,
                                child: Text('${e.code}'),
                              ),
                            )
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

class CountriesData {
  late final List<CountryModel> list;

  CountriesData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['list'] ?? [],
    ).map((e) => CountryModel.fromJson(e)).toList();
  }
}

class CountryModel {
  late final num id;
  late final String code;
  late final String name;

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    code = json['code'] ?? "";
    name = json['name_en'] ?? "";
  }
}
