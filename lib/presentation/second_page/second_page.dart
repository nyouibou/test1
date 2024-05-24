import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task/presentation/second_page/controller/second_page_controller.dart';
import 'package:test_task/presentation/second_page/widget/refactor_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var fnameController = TextEditingController();
  var lnameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var detailsController = TextEditingController();

  @override
  void initState() {
    Provider.of<SecondPageController>(context, listen: false).getReceivedData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Consumer<SecondPageController>(builder: (context, controller, _) {
        fnameController.text = controller.data["user"]["fname"] ?? "";
        lnameController.text = controller.data["user"]["lname"] ?? "";
        phoneController.text = controller.data["user"]["mobile"] ?? "";
        addressController.text = controller.data["user"]["address"] ?? "";
        detailsController.text = controller.data["user"]["detail"] ?? "";
        return controller.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
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
                        RefactoredTextfield(name: "Password "),
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
              );
      }),
    );
  }
}
