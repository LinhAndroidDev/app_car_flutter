
import 'package:app_shop_super_car/model/car_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetControllerListCar extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  var isLoading = false.obs;
  var listCarModel = <CarModel>[].obs;

   getListCarFromApi() async {
    isLoading.value = true;

    final response = await http.get(Uri.parse("https://firebasestorage.googleapis.com/v0/b/realtime-64f58.appspot.com/o/test.json?alt=media&token=f683235b-dab3-4512-95bd-dd865e3b6cc1"));

    if(response.statusCode == 200) {

      listCarModel.value = carModelFromJson(response.body.toString());

      isLoading.value = false;
      update();
    } else {
      Get.snackbar("Error loading data", "fail");
    }

  }
}