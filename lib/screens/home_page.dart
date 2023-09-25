import 'package:app_shop_super_car/controller/get_list_car_controller.dart';
import 'package:app_shop_super_car/screens/detail_car.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../colors/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final getControllerListCar = Get.put(GetControllerListCar());
  final formatCurrency = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');

  @override
  void initState() {
    // TODO: implement initState

    getControllerListCar.getListCarFromApi();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              TextButton(
                  onPressed: () {

                  },
                  child: const Text("App Car", style: TextStyle(fontSize: 18, color: AppColors.black, fontWeight: FontWeight.w700),)),
              !getControllerListCar.isLoading.value ? Expanded(
                flex: 1,
                child: ListView.builder(
                    itemCount: getControllerListCar.listCarModel.value.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) =>  DetailCar(image: getControllerListCar.listCarModel.value[index].image,))
                          );
                        },
                        child: Column(
                          children: [
                            const SizedBox(height: 20,),
                            Image.network(getControllerListCar.listCarModel.value[index].image, width: 300, height: 200,),
                            Container(
                              margin: const EdgeInsets.only(top: 20, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      getControllerListCar.listCarModel.value[index].name,
                                      style: const TextStyle(
                                          fontSize: 18, color: AppColors.black,
                                          fontWeight: FontWeight.w700)
                                  ),
                                  Text(
                                      "Giá: ${formatCurrency.format(getControllerListCar.listCarModel.value[index].price)}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColors.black_grey)
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Text("Số lượng: ${getControllerListCar.listCarModel.value[index].number}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.black
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: AppColors.black_blur,
                            )
                          ],
                        ),
                      );
                    }
                ),
              ) : const Center(
                child: CircularProgressIndicator(),
              )
            ],
          ),
        ),
      ),
    ),
    );
  }
}
