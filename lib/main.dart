import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/global/common/colors/app_colors.dart';
import 'package:p_route/old/screens/login/user_login_page.dart';
import 'package:p_route/global/themes/themes.dart';
import 'package:p_route/Screens/searched_address_screen.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: Size(width, height),
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            hideKeyboard(context);
          },
          child: MaterialApp(
            theme: ThemeData(
              primarySwatch: MaterialColor(
                AppColors.primary.value,
                const <int, Color>{
                  50: AppColors.primary,
                  100: AppColors.primary,
                  200: AppColors.primary,
                  300: AppColors.primary,
                  400: AppColors.primary,
                  500: AppColors.primary,
                  600: AppColors.primary,
                  700: AppColors.primary,
                  800: AppColors.primary,
                  900: AppColors.primary,
                },
              ),
            ),
            debugShowCheckedModeBanner: false,
            title: 'PRoute',
            navigatorKey: navigatorKey,
            home: const UserLoginPage(),
          ),
        );
      },
    );
  }
}
