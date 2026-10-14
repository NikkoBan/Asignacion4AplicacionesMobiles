import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/date_time_helper.dart';

/// Tarjeta moderna con badge en vivo, hora digital en tiempo real y selector de formato.
class LiveClockCard extends StatelessWidget {
  final DateTime currentTime;
  final bool use24HourFormat;
  final VoidCallback onToggleFormat;

  const LiveClockCard({
    super.key,
    required this.currentTime,
    required this.use24HourFormat,
    required this.onToggleFormat,
  });

  @override
  Widget build(BuildContext context) {
    final horaTexto = DateTimeHelper.formatearHora(
      currentTime,
      use24Hour: use24HourFormat,
    );
    final fechaCompleta = DateTimeHelper.formatearFechaCompleta(currentTime);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.surface, AppColors.background],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFF475569).withValues(alpha: 0.4),
          width: 1.5,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Cabecera de la tarjeta con badge "EN VIVO"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.access_time_filled_rounded,
                    color: AppColors.accentCyan,
                    size: 22,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Hora y Fecha',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Badge En Vivo
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.statusOnline.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.statusOnline.withValues(alpha: 0.5),
                  ),
                ),
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: AppColors.statusOnline,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'EN VIVO',
                      style: TextStyle(
                        color: AppColors.statusOnlineText,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const Divider(color: AppColors.surfaceBorder, height: 28),

          // Reloj Digital
          Text(
            horaTexto,
            style: const TextStyle(
              fontFamily: 'monospace',
              color: AppColors.textPrimary,
              fontSize: 34,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
            ),
          ),

          const SizedBox(height: 8),

          // Fecha Formateada
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.calendar_today_rounded,
                size: 16,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  fechaCompleta,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFCBD5E1),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // Botón para alternar formato 12h / 24h
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.accentCyan,
              side: BorderSide(
                color: AppColors.accentCyan.withValues(alpha: 0.4),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
            ),
            onPressed: onToggleFormat,
            icon: const Icon(Icons.swap_horiz_rounded, size: 18),
            label: Text(
              use24HourFormat
                  ? 'Cambiar a formato 12 Horas'
                  : 'Cambiar a formato 24 Horas',
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
