import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_group/screens/add/widgets/textfield_items.dart';
import 'package:project_group/utils/size/size_utils.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ownerController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController expireDateController = TextEditingController();
  final TextEditingController isMainController = TextEditingController();
  final TextEditingController amounytController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF1C1E30),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            60.getH(),
            TextFieldItems(
              controller: nameController,
              type: TextInputType.text,
              hintText: "Card name",
            ),
            TextFieldItems(
              controller: ownerController,
              type: TextInputType.text,
              hintText: "Owner",
            ),
            TextFieldItems(
              controller: bankNameController,
              type: TextInputType.text,
              hintText: "Bank name",
            ),
            TextFieldItems(
              controller: cardNumberController,
              type: TextInputType.number,
              hintText: "Card number",
            ),
            TextFieldItems(
              controller: colorController,
              type: TextInputType.text,
              hintText: "Color",
            ),
            TextFieldItems(
              controller: expireDateController,
              type: TextInputType.number,
              hintText: "Expire date",
            ),
            TextFieldItems(
              controller: isMainController,
              type: TextInputType.text,
              hintText: "Buni qulbola yozasiz",
            ),
            TextFieldItems(
              controller: amounytController,
              type: TextInputType.number,
              hintText: "Amount",
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: 15.h,
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Add card",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            30.getH(),
          ],
        ),
      ),
    );
  }
}
