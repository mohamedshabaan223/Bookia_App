import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteContainer extends StatelessWidget {
  const DeleteContainer({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: onTap,
      child: Container(
       padding: EdgeInsets.all(1.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r)
         , border: Border.all(color: AppColors.black , width: 2)
        ),
        child: Icon(Icons.close , size: 18,),
      ),
    );
  }
}