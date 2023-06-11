import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:report4/components/form_text_field.dart';
import 'package:report4/components/sign_up_top_image.dart';
import 'package:report4/pages/login/login_page.dart';
import 'package:report4/responsive.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
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
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          formField("Username", Icons.person, false, email),
                          const SizedBox(
                            height: 10,
                          ),
                          formField("Email", Icons.email, false, email),
                          const SizedBox(
                            height: 10,
                          ),
                          formField("Password", Icons.lock_outline, true, pass),
                           const SizedBox(
                            height: 10,
                          ),
                          formField("Confirm Password", Icons.lock_outline, true, confirmpass),
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
                                Get.to(() => {});
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              child: const Text(
                                'LOG IN',
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
            Text("Already have an account? "),
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
