import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

/// Widget modular para la foto de perfil con borde gradiente y status activo.
class ProfileAvatar extends StatelessWidget {
  final String imagePath;
  final double size;

  const ProfileAvatar({
    super.key,
    required this.imagePath,
    this.size = 140,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  AppColors.accentCyan,
                  AppColors.primary,
                  AppColors.accentPurple,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x666366F1),
                  blurRadius: 20,
                  spreadRadius: 4,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                imagePath,
                width: size,
                height: size,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: size,
                    height: size,
                    color: AppColors.surface,
                    child: const Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.white70,
                    ),
                  );
                },
              ),
            ),
          ),
          // Indicador de "En Línea / Activo"
          Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              color: AppColors.background,
              shape: BoxShape.circle,
            ),
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: AppColors.statusOnline,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
