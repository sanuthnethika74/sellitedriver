import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var selectedIndex = 0.obs;
  // var textValue = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void goToNotifications() {
    Get.toNamed("/notifications");
  }

  @override
  void onInit() {
    super.onInit();
  }
}
