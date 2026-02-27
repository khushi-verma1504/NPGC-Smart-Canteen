import 'package:flutter/material.dart';
import 'package:npgc_smart_canteen/auth/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontFamily: 'HeadingMain', fontSize: 28, color: Color(0xFF292D32)),
          headlineSmall: TextStyle(fontFamily: 'TitleMedium', fontSize: 16, color: Color(0xffB3BFCB)),
          titleMedium: TextStyle(fontFamily: 'TitleMedium', fontSize: 16, color: Color(0xFF292D32))
        )
      ),
      home: LoginScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
    );
  }
}
