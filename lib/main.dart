import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'old/app/app_widget.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(AppWidget());
}
