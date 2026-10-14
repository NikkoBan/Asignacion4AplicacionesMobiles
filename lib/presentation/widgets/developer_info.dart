import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

/// Widget desacoplado para mostrar la identidad del desarrollador.
class DeveloperInfo extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String role;

  const DeveloperInfo({
    super.key,
    required this.firstName,
    required this.lastName,
    this.role = 'Desarrollador Móvil Flutter',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          firstName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 26,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          lastName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.surfaceBorder),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.code_rounded,
                size: 18,
                color: AppColors.accentCyan,
              ),
              const SizedBox(width: 8),
              Text(
                role,
                style: const TextStyle(
                  color: Color(0xFFE2E8F0),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
