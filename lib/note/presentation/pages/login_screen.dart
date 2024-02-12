import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notetake/core/constants/app_style.dart';
import 'package:notetake/core/extensions.dart';

import '../../../core/constants/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: SvgPicture.asset(
          'left_back'.svg,
          fit: BoxFit.scaleDown,
        ),
        title: Text(
          'Log in',
          style:
              AppStyle.mediumNormal.copyWith(color: AppColors.appBarTextColor),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: 'Email',
                // fillColor: Color(0xffeeef2),
                border: OutlineInputBorder()),
          )
        ],
      ),
    );
  }
}
