import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellitedriver/constants/image_strings.dart';
import 'package:sellitedriver/controllers/login_screen/login_screen_controller.dart';

import '../../constants/colors.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  LoginController logincontroller = Get.put(LoginController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    final screen_size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            // color: Colors.red,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.only(top: 20),
                    height: screen_size.height * 0.20,
                    alignment: Alignment.center,
                    child: const Center(
                      child: Image(
                        image: AssetImage(LogoPng),
                      ),
                    )),

                SizedBox(height: screen_size.height * 0.05),

                const Text("Sign In",
                    style:
                        TextStyle(fontSize: 38, fontWeight: FontWeight.bold)),
                Text(
                  "Discover more. Good things are waiting for you",
                  style: Theme.of(context).textTheme.bodyText1,
                ),

                // :::::::::::::::::::::::::::::::::::::::::::::::: FORM

                Form(
                    key: logincontroller.loginFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person_outline_outlined),
                              labelText: "Email ",
                              hintText: "Example@gmailo.com",
                              border: OutlineInputBorder(),
                            ),
                            controller: logincontroller.emailController,
                            onSaved: (value) {
                              logincontroller.email = value!;
                            },
                            validator: (value) {
                              return logincontroller.validateEmail(value!);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon:
                                      const Icon(Icons.fingerprint_outlined),
                                  labelText: "Password ",
                                  hintText: "*********",
                                  border: const OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        logincontroller.togglePassword();
                                      },
                                      icon: const Icon(
                                          Icons.remove_red_eye_outlined))),
                              obscureText: logincontroller.obscurePWText.value,
                              controller: logincontroller.passwordController,
                              onSaved: (value) {
                                logincontroller.password = value!;
                              },
                              validator: (value) {
                                return logincontroller.validatePassword(value!);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text("Forget Password ?")),
                          Obx(
                            () => SizedBox(
                                width: double.infinity,
                                child: logincontroller.isLoading.value == true
                                    ? const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: LinearProgressIndicator(),
                                      )
                                    : ElevatedButton(
                                        onPressed: () {
                                          // logincontroller.loginToDashboard();
                                          logincontroller.checkLogin();
                                        },
                                        child: const Text("SING IN"))),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10),
                            child: Divider(),
                          ),
                          const Text("Don't have an account ?"),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: cgray),
                                  onPressed: () {
                                    Get.toNamed("/signup");
                                  },
                                  child: const Text("SIGN UP",
                                      style: TextStyle(color: cDarkColor)))),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
