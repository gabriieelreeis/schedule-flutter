import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scheduleflutter/app/shared/theme/app_colors.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.width,
    this.fluid = false,
    this.maxWidth = 400,
    this.title,
    this.bgColor,
    this.textColor,
    this.onTap,
    this.fontSize = 18,
    this.fontWeight,
    this.icon,
    this.iconPosition = 'left',
  }) : super(key: key);

  final double? width;
  final double maxWidth;
  final bool fluid;
  final String? title;
  final Color? bgColor;
  final Color? textColor;
  final void Function()? onTap;
  final double fontSize;
  final dynamic icon;
  final String? iconPosition;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsetsDirectional.all(10.w),
          decoration: BoxDecoration(
            color: bgColor ?? accentColor,
            borderRadius: BorderRadiusDirectional.all(
              Radius.circular(50.r),
            ),
          ),
          constraints: BoxConstraints(
              maxWidth:
                  !fluid ? maxWidth.w : width ?? ScreenUtil().screenWidth.w),
          width: !fluid
              ? width ?? (ScreenUtil().screenWidth - 65).w
              : ScreenUtil().screenWidth,
          child: _withoutIcon(),
        ),
      ),
    );
  }

  Widget _withoutIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title ?? 'Informe um title',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize.sp,
            color: textColor ?? buttonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
