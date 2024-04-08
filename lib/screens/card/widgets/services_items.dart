import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_group/utils/size/size_utils.dart';

class ServicesItems extends StatelessWidget {
  const ServicesItems(
      {super.key,
      required this.icon,
      required this.title,
      required this.isSelected,
      required this.onTap});

  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
          onPressed: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 19.h,
              horizontal: 20.w,
            ),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : const Color(0xFF272B40),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: isSelected
                      ? const Color(0xFFF57FA4)
                      : const Color(0xFF60708F),
                  size: 25.sp,
                ),
                18.getH(),
                Text(
                  textAlign: TextAlign.center,
                  title,
                  style: TextStyle(
                    color: isSelected
                        ? const Color(0xFFF57FA4)
                        : const Color(0xFF60708F),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
        19.getW(),
      ],
    );
  }
}
