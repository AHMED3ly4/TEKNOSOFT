import 'package:e_commerce/core/bloc_observer.dart';
import 'package:e_commerce/core/gi/service_locator.dart';
import 'package:e_commerce/e_commerce_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureDependencies();
  Bloc.observer = const AppBlocObserver();
  runApp(const ECommerceApp());
}


