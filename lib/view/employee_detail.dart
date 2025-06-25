import 'package:flutter/material.dart';
import 'package:workmotioncorp_app/utils/textsize.dart';

import '../model/all_employee_model.dart';

class EmployeeDetail extends StatelessWidget {
  const EmployeeDetail({super.key, required this.employ});
 final  AllEmployeeModel  employ;

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
              CircleAvatar(
                backgroundImage: NetworkImage(employ.photo),  // ใช้ URL ของรูปภาพ
                radius: 70,
              ),
              SizedBox(height: 10),
              Text(
                employ.name,
                textAlign: TextAlign.center,
                style: TextSizeStyle.textTitle,
              ),
              SizedBox(height: 5),
              Text(
                'Username: ${employ.username}',
                style: TextSizeStyle.textNomal,
              ),
              SizedBox(height: 5),
              Text(
                'Email: ${employ.email}',
                style: TextSizeStyle.textNomal,
              ),
              SizedBox(height: 5),
              Text(
                'Address: ${employ.address}',
                style: TextSizeStyle.textNomal,
              ),
              SizedBox(height: 5),
              Text(
                'Zip: ${employ.zip}',
                style: TextSizeStyle.textNomal,
              ),
              SizedBox(height: 5),
              Text(
                'State: ${employ.state}',
                style: TextSizeStyle.textNomal,
              ),
              SizedBox(height: 5),
              Text(
                'Country: ${employ.country}',
                style: TextSizeStyle.textNomal,
              ),
              SizedBox(height: 5),
              Text(
                'Phone: ${employ.phone}',
                style: TextSizeStyle.textNomal,
              ),
            ],
                  ),
          )),
    );
  }
}
