import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_group/data/models/card_model.dart';
import 'package:project_group/utils/images/app_images.dart';
import 'package:project_group/utils/size/size_utils.dart';

class CardItems extends StatelessWidget {
  const CardItems({super.key, required this.cardModel, required this.check});

  final CardModel cardModel;

  final bool check;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25.w),
          padding: EdgeInsets.symmetric(
            vertical: 29.h,
            horizontal: 29.w,
          ),
          decoration: BoxDecoration(
            color: Color(int.parse("0xff${cardModel.color}3")),
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
                      shadows: const [Shadow(blurRadius: 4)],
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
                "${cardModel.amount} UZS",
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
        ),
        check
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: 25.w),
                padding: EdgeInsets.symmetric(
                  vertical: 29.h,
                  horizontal: 29.w,
                ),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.6),
                    borderRadius: BorderRadius.circular(30.r)),
                width: double.infinity,
                height: double.infinity,
              )
            : SizedBox()
      ],
    );
  }
}
