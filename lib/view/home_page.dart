import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workmotioncorp_app/model/employee_model.dart';
import 'package:workmotioncorp_app/utils/textsize.dart';

import '../viewmodel/employee_vm.dart';
import 'add_employee_screen.dart';
import 'all_employee_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final employeeController = Get.put(EmployeeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () => Get.to(() => const AllEmployeeScreen()),
              child: Row(
                children: [
                  Text(
                    'All Employee',
                    style: TextSizeStyle.textNomal,
                  ),
                  const Icon(Icons.navigate_next)
                ],
              ))
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Obx(
        () {
          if (employeeController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        cardEM(employeeController.listEm[index]),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: employeeController.listEm.length)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(() => const AddEmployeeScreen());
        },
      ),
    );
  }

  Container cardEM(EmployeeModel data) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Name :', style: TextSizeStyle.textNomal),
              Text('ID :', style: TextSizeStyle.textNomal),
              Text('Position :', style: TextSizeStyle.textNomal),
              Text('E-mail :', style: TextSizeStyle.textNomal),
              Text('Phone :', style: TextSizeStyle.textNomal),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(data.name, style: TextSizeStyle.textNomal),
                Text(data.id, style: TextSizeStyle.textSub),
                Text(data.position, style: TextSizeStyle.textNomal),
                Text(data.email, style: TextSizeStyle.textNomal),
                Text(data.phone.toString(), style: TextSizeStyle.textNomal),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Get.find<EmployeeViewModel>().fillDataEdit(data);
                    Get.to(() => const AddEmployeeScreen(
                          title: "Edit Employee",
                        ));
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.grey.shade700,
                  )),
              IconButton(
                  onPressed: () => employeeController.deleteEmployee(data.id),
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red.shade600,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
