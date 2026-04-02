import 'package:bookia_app/core/helper/app_extension.dart';
import 'package:bookia_app/core/helper/validators.dart';
import 'package:bookia_app/core/routing/routes.dart';
import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:bookia_app/core/widgets/custom_arrow_back.dart';
import 'package:bookia_app/core/widgets/custom_text_form_field.dart';
import 'package:bookia_app/core/widgets/custome_botton.dart';
import 'package:bookia_app/features/cart/presentation/widgets/total_row.dart';
import 'package:bookia_app/features/place_order/cubit/cubit/governorate_cubit.dart';
import 'package:bookia_app/features/place_order/cubit/cubit/governorate_state.dart';
import 'package:bookia_app/features/place_order/data/models/governorate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({super.key});
  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  var formKey= GlobalKey<FormState>();
  GovernorateItem? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0.w),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomArrowBack(),
                  SizedBox(height: 30.h),
                  Text('Place Your Order', style: AppTextStyles.text30Regular),
                  SizedBox(height: 10.h),
                  Text(
                    '''Don't worry! It occurs. Please enter the email address linked with your account.''',
                    style: AppTextStyles.text16Regular,
                  ),
                  SizedBox(height: 30.h),
                  CustomTextFormFiled(
                    controller: name,
                    hintText: 'Full Name',
                    validator: ValidatorService.validateName,
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 12.h),
                  CustomTextFormFiled(
                    validator: ValidatorService.validateEmail,
                    controller: email,
                    hintText: 'Email',
                    
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 12.h),
              
                  CustomTextFormFiled(
                    controller: address,
                    hintText: 'Address',
                    keyboardType: TextInputType.streetAddress,
                  ),
                  SizedBox(height: 12.h),
              
                  CustomTextFormFiled(
                    controller: phone,
                    hintText: 'Phone',
                    validator: ValidatorService.validatePhoneNumber,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 12.h),
                  BlocBuilder<GovernorateCubit, GovernorateState>(
                    builder: (context, state) {
                      if (state is GovernorateLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is GovernorateSuccess) {
                         
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColors.gray3,
                            border: Border.all(color: AppColors.gray2),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<GovernorateItem>(
                              value: selectedValue,
                             
                              hint: Text(
                                "Governorate",
                                style: TextStyle(color: Colors.grey),
                              ),
                              icon: Icon(Icons.keyboard_arrow_down),
                              isExpanded: true,
                              items: state.governorate?.map((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item.governorateNameEn),
                                );
                              }).toList(),
                              onChanged: (  value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                            ),
                          ),
                        );
                      } else {
                        return Text('Error');
                      }
                    },
                  ),
                  SizedBox(height: 123.h),
                  TotalRow(totalPrice: 1836.0,),
                  SizedBox(height: 13.h),
                  BlocListener<GovernorateCubit, GovernorateState>(
                    listener: (context, state) {
                    if (state is PlaceOrderLoading) {
                      showDialog(context: context, builder: (context)=> Center(child: CircularProgressIndicator(),));
                    }else if (state is PlaceOrderSuccess){
                      context.pop();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(state.message ?? '')));
                    }
                    },
                    child: CustomeBotton(label: 'Submit Order', onTap: () {
                     if (formKey.currentState?.validate() ?? false) {
                        context.read<GovernorateCubit>().placeOrder(selectedValue!.id, name.text, email.text, phone.text, address.text);
                      context.pushNamed(Routes.congrates);
                     }
                    }),
                  ),
                  SizedBox(height: 29.h),
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
}
