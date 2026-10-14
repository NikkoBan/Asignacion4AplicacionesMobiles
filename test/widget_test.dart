import 'package:flutter_test/flutter_test.dart';
import 'package:asignacion4_flutter_app/main.dart';

void main() {
  testWidgets('Verifica que el nombre del desarrollador y la app carguen correctamente', (WidgetTester tester) async {
    await tester.pumpWidget(const MiPerfilApp());

    // Verifica que aparezca el nombre del desarrollador
    expect(find.text('Starling Emmanuel'), findsOneWidget);
    expect(find.text('Jacobo Mejia'), findsOneWidget);
  });
}
