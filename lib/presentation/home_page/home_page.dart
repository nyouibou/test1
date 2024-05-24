// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/presentation/home_page/home_controller.dart';
import 'package:test_task/presentation/second_page/second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SHREE",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "IRA",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              "EDUCATION",
              style: TextStyle(
                  fontSize: 28, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 13,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  filled: true,
                  // fillColor: const Color.fromARGB(255, 219, 216, 216),
                  hintText: "Email address",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 142, 138, 138)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 13,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  filled: true,
                  hintText: "password",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 142, 138, 138)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Provider.of<HomeController>(context, listen: false).postData(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                    context);
              },
              child: Container(
                height: 60,
                width: 330,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(
                  child: Text(
                    "sign in",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
