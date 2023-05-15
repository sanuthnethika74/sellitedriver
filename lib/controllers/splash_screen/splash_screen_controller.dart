import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  String? email;
  String? token;
  String? firstname;
  String? lastname;
  String? expirationDate;

  Future startAnimation() async {
    //check if user is logged in
    final SharedPreferences userdata = await SharedPreferences.getInstance();

    await Future.delayed(
      //delayed function
      const Duration(seconds: 4),
      () async {
        email = userdata.getString('email');
        token = userdata.getString('token');
        firstname = userdata.getString('firstName');
        lastname = userdata.getString('lastName');
        expirationDate = userdata.getString('expirationDate');

        print(userdata.getString('email'));

        if (email != null &&
            token != null &&
            firstname != null &&
            lastname != null &&
            expirationDate ==
                "${DateTime.now().year}/${DateTime.now().month}") {
          Get.offNamed("/dashboard");
        } else {
          await userdata.clear();
          Get.offNamed("/login");
        }
      },
    );
  }
}
