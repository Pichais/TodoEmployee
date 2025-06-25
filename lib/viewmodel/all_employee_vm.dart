import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:workmotioncorp_app/model/all_employee_model.dart';

class AllEmployeeViewModel extends GetxController with StateMixin<String> {
  final RxList<AllEmployeeModel> listAllEm = <AllEmployeeModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllEmployee();
  }

  fetchAllEmployee() async {
    try {
      change("load", status: RxStatus.loading());
      var response = await http
          .get(Uri.https("fake-json-api.mock.beeceptor.com", "/users"));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        listAllEm.value = (data as List)
            .map((value) => AllEmployeeModel.fromJson(value))
            .toList();

        if (listAllEm.isEmpty) {
          change("empty", status: RxStatus.empty());
        }
        change("success", status: RxStatus.success());
      }
    } catch (e) {
      change("error", status: RxStatus.error('$e'));
      print('Error occurred: $e');
    }
  }
}
