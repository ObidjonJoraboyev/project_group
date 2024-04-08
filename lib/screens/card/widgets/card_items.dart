import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:project_group/data/models/card_model.dart';
import 'package:project_group/utils/images/app_images.dart';
import 'package:project_group/utils/size/size_utils.dart';

class CardItems extends StatelessWidget {
  const CardItems({super.key, required this.cardModel, required this.onTap});

  final CardModel cardModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      padding: EdgeInsets.symmetric(
        vertical: 29.h,
        horizontal: 29.w,
      ),
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                cardModel.cardName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(AppImages.mastercard),
            ],
          ),
          Text(
            NumberFormat.currency(locale: "uz").format(cardModel.amount),
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          50.getH(),
          Row(
            children: [
              Text(
                cardModel.cardNumber,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                cardModel.expireDate,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
