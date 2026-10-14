/// Utilidad para formatear fechas, horas y saludos en español
/// de forma independiente a paquetes de terceros, facilitando pruebas unitarias y escalabilidad.
class DateTimeHelper {
  static const List<String> diasSemana = [
    'Lunes',
    'Martes',
    'Miércoles',
    'Jueves',
    'Viernes',
    'Sábado',
    'Domingo'
  ];

  static const List<String> meses = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre'
  ];

  static String obtenerDiaSemana(int dia) {
    return diasSemana[(dia - 1) % 7];
  }

  static String obtenerMes(int mes) {
    return meses[(mes - 1) % 12];
  }

  static String formatearFechaCompleta(DateTime fecha) {
    final dia = obtenerDiaSemana(fecha.weekday);
    final mes = obtenerMes(fecha.month);
    return '$dia, ${fecha.day} de $mes de ${fecha.year}';
  }

  static String formatearHora(DateTime fecha, {bool use24Hour = false}) {
    final mm = fecha.minute.toString().padLeft(2, '0');
    final ss = fecha.second.toString().padLeft(2, '0');

    if (use24Hour) {
      final hh = fecha.hour.toString().padLeft(2, '0');
      return '$hh:$mm:$ss';
    } else {
      final hour12 = fecha.hour % 12 == 0 ? 12 : fecha.hour % 12;
      final hh = hour12.toString().padLeft(2, '0');
      final amPm = fecha.hour >= 12 ? 'PM' : 'AM';
      return '$hh:$mm:$ss $amPm';
    }
  }

  static String obtenerSaludo(int hora) {
    if (hora >= 6 && hora < 12) {
      return '¡Buenos días! ☀️';
    } else if (hora >= 12 && hora < 19) {
      return '¡Buenas tardes! 🌤️';
    } else {
      return '¡Buenas noches! 🌙';
    }
  }
}
