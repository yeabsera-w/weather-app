import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather/app.dart';
import 'package:weather/observer.dart';
import 'package:weather/weather/repositories/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InjectionService.injectAll();
  Bloc.observer = WeatherObserver();

  runApp(const App());
}
