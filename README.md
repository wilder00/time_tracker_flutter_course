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

- facebook login: [https://developers.facebook.com/docs/facebook-login](https://developers.facebook.com/docs/facebook-login)

---

## implementar sign in con google y firebase

1. activar el sign in con google en firebase
2. descargar el plugin [google_sign_in](https://pub.dev/packages/google_sign_in) para este caso usaremos la versión 4.5.6

---

## implementar sign in con Facebook y firebase

1. Registrarse y/o entrar a facebook developer
2. leer la documentación de (sign in con facebook)[https://developers.facebook.com/docs/facebook-login]
3. agragar los recursos necesarios en la carpeta/archivo `android/app/src/main/res/values/strings.xml` (si no hay, crear el archivo) según las instrucciones de desarrollo con android de Facebook.
4. copiar el contenido del styles.xml para tener la plantilla de un xml válido.

   - en la parte de agregar el key usé: `keytool -exportcert -alias androiddebugkey -keystore "C:\Users\LEGION\.android\debug.keystore" | ./openssl sha1 -binary | ./openssl base64` en vez del que se muestra

Despues de configurar los archivos de android como lo indica Facebook:

1. registramos la app facebook que creamos con el id y secret code en firebase
2. descargamos el pluggin de flutter: [flutter_login_facebook](https://pub.dev/packages/flutter_login_facebook) para este caso, la versión 0.4.0+1
3.

---

## Ejemplos

### Ejemplo de Stream con dartpad

uso básico de stream

```
import 'dart:async';

void addLessThanFive(StreamController controller,int value){
   if(value<5){
      controller.sink.add(value);
   }else{
      controller.sink.addError(StateError('$value is not less than 5'));
   }
}

void main(){
   final controller = StreamController();

   addLessThanFive(controller, 1);
   addLessThanFive(controller, 2);
   addLessThanFive(controller, 3);
   addLessThanFive(controller, 4);
   addLessThanFive(controller, 5);

   controller.stream.listen((value){
      print(value);
   });

}
```

agregando la captura de errores al stream

```
import 'dart:async';

void addLessThanFive(StreamController controller,int value){
   if(value<5){
      controller.sink.add(value);
   }else{
      controller.sink.addError(StateError('$value is not less than 5'));
   }
}

void main(){
   final controller = StreamController();

   addLessThanFive(controller, 1);
   addLessThanFive(controller, 2);
   addLessThanFive(controller, 3);
   addLessThanFive(controller, 4);
   addLessThanFive(controller, 5);

   controller.stream.listen((value){
      print(value);
   }, onError: (error){
      print(error);
   });

}
```

agregando el detector de evento de cierre del stream

```
import 'dart:async';

void addLessThanFive(StreamController controller,int value){
   if(value<5){
      controller.sink.add(value);
   }else{
      controller.sink.addError(StateError('$value is not less than 5'));
   }
}

void main(){
   final controller = StreamController();

   addLessThanFive(controller, 1);
   addLessThanFive(controller, 2);
   addLessThanFive(controller, 3);
   addLessThanFive(controller, 4);
   addLessThanFive(controller, 5);

   //cerrando el stream después de usarlo 5 veces, después de cerrarlo daria error usar el stream
   controller.close();


   controller.stream.listen((value){
      print(value);
   }, onError: (error){
      print(error);
   }, onDone:(){
      print("done");
   });

}
```
