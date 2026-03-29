import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalRow extends StatelessWidget {
  final double totalPrice;
  const TotalRow({
    super.key, required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total:',
            style: AppTextStyles.text20Regular.copyWith(
              fontWeight: FontWeight.w700,
              color: Color(0xff808080),
            ),
          ),
    
          Text(
            '''\$ $totalPrice''',
            style: AppTextStyles.text20Regular.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}