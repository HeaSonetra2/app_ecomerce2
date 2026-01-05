import 'package:ecomerce_app/app.dart';
import 'package:ecomerce_app/core/injection/injection.dart';
import 'package:flutter/material.dart';

void main(List<String> args)async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
 
  runApp(App());
}
