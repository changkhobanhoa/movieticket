import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report4/controller/auth_controller.dart';

import 'package:report4/pages/login/login_page.dart';
import 'package:report4/utils/constant.dart';

import '../../components/form_text_field.dart';
import '../../components/sign_up_top_image.dart';
import '../../responsive.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController confirmpass = TextEditingController();

  void registerUser(email, pass) async {
    final httpUri = Uri(
      scheme: 'http',
      host: '192.168.1.6',
      path: 'registration',
    );
    var resBody = {"email": email.text, "password": pass.text};
    final response = await http.post(httpUri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(resBody));
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['status']) {
      AuthController.instance.getErrorSnackBarNew("Đăng ký thành công");
    } else {
      AuthController.instance.getErrorSnackBarNew("Đăng ký lỗi ");
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Responsive(
              mobile: Padding(
                padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SignUpScreenTopImage(),
                      const SizedBox(
                        height: 10,
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              formField("Username", Icons.person, false,
                                  (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              }, user),
                              const SizedBox(
                                height: 10,
                              ),
                              formField("Email", Icons.email, false, (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                } else if (EmailValidator.validate(
                                    email.text)) {
                                  return 'Please enter email real';
                                }
                                return null;
                              }, email),
                              const SizedBox(
                                height: 10,
                              ),
                              formField("Password", Icons.lock_outline, true,
                                  (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              }, pass),
                              const SizedBox(
                                height: 10,
                              ),
                              formField(
                                  "Confirm Password", Icons.lock_outline, true,
                                  (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter confirm pass';
                                } else if (value.compareTo(pass.text) == 1) {
                                  return 'Confirm pass not match';
                                }
                                print(value + "/n" + pass.text);
                                return null;
                              }, confirmpass),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12)),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Processing Data')),
                                      );
                                    }
                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)))),
                                  child: const Text(
                                    'SIGN IN',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ]),
              ),
              desktop: Row()),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account? "),
            InkWell(
              child: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  "Login Now",
                  style: TextStyle(color: Color(0xff35C2C1)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
