import 'dart:io';

import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:bookia_app/core/widgets/custom_arrow_back.dart';
import 'package:bookia_app/core/widgets/custom_text_form_fiELd.dart';
import 'package:bookia_app/core/widgets/custome_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
    final ImagePicker picker = ImagePicker();
    XFile? photo;
    void pickGallery() async {
    photo = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w , vertical: 11.h),
        child: SafeArea(
          child: Column(children: [
                 Row(children: [
             CustomArrowBack(),
             SizedBox(width: 60.w,),
            Text('Edit Profile' , style: AppTextStyles.text20Regular.copyWith(fontSize: 24.sp, color: Color(0xff2F2F2F)),)
                 ],),
                 SizedBox(height: 54.h,),
                 Stack(
                   children: [
                    Visibility(
                      visible: photo==null,
                      replacement:  CircleAvatar(
                      radius: 60.r,
                      backgroundColor: Color(0xffDADADA),
                      backgroundImage: Image.file(File(photo?.path ?? '')).image,
                      
                     ),
                      child:  CircleAvatar(
                      radius: 60.r,
                      backgroundColor: Color(0xffDADADA),
                      
                     ),),
                     Positioned(
                      left: 95,
                      top: 95,
                      child: InkWell(
                        onTap: () {
                          pickGallery();
                        },
                        child: Container(
                        width: 32.w,
                        height: 32.h,
                        
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Icon(Icons.camera_alt_outlined ,color: AppColors.primaryColor,),
                                             ),
                      ))
                   ],
                 ),
                  SizedBox(height: 54.h,),
                  CustomTextFormFiled(hintText: 'Full Name'),
                  SizedBox(height: 12.h,),
                  CustomTextFormFiled(hintText: 'Phone'),
                  SizedBox(height: 12.h,),
                  CustomTextFormFiled(hintText: 'Address'),
                   SizedBox(height: 200.h,),
                  CustomeBotton(label: 'Update Profile'),
          ],),
        ),
      ),
    );
  }
}