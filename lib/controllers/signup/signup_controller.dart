import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sellitedriver/utils/keys/form_key_utils.dart';

class SingupController extends GetxController {
  //:::::::::::::::::::::::::::::::::::::::password area
  var obscurePWText = true.obs;
  var isLoading = false.obs;

  togglePassword() {
    if (obscurePWText.value == true) {
      obscurePWText.value = false;
    } else {
      obscurePWText.value = true;
    }
  }

  // ::::::::::::::::::::::::::::::::::::::::::Form area

  // GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  GlobalKey<FormState> signupFormKey = FormKeyUtils.createFormKey('register');

  late TextEditingController regemailController,
      redpasswordController,
      firstnameController,
      lastnameController,
      phoneController;
  var email = "", password = "", firstname = "", lastname = "", phone = "";

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }

    return null;
  }

  String? validatePassword(String value) {
    if (value.length <= 8) {
      return "Password must be of 8 chars";
    }

    return null;
  }

  String? validateFirstname(String value) {
    if (value.length <= 1) {
      return "Provide valid name";
    }

    return null;
  }

  String? validateLastname(String value) {
    if (value.length <= 1) {
      return "Provide valid name";
    }

    return null;
  }

  String? validatePhone(String value) {
    if (value.length <= 9) {
      return "Provide valid Phone";
    }

    return null;
  }

  void checkSignup() {
    final isValid = signupFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    signupFormKey.currentState!.save();
    print(firstname + lastname + phone + email + password);
    goToLogin();
    // print(email);
  }

  @override
  void onInit() {
    super.onInit();
    regemailController = TextEditingController();
    redpasswordController = TextEditingController();

    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void onClose() {
    regemailController.dispose();
    redpasswordController.dispose();
  }

  Future goToLogin() async {
    Get.back();
    // isLoading.value=true;

    // final Map<String, dynamic> json = {
    //   "name": "generateToken",
    //   "param": {"email": email, "pass": password}
    // };

    // final api_model = ApiModel();

    // await api_model.getResponseLogin(json);
    // isLoading.value=false;
  }
}
