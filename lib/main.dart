import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:p_route/Screens/view_orders_screen.dart';
import 'package:p_route/global/themes/themes.dart';

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
            theme: Themes.lightTheme(),
            debugShowCheckedModeBanner: false,
            title: 'PRoute',
            navigatorKey: navigatorKey,
            home: const ViewOrdersScreen(),
          ),
        );
      },
    );
  }
}
