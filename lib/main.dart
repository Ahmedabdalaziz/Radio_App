import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:radio_app/radio_app.dart';
import 'core/DI/dependancy_injection.dart';
import 'feature/error_screen/error_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpGetIt();

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return MaterialApp(
      home: Scaffold(
        body: CustomErrorScreen(message: details.exceptionAsString()),
      ),
    );
  };

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const RadioApp());
}
