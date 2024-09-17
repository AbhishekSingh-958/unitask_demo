import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:unitask_demo/constants/app_global_constant.dart';
import 'package:unitask_demo/src/features/home/provider/product_provider.dart';
import 'package:unitask_demo/src/features/home/repository/home_product_repo.dart';

import 'core/api_client/dio_utils_service.dart';
import 'core/config/size_config.dart';
import 'core/route/app_route.dart';
import 'core/localDb/sharedPrefs/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PreferencesManager().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 800),
      builder: (context, child) =>
          LayoutBuilder(builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          final dio = DioUtil().getInstance();
          return MultiProvider(
            providers: [
              Provider(
                  create: (context) =>
                      HomeProductRepository(dio: dio ?? Dio())),
              ChangeNotifierProvider(
                create: (context) =>
                    ProductProvider(context.read<HomeProductRepository>()),
              ),
            ],
            child: MaterialApp(
              title: "UniTask",
              debugShowCheckedModeBanner: false,
              scaffoldMessengerKey: AppGlobalConstants.scaffoldKey,
              onGenerateRoute: GenerateRoute.generateRoute,
              theme: ThemeData(fontFamily: 'Poppins', useMaterial3: true),
            ),
          );
        });
      }),
    );
  }
}
