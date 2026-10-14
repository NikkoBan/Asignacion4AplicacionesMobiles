// Starling Emmanuel Jacobo Mejia - Matrícula: 2022-0184
import 'package:flutter/material.dart';
import 'core/constants/app_colors.dart';
import 'presentation/screens/perfil_screen.dart';

void main() {
  runApp(const MiPerfilApp());
}

/// Punto de entrada principal configurando tema y la pantalla inicial.
class MiPerfilApp extends StatelessWidget {
  const MiPerfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil Desarrollador - Starling Jacobo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: AppColors.primary,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: AppColors.primary,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
      ),
      themeMode: ThemeMode.dark,
      home: const PerfilScreen(),
    );
  }
}
