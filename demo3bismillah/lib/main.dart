import 'package:flutter/material.dart';
import 'package:demo3bismillah/app/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Modul 3 - API & Async', 
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF0F2F5),
        // PERBAIKAN DI SINI:
        cardTheme: CardThemeData( 
          elevation: 1,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      // Menggunakan GoRouter
      routerConfig: AppRoutes.router,
    );
  }
}