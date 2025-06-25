import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workmotioncorp_app/viewmodel/employee_vm.dart';

import '../utils/textsize.dart';

class AddEmployeeScreen extends StatelessWidget {
  const AddEmployeeScreen({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            title ?? 'New Employee',
            style: TextSizeStyle.textTitle,
          ),
        ),
        body: SafeArea(
            child: Form(
          key: Get.find<EmployeeViewModel>().formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: Get.find<EmployeeViewModel>().name,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                        ),
                        validator: (value) => Get.find<EmployeeViewModel>()
                            .validationString(value),
                      ),
                      TextFormField(
                        controller: Get.find<EmployeeViewModel>().position,
                        decoration: const InputDecoration(
                          hintText: 'Position',
                        ),
                        validator: (value) => Get.find<EmployeeViewModel>()
                            .validationString(value),
                        onChanged: (value) {
                          print(value);
                        },
                      ),
                      TextFormField(
                        controller: Get.find<EmployeeViewModel>().email,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                        validator: (value) => Get.find<EmployeeViewModel>()
                            .validationEmail(value),
                      ),
                      TextFormField(
                        controller: Get.find<EmployeeViewModel>().phone,
                        decoration: const InputDecoration(
                          hintText: 'Phone',
                        ),
                        validator: (value) =>
                            Get.find<EmployeeViewModel>().validationPhon(value),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () => title == null
                        ? Get.find<EmployeeViewModel>().addEmployee()
                        : Get.find<EmployeeViewModel>().editEmployee(),
                    child: const Text('Save')),
                const SizedBox(height: 30),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
