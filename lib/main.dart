import 'package:bottom_navbar_bloc_pattern/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bottom_navigation/bottom_navigation_bloc.dart';

void main() async {
  runApp(const BlocBottomNavbarApp());
}

class BlocBottomNavbarApp extends StatefulWidget {
  const BlocBottomNavbarApp({Key? key}) : super(key: key);

  @override
  State<BlocBottomNavbarApp> createState() => _TelemedicineAppState();
}

class _TelemedicineAppState extends State<BlocBottomNavbarApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavigationBloc>(
      create: (context) => BottomNavigationBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
