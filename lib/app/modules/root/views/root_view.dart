import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scheduleflutter/app/routes/app_pages.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return RouterOutlet.builder(
      delegate: Get.nestedKey(null),
      builder: (context) {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.only(
            top: (ScreenUtil().statusBarHeight + 35.h).h,
            bottom: (ScreenUtil().bottomBarHeight + 35.h).h,
            left: 35.w,
            right: 35.w,
          ),
          child: GetRouterOutlet(
            initialRoute: Routes.login,
            delegate: Get.nestedKey(null),
            anchorRoute: '/',
            filterPages: (afterAnchor) {
              return afterAnchor.take(1);
            },
          ),
        );
      },
    );
  }
}
