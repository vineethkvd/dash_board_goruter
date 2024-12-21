import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/helpers/routes/app_route_config.dart';
import 'features/home/controller/home_controller.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Manappuram AppSuite',
        theme: ThemeData.dark(),
        routerConfig: AppRoutes().appRouter,
      ),
    );
  }
}