import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workmotioncorp_app/utils/textsize.dart';
import 'package:workmotioncorp_app/view/employee_detail.dart';

import '../viewmodel/all_employee_vm.dart';

class AllEmployeeScreen extends StatefulWidget {
  const AllEmployeeScreen({super.key});

  @override
  State<AllEmployeeScreen> createState() => _AllEmployeeScreenState();
}

class _AllEmployeeScreenState extends State<AllEmployeeScreen> {
  final employeeController = Get.put(AllEmployeeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("All Employee", style: TextSizeStyle.textNomal),
      ),
      body: employeeController.obx(
        (state) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  var data = employeeController.listAllEm[index];
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Get.to(() => EmployeeDetail(employ: data));
                        },
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(data.photo),
                        ),
                        title: Text(
                          data.name,
                          style: TextSizeStyle.textNomal,
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: employeeController.listAllEm.length)),
        onEmpty: const Text('No data found'),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        onError: (error) => Text(error ?? ''),
      ),
    );
  }
}
