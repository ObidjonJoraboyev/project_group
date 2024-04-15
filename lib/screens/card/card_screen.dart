import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_group/blocs/front_cards/card_bloc.dart';
import 'package:project_group/blocs/front_cards/card_state.dart';
import 'package:project_group/screens/card/widgets/card_items.dart';
import 'package:project_group/screens/card/widgets/services_items.dart';
import 'package:project_group/utils/images/app_images.dart';
import 'package:project_group/utils/size/size_utils.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int activeIndex = 0;

  int activeFirstPage = -1;
  int activeSecondPage = -1;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF1C1E30),
      body: BlocConsumer<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserSuccessState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  activeIndex != 1 ? 72.getH() : 25.getH(),
                  activeIndex != 1
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          child: Row(
                            children: [
                              Container(
                                width: 51.w,
                                height: 51.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.w,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Image.asset(
                                    AppImages.avatar,
                                    width: 51.w,
                                    height: 51.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              16.getW(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Goog evening",
                                    style: TextStyle(
                                      color: const Color(0xFF60708F),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  4.getH(),
                                  Text(
                                    "Neha Kapoor",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notification_add,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  30.getH(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Text(
                      "Services",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  17.getH(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        25.getW(),
                        ...List.generate(
                          titles.length,
                          (index) => ServicesItems(
                            icon: icons[index],
                            title: titles[index],
                            isSelected: activeIndex == index,
                            onTap: () {
                              setState(() {
                                activeIndex = index;
                              });
                            },
                          ),
                        ),
                        6.getW(),
                      ],
                    ),
                  ),
                  40.getH(),
                  SizedBox(
                    height: 215.h,
                    child: PageView(
                      onPageChanged: (v) {
                        activeFirstPage = v;
                        setState(() {});
                      },
                      children: [
                        ...List.generate(
                          state.cards.length,
                          (index) => CardItems(
                            check: false,
                            cardModel: state.cards[index],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  activeIndex == 1
                      ? Column(
                          children: [
                            SizedBox(
                              height: 215.h,
                              child: PageView(
                                onPageChanged: (v) {
                                  activeSecondPage = v;
                                  setState(() {});
                                },
                                children: [
                                  ...List.generate(
                                    state.cards.length,
                                    (index) => CardItems(
                                      check:
                                          activeFirstPage == activeSecondPage,
                                      cardModel: state.cards[index],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32),
                              child: TextField(
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(

                                    contentPadding:
                                        const EdgeInsets.symmetric(horizontal: 12),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFF272B40)
                                      ),
                                        borderRadius:
                                            BorderRadius.circular(12))),
                              ),
                            ),
                            TextButton(
                                onPressed: () {}, child: const Text("Submit")),
                            30.getH()
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            );
          } else if (state is UserErrorState) {
            return const Center(
              child: Text("xato"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        listener: (BuildContext context, state) {},
      ),
    );
  }
}

List<IconData> icons = [
  Icons.document_scanner,
  Icons.send,
  Icons.send,
  Icons.wallet,
];
List<String> titles = [
  "Scan %\nPay",
  "Send\nMoney",
  "Receive\nMoney",
  "Go to\nWallet",
];

class SizedBoxForStateLess extends StatelessWidget {
  const SizedBoxForStateLess({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
