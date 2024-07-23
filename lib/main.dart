import 'package:flutter/material.dart';
import 'package:islamy/ui/ahadethDetails/ahadethDetailsScreen.dart';
import 'package:islamy/ui/home/homeScreen.dart';
import 'package:islamy/ui/quranDetails/quranDetailsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Theme.of(context).colorScheme.primary,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
            selectedIconTheme: IconThemeData(size: 32),
            unselectedIconTheme: IconThemeData(size: 24)),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            titleTextStyle: TextStyle(
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            primary: Color(0xffB7935F),
            onPrimary: Colors.white,
            secondary: Color(0xffB7935F).withOpacity(0.57),
            onSecondary: Colors.grey),
        useMaterial3: true,
      ),
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        QuranDetailsScreen.routeName:(_)=> QuranDetailsScreen(),
        Ahadethdetailsscreen.routeName:(_)=> Ahadethdetailsscreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
