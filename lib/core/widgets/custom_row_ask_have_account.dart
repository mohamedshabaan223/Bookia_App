import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomRowAskHaveAccount extends StatelessWidget {
  final String labelOne;
  final String labelTwo;
  const CustomRowAskHaveAccount({super.key, required this.labelOne, required this.labelTwo});

  @override
  Widget build(BuildContext context) {
    return  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    labelOne,
                    style: AppTextStyles.text14Regular.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      labelTwo,
                      style: AppTextStyles.text14Regular.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              );
  }
}