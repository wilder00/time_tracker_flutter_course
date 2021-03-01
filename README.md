# time_tracker_flutter_course

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## fases realizadas para implementar autenticación

1. Crear Firebase Project
   vas a firebase, te creas una cuenta, luego un proyecto.

2. Configurar Android y iOS

   - Para Android:
     - en firebase le das a crear nueva app que tiene el ícono de android
     - ver el archivo en la carpeta android `android/app/build.gradle`
     - en el archivo buscar el bloque llamado `defaultConfig` y copiar el `applicationId`
     - pegar en `Nombre del paquete de Android`
     - rellenar el nombre de la app en firebase
     - luego agregar el SHA-1 generandolo con:

```
keytool -list -v \
-alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore
```

En caso no funcione el comando, podría deverse a que falta instalar el javaSE de su [página de descarga](https://www.oracle.com/java/technologies/javase-downloads.html).

Después de generenerar la llave

- eso debe generar algo parecido a : `DA:39:A3:EE:5E:6B:4B:0D:32:55:BF:EF:95:60:18:90:AF:D8:07:09`
- copiar y pegar en firebase
- Seguir las instruciones siguientes dadas por firebase
- para la sincronización abrir la carpeta de `android` del proyecto con android estudio para que descargue sus dependencias

3. añadir Firebase al proyecto de flutter

Añadiendo los plugins

- firebase_core : utilizaremos la versión 0.5.1 [link](https://pub.dev/packages/firebase_core/install) , según el instructor para evitar problemas con breking changes.
- firebase_auth : utilizaremos la versión 0.18.2 ed su [link](https://pub.dev/packages/firebase_auth) , por el mismo motivo

4. Implementar el anonymous sign in

## Documentación

- firebase con flutter: [https://firebase.flutter.dev/docs/overview#initializing-flutterfire](https://firebase.flutter.dev/docs/overview#initializing-flutterfire)
