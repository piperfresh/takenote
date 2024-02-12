import 'package:flutter/material.dart';
import 'package:notetake/core/constants/app_colors.dart';
import 'package:notetake/core/constants/app_style.dart';
import 'package:notetake/note/presentation/pages/login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              Text(
                'Note-Taking App',
                style: AppStyle.semiBold,
              ),
              const SizedBox(height: 50,),
              Image.asset('assets/images/diary.png'),
              const SizedBox(height: 120,),
              Text(
                'Save and share notes',
                style: AppStyle.semiBold,
              ),
              const SizedBox(height: 130,),
              MaterialButton(
                color: AppColors.buttonColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22))),
                onPressed: () {},
                child: const Text(
                  'Create account',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have an account?',
                      style: AppStyle.normal,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                      child: Text(
                        'Log in',
                        style: AppStyle.normal.copyWith(color: AppColors.buttonColor),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
