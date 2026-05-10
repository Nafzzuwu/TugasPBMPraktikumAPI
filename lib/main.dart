import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'page/login.dart';
import 'page/product_list.dart';
import 'page/submit_page.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      defaultDevice: Devices.ios.iPhone13,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas PBM',
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E90FF)),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/products': (context) => const ProductListPage(),
        '/submit': (context) => const SubmitPage(),
      },
    );
  }
}
