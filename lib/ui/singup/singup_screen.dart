import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellitedriver/constants/image_strings.dart';
import 'package:sellitedriver/controllers/signup/signup_controller.dart';

import '../../constants/colors.dart';

class SingupPage extends StatelessWidget {
  SingupPage({Key? key}) : super(key: key);

  SingupController signupcontroller = Get.put(SingupController());

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
                    padding: const EdgeInsets.only(top: 10),
                    height: screen_size.height * 0.10,
                    alignment: Alignment.center,
                    child: const Center(
                      child: Image(
                        image: AssetImage(LogoPng),
                      ),
                    )),

                SizedBox(height: screen_size.height * 0.02),

                const Text("Sign Up",
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                Text(
                  "Discover more. Good things are waiting for you",
                  style: Theme.of(context).textTheme.bodyText1,
                ),

                // :::::::::::::::::::::::::::::::::::::::::::::::: FORM

                Form(
                    key: signupcontroller.signupFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person_outline_outlined),
                              labelText: "First Name ",
                              hintText: "first name",
                              border: OutlineInputBorder(),
                            ),
                            controller: signupcontroller.firstnameController,
                            onSaved: (value) {
                              signupcontroller.firstname = value!;
                            },
                            validator: (value) {
                              return signupcontroller.validateFirstname(value!);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person_outline_outlined),
                              labelText: "Last Name ",
                              hintText: "last name",
                              border: OutlineInputBorder(),
                            ),
                            controller: signupcontroller.lastnameController,
                            onSaved: (value) {
                              signupcontroller.lastname = value!;
                            },
                            validator: (value) {
                              return signupcontroller.validateLastname(value!);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.phone_android_outlined),
                              labelText: "Phone ",
                              hintText: "07########",
                              border: OutlineInputBorder(),
                            ),
                            controller: signupcontroller.phoneController,
                            onSaved: (value) {
                              signupcontroller.phone = value!;
                            },
                            validator: (value) {
                              return signupcontroller.validatePhone(value!);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              labelText: "Email ",
                              hintText: "Example@gmailo.com",
                              border: OutlineInputBorder(),
                            ),
                            controller: signupcontroller.regemailController,
                            onSaved: (value) {
                              signupcontroller.email = value!;
                            },
                            validator: (value) {
                              return signupcontroller.validateEmail(value!);
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
                                        signupcontroller.togglePassword();
                                      },
                                      icon: const Icon(
                                          Icons.remove_red_eye_outlined))),
                              obscureText: signupcontroller.obscurePWText.value,
                              controller:
                                  signupcontroller.redpasswordController,
                              onSaved: (value) {
                                signupcontroller.password = value!;
                              },
                              validator: (value) {
                                return signupcontroller
                                    .validatePassword(value!);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10),
                            child: Divider(),
                          ),
                          Obx(
                            () => SizedBox(
                                width: double.infinity,
                                child: signupcontroller.isLoading.value == true
                                    ? const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: LinearProgressIndicator(),
                                      )
                                    : ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFF228B22)),
                                        onPressed: () {
                                          // signupcontroller.loginToDashboard();
                                          signupcontroller.checkSignup();
                                        },
                                        child: const Text("SING IN"))),
                          ),
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
