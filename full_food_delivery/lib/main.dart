import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:full_food_delivery/firebase_options.dart';
import 'package:full_food_delivery/models/restaurant.dart';
import 'package:full_food_delivery/pages/splashScreen.dart';
import 'package:full_food_delivery/services/auth/login_or_register.dart';
import 'package:full_food_delivery/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      // theme provider
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      // restaurant provider
      ChangeNotifierProvider(
        create: (context) => Restaurant(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: SplashScreen(),
    );
  }
}
