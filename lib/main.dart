import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Core/helpers/bloc_observer.dart';
import 'Core/helpers/cachehelper.dart';
import 'Core/helpers/service_locator.dart';
import 'alzilzal_app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // var token = FirebaseMessaging.instance.getToken();
  // print('token: $token');

  await CacheHelper.init();
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  //SharedPreferences prefs = await SharedPreferences.getInstance();
  //prefs.clear();
  runApp(const AlzilzalApp());
}
