import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task/presentation/second_page/widget/refactor_textfield.dart';

class HomeSreen extends StatefulWidget {
  const HomeSreen({super.key});

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  var fnameController = TextEditingController();
  var lnameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var addressController = TextEditingController();
  var detailsController = TextEditingController();
  late SharedPreferences sharedPreferences;
  var data;

  getReceivedData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var storeData;
    storeData = sharedPreferences.getString("userdata");
    data = jsonDecode(storeData);
    log("data -> ${data}");
  }

  @override
  void initState() {
    getReceivedData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fnameController.text = data["user"]["fname"];
    lnameController.text=data["user"]["lname"];
    phoneController.text=data["user"]["mobile"];
    addressController.text=data["user"]["address"];
    detailsController.text=data["user"]["detail"];
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.white,
        ),
        backgroundColor: Color(0xffFF9900),
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.more_vert_outlined,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.amber,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: fnameController,
                  decoration: InputDecoration(border: OutlineInputBorder(), hintText: "First Name"),
                ),
                RefactoredTextfield(controller: lnameController, name: "Last Name "),
                RefactoredTextfield(controller: phoneController, name: "Mobile Number "),
                RefactoredTextfield(controller: passwordController, name: "Password "),
                RefactoredTextfield(controller: addressController, name: "Address"),
                RefactoredTextfield(
                  controller: detailsController,
                  name: "Detail",
                  height: 5,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xffFF9900),
                  ),
                  child: Center(
                    child: Text(
                      "Update",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
