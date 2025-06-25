import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:workmotioncorp_app/model/employee_model.dart';

class EmployeeViewModel extends GetxController {
  final RxList<EmployeeModel> listEm = <EmployeeModel>[].obs;
  var isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  String? editID;

  TextEditingController name = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchEmployee();
  }

  @override
  void onClose() {
    name.dispose();
    position.dispose();
    email.dispose();
    phone.dispose();
    super.onClose();
  }

  fetchEmployee() async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 3));
    listEm.value = [
      EmployeeModel(
        id: Uuid().v4(),
        name: "Moises Wehner",
        position: "Mobile Developer",
        email: "Ross.Stehr@gmail.com",
        phone: "0888888888",
      ),
      EmployeeModel(
        id: Uuid().v4(),
        name: "Feil - Kutch ",
        position: "Front-End Developer",
        email: "Feil@gmail.com",
        phone: "0899999999",
      ),
    ];
    isLoading(false);
  }

  addEmployee() {
    if (formKey.currentState!.validate()) {
      listEm.add(
        EmployeeModel(
            id: Uuid().v4(),
            name: name.text,
            position: position.text,
            email: email.text,
            phone: phone.text),
      );
      name.clear();
      position.clear();
      email.clear();
      phone.clear();
      Get.back();
      return;
    }
    Get.snackbar('Error', 'Create new Employee is faile',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 30));
  }

  fillDataEdit(EmployeeModel data) {
    editID = data.id;
    name.text = data.name;
    position.text = data.position;
    email.text = data.email;
    phone.text = data.phone;
  }

  editEmployee() {
    print(editID);
    if (editID == null) return;
    for (var i = 0; i < listEm.length; i++) {
      if (listEm[i].id == editID) {
        listEm[i] = listEm[i].copyWith(
          name: name.text,
          email: email.text,
          position: position.text,
          phone: phone.text,
        );
        break; 
      }
    }
    name.clear();
    position.clear();
    email.clear();
    phone.clear();
    Get.back();
    return;
  }

  deleteEmployee(String id) {
    listEm.removeWhere(
      (element) => element.id == id,
    );
  }

  validationString(String? data) {
    if (GetUtils.isNullOrBlank(data) ?? data!.isEmpty) {
      return 'Something was wrong. Please try again';
    }
    return null;
  }

  validationEmail(String? email) {
    if (!GetUtils.isEmail(email ?? '')) {
      return 'Something was wrong. Please try again';
    }
    return null;
  }

  validationPhon(String? phone) {
    if (phone == null || phone.length < 10) {
      return 'Something was wrong. Please try again';
    }
    return null;
  }
}
