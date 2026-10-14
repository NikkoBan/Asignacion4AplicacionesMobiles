import 'dart:async';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/utils/date_time_helper.dart';
import '../widgets/developer_info.dart';
import '../widgets/live_clock_card.dart';
import '../widgets/profile_avatar.dart';

/// Pantalla principal modularizada. Gestiona el ciclo de vida del temporizador
/// y el estado de la hora en tiempo real.
class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  late DateTime _currentTime;
  Timer? _timer;
  bool _use24HourFormat = false;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();

    // Temporizador que actualiza el estado cada segundo de forma eficiente
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _currentTime = DateTime.now();
        });
      }
    });
  }

  @override
  void dispose() {
    // Cancelación preventiva para evitar fugas de memoria
    _timer?.cancel();
    super.dispose();
  }

  void _toggleHourFormat() {
    setState(() {
      _use24HourFormat = !_use24HourFormat;
    });
  }

  @override
  Widget build(BuildContext context) {
    final saludo = DateTimeHelper.obtenerSaludo(_currentTime.hour);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Asignación #4: App Móvil',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 0.8,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Badge dinámico de Saludo
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.primaryLight.withValues(alpha: 0.4),
                  ),
                ),
                child: Text(
                  saludo,
                  style: const TextStyle(
                    color: AppColors.primaryLight,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // 1. Requerimiento: Foto de Perfil
              const ProfileAvatar(
                imagePath: 'assets/images/perfil.png',
                size: 140,
              ),

              const SizedBox(height: 20),

              // 2. Requerimiento: Nombre y Apellido
              const DeveloperInfo(
                firstName: 'Starling Emmanuel',
                lastName: 'Jacobo Mejia',
                role: 'Desarrollador Móvil Flutter',
              ),

              const SizedBox(height: 28),

              // 3. Requerimiento: Fecha y Hora Actual en Tiempo Real
              LiveClockCard(
                currentTime: _currentTime,
                use24HourFormat: _use24HourFormat,
                onToggleFormat: _toggleHourFormat,
              ),

              const SizedBox(height: 28),

              // Pie de página
              const Text(
                'Desarrollo de Aplicaciones Móviles • Flutter SDK',
                style: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
