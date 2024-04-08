import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_group/data/models/card_model.dart';
import 'package:project_group/screens/card/widgets/card_items.dart';
import 'package:project_group/screens/lottie/lottie_screen.dart';
import 'package:project_group/services/local_notification_services.dart';
import 'package:project_group/utils/size/size_utils.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final PageController firstController = PageController();
  final PageController secondController = PageController();
  final TextEditingController amountController = TextEditingController();

  int firstPageIndex = 0;
  int secondPageIndex = 0;

  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1E30),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              "Cards",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.w,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          20.getH(),
          SizedBox(
            height: 230.h,
            child: PageView.builder(
              controller: firstController,
              itemCount: list.length,
              onPageChanged: (index) {
                setState(() {
                  secondPageIndex = index;
                  if (list[secondPageIndex].cardNumber ==
                      list[firstPageIndex].cardNumber) {
                    print("Kartalar bir xil bolib qoldi");
                    isSelected = true;
                  } else if (list[firstPageIndex].amount <
                      double.parse(amountController.text)) {
                    print("Kartada mablag yetarli emas");
                    isSelected = true;
                  } else if (double.parse(amountController.text) < 10000.0) {
                    print("10000 somdan kam mablag kiritildi");
                    isSelected = true;
                  } else {
                    print("Boldi hammasiga togri tushdi");
                    isSelected = false;
                  }
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CardItems(
                      cardModel: list[index],
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: TextField(
              style: TextStyle(
                color: isSelected ? Colors.red : Colors.white,
                fontSize: 20.w,
                fontWeight: FontWeight.w400,
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Amount",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.w,
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.w,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.w,
                  ),
                ),
              ),
            ),
          ),
          35.getH(),
          SizedBox(
            height: 230.h,
            child: PageView.builder(
              controller: secondController,
              itemCount: list.length,
              onPageChanged: (index) {
                setState(() {
                  secondPageIndex = index;
                  if (list[secondPageIndex].cardNumber ==
                      list[firstPageIndex].cardNumber) {
                    print("Kartalar bir xil bolib qoldi");
                    isSelected = true;
                  } else if (list[firstPageIndex].amount <
                      double.parse(amountController.text)) {
                    print("Kartada mablag yetarli emas");
                    isSelected = true;
                  } else if (double.parse(amountController.text) < 10000.0) {
                    print("10000 somdan kam mablag kiritildi");
                    isSelected = true;
                  } else {
                    print("Boldi hammasiga togri tushdi");
                    isSelected = false;
                  }
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CardItems(
                      cardModel: list[index],
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                );
              },
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (isSelected) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "Xatolik yuz berdi :(",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                    amountController.clear();
                  } else {
                    LocalNotificationService.localNotificationService
                        .showNotification(
                      title: "Pul muvaffaqiyatli o'tkazildi",
                      body:
                          "${list[firstPageIndex].cardNumber} karta raqamidan ${list[secondPageIndex].cardNumber} karta raqamiga!",
                      id: DateTime.now().second,
                    );
                    amountController.clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LottieScreen(),
                      ),
                    );
                  }
                },
                child: Text(
                  "O'tkazish",
                  style: TextStyle(
                    color: const Color(0xFFF57FA4),
                    fontSize: 24.w,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          20.getH(),
        ],
      ),
    );
  }
}

List<CardModel> list = [
  CardModel(
    ownerName: "Shohjahon",
    cardName: "UzCard",
    bankName: "Aloqabank",
    amount: 123456,
    cardNumber: "0000 0000 0000 0000",
    color: "321654",
    expireDate: "12/12",
    isMain: true,
  ),
  CardModel(
    ownerName: "Shohjahon",
    cardName: "UzCard",
    bankName: "Aloqabank",
    amount: 123456,
    cardNumber: "1111 1111 1111 1111",
    color: "321654",
    expireDate: "12/12",
    isMain: true,
  ),
  CardModel(
    ownerName: "Shohjahon",
    cardName: "HUMO",
    bankName: "Aloqabank",
    amount: 123456,
    cardNumber: "2222 2222 2222 2222",
    color: "321654",
    expireDate: "12/12",
    isMain: true,
  ),
];
