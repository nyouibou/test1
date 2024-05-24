import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/presentation/home_page/home_controller.dart';
import 'package:test_task/presentation/home_page/home_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeController())
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
