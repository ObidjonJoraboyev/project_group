import 'package:flutter/material.dart';
import 'package:project_group/data/models/card_model.dart';
import 'package:project_group/screens/card/widgets/card_items.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          60.getH(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              "Cards",
              style: TextStyle(
                color: Colors.black,
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
              itemCount: 2,
              onPageChanged: (index) {
                setState(() {
                  firstPageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CardItems(
                      cardModel: CardModel(
                        ownerName: "Shohjahon Murodov",
                        cardName: "HUMO",
                        bankName: "Transbank",
                        amount: 123456789,
                        cardNumber: "8600 0000 0000 0000",
                        color: "321654",
                        expireDate: "12/25",
                        isMain: true,
                      ),
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
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Amount",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.w,
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.w,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.black,
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
              itemCount: 2,
              onPageChanged: (index) {
                setState(() {
                  secondPageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CardItems(
                      cardModel: CardModel(
                        ownerName: "Shohjahon Murodov",
                        cardName: "HUMO",
                        bankName: "Transbank",
                        amount: 123456789,
                        cardNumber: "8600 0000 0000 0000",
                        color: "321654",
                        expireDate: "12/25",
                        isMain: true,
                      ),
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
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  amountController.clear();
                },
                child: Text(
                  "O'tkazish",
                  style: TextStyle(
                    color: Colors.white,
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
