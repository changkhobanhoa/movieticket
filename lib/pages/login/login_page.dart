import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:report4/responsive.dart';

import '../../components/form_text_field.dart';
import '../../components/sign_up_top_image.dart';
import '../forgot/forgot_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Responsive(
                  mobile: Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SignUpScreenTopImage(),
                        const SizedBox(
                          height: 30,
                        ),
                        Form(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            formField("Email", Icons.email, false, email),
                            const SizedBox(
                              height: 30,
                            ),
                            formField(
                                "Password", Icons.lock_outline, true, pass),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Get.to(  ForgotPage());
                                },
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(() => {});
                                },
                                child: Text(
                                  'LOG IN',
                                  style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)))),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                  desktop: Row(
                    children: [
                      Expanded(
                        child: SignUpScreenTopImage(),
                      ),
                    ],
                  )))),
    );
  }
}
