# 📱 Asignación #4: Aplicaciones Móviles en Flutter

**Desarrollador:** Starling Emmanuel Jacobo Mejia  
**Matrícula:** 2022-0184  
**Tecnología:** Flutter SDK & Dart  
**Arquitectura:** Modular por Capas (Clean & Scalable Architecture)

---

## 🎯 Requerimientos Cumplidos

| Requisito | Implementación |
| :--- | :--- |
| **Tu Foto** | `assets/images/perfil.png` renderizada mediante el widget modular `ProfileAvatar` con borde gradiente, sombra y badge de estado. |
| **Nombre y Apellido** | **Starling Emmanuel Jacobo Mejia** presentado con jerarquía visual tipográfica mediante `DeveloperInfo`. |
| **Fecha y Hora Actual** | Datos en tiempo real actualizados cada segundo mediante `Timer.periodic` en `PerfilScreen` y visualizados en `LiveClockCard`. |
| **Interactividad y Dinamismo** | Saludo dinámico según la hora (día/tarde/noche) y botón interactivo para alternar formato 12h / 24h. |

---

## 🏗️ Arquitectura Modular y Escalable (`lib/`)

El proyecto ha sido estructurado siguiendo las mejores prácticas de la industria en Flutter, separando responsabilidades en capas independientes para permitir fácil escalabilidad y pruebas:

```text
lib/
├── core/
│   ├── constants/
│   │   └── app_colors.dart        <-- Paleta de diseño y temas centralizados
│   └── utils/
│       └── date_time_helper.dart  <-- Lógica pura de fechas, horas y saludos
├── presentation/
│   ├── screens/
│   │   └── perfil_screen.dart     <-- Pantalla principal y control del Timer
│   └── widgets/
│       ├── developer_info.dart    <-- Widget para nombre y rol del desarrollador
│       ├── live_clock_card.dart   <-- Tarjeta del reloj en tiempo real
│       └── profile_avatar.dart    <-- Widget para la fotografía con gradiente
└── main.dart                      <-- Punto de entrada limpio con MaterialApp
```

---

## 📂 Archivos del Repositorio

```text
Asignacion4Aplicaciones Mobiles/
├── assets/images/perfil.png       <-- Fotografía oficial del desarrollador
├── lib/                           <-- Código fuente modular en Flutter
├── preview.html                   <-- Simulador interactivo en navegador para practicar/grabar
├── pubspec.yaml                   <-- Configuración de dependencias y assets
└── README.md                      <-- Guía del proyecto y guion del video
```

---

## 🚀 Cómo Ejecutar la Aplicación

### Opción A: Vista Previa y Grabación Inmediata con el Navegador
Si necesitas practicar para el video de inmediato o no tienes el emulador configurado:
1. Haz doble clic en el archivo [preview.html](preview.html) para abrirlo en Chrome o Edge.
2. Verás el teléfono móvil simulado con tu foto, nombre, reloj en tiempo real corriendo segundo a segundo y botón funcional de 12h/24h.

### Opción B: Ejecución Nativa con Flutter SDK
1. Abre una terminal en esta carpeta (`c:\Users\SEJM_8909\Desktop\Asignacion4Aplicaciones Mobiles`).
2. Genera los entornos de plataforma si es la primera vez:
   ```bash
   flutter create .
   ```
3. Descarga las dependencias:
   ```bash
   flutter pub get
   ```
4. Ejecuta la aplicación en tu emulador o dispositivo:
   ```bash
   flutter run
   ```

---

## 🎙️ Guion Sugerido para tu Grabación de Video

Usa este guion de 1 a 2 minutos para sonar natural, seguro y profesional:

1. **Introducción (15 seg):**
   > *"¡Hola a todos! Mi nombre es Starling Emmanuel Jacobo Mejia y en este video les presento el desarrollo de la Asignación #4 de la materia de Aplicaciones Móviles utilizando Flutter."*

2. **Explicación de la Arquitectura y Código (40 seg):**
   > *"Para este proyecto implementamos una arquitectura modular y escalable. Dividimos el código en la capa `core`, donde separamos la lógica de fechas en `DateTimeHelper` y los colores en `AppColors`, y la capa `presentation`, con componentes reutilizables como `ProfileAvatar`, `DeveloperInfo` y `LiveClockCard`."*
   > *"En `PerfilScreen`, utilizamos un `StatefulWidget` con un `Timer.periodic` de un segundo para actualizar la hora en tiempo real mediante `setState()`, cancelándolo en el método `dispose()` para garantizar la eficiencia de memoria."*

3. **Demostración de la Aplicación en Vivo (30 seg):**
   > *"Como pueden observar en la pantalla:*
   > *1. Aquí está mi foto de perfil personalizada con marco degradado.*
   > *2. Mi nombre y apellido: Starling Emmanuel Jacobo Mejia.*
   > *3. El saludo dinámico según la hora actual y el reloj digital actualizándose segundo a segundo en vivo con la fecha completa en español.*
   > *Además, incluimos la interactividad de alternar entre formato de 12 horas y 24 horas con un toque."*

4. **Conclusión (10 seg):**
   > *"Con esto cumplimos todos los requerimientos de la asignación demostrando manejo de estados, componentes modulares y datos en tiempo real. ¡Muchas gracias!"*
