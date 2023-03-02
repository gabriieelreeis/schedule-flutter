import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scheduleflutter/app/shared/theme/app_colors.dart';

class DefaultInput extends StatelessWidget {
  const DefaultInput({
    Key? key,
    this.width,
    this.decoration,
    this.labelText,
    this.obscureText = false,
    this.hintText,
    this.onChange,
    this.initialValue,
    this.keyboardType,
    this.validator,
    this.controller,
    this.labelColor,
    this.onTap,
    this.inputFormatters,
    this.fontSize,
    this.removeBorder = false,
  }) : super(key: key);

  final double? width;
  final InputDecoration? decoration;
  final String? labelText;
  final Color? labelColor;
  final bool obscureText;
  final String? hintText;
  final void Function(String)? onChange;
  final String? initialValue;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final double? fontSize;
  final bool? removeBorder;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width ?? (ScreenUtil().screenWidth - 65).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (labelText != null)
              Text(
                labelText ?? '',
                style: TextStyle(
                  color: labelColor ?? Colors.white,
                  fontSize: fontSize ?? 14.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            if (labelText != null)
              SizedBox(
                height: 10.h,
              ),
            TextFormField(
              onChanged: onChange,
              initialValue: initialValue,
              keyboardType: keyboardType,
              validator: validator,
              controller: controller,
              inputFormatters: inputFormatters ?? [],
              onTap: onTap,
              maxLines: obscureText ? 1 : 10,
              minLines: 1,
              decoration: decoration ??
                  InputDecoration(
                    filled: true,
                    hintText: hintText,
                    hintStyle: TextStyle(
                        color: labelColor?.withOpacity(.4) ??
                            Colors.black.withOpacity(.4)),
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(12),
                    focusColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
              obscureText: obscureText,
            ),
            if (!removeBorder!)
              SizedBox(
                height: 20.h,
              ),
          ],
        ),
      ),
    );
  }
}
