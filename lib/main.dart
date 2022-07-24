// ignore_for_file: prefer_const_constructors, unused_import

import 'package:diabe/provider/authentication_provider.dart';
import 'package:diabe/provider/home_provider.dart';
import 'package:diabe/screens/home/home.dart';
import 'package:diabe/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'router/router.dart';
import 'screens/login/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeProvider()),
          Provider(
              create: (context) =>
                  AuthenticationProvider(FirebaseAuth.instance)),
          StreamProvider(
            create: (context) =>
                context.read<AuthenticationProvider>().authState,
            initialData: null,
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Diabetes Control',
          theme: ThemeData(
              fontFamily: 'Poppins',
              scaffoldBackgroundColor: bgColor,
              appBarTheme: const AppBarTheme(
                  backgroundColor: appBarColor,
                  iconTheme: IconThemeData(color: Colors.black))),
          routes: AppRouter.routes,
          home: Authenticate(),
        ));
  }
}

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      //Means that the user is logged in already and hence navigate to HomePage
      return Home();
    }
    //The user isn't logged in and hence navigate to LogInPage.
    return Login();
  }
}
