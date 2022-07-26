import 'package:flutter/material.dart';
import 'package:music_app/Screens/welcome_screen.dart';
import 'package:provider/provider.dart';

// import 'Screens/details_screen.dart';
import 'models/saved_data.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SavedData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
