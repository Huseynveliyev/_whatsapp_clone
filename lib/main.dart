import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:real_whatsapp_clone/whatsappMain.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData(
          primaryColor: Color(0xff075e54),
        ),
        home: WhatsappMain());
  }
}
