import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mtungi_chap_chap/screens/homeScreen.dart';
import 'package:mtungi_chap_chap/screens/signInScreen.dart';
import 'package:mtungi_chap_chap/screens/signUpScreen.dart';
import 'package:mtungi_chap_chap/screens/testScreen.dart';
import 'package:get_storage/get_storage.dart';

void main() async  {
  await GetStorage.init();
  late String key="keeey";
  late String value= "vlauuue";
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(
      child:  MaterialApp(
        title: 'gas delivery',
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
              // return MyApp();
            }
            return SignInScreen();
          },
        ),
      ),
    ),
  );
}

DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("users");

class MyApp extends StatefulWidget {
  final Widget? child;

  MyApp({this.child});
  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();
  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      child: widget.child!,
      key: key,
    );
  }
}
