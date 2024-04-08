import 'package:flutter/material.dart';
import 'package:project_group/screens/card/card_screen.dart';
import 'package:project_group/screens/transfer/transfer_screen.dart';
import 'package:project_group/views/tab_view/tab_view_model.dart';
import 'package:provider/provider.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  List<Widget> screens = [
    const CardScreen(),
    const TransferScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[context.watch<TabViewModel>().getIndex],
      bottomNavigationBar: BottomNavigationBar(
        // selectedLabelStyle: const TextStyle(
        //   color: AppColors.c_0001FC,
        // ),
        // unselectedLabelStyle: const TextStyle(
        //   color: AppColors.c_0A1034,
        // ),
        currentIndex: context.watch<TabViewModel>().getIndex,
        onTap: (newIndex) {
          context.read<TabViewModel>().changeIndex(newIndex);
        },
        backgroundColor: const Color(0xFF1C1E30),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.card_membership),
              label: "",
              activeIcon: Icon(Icons.card_membership)),
          BottomNavigationBarItem(
            icon: Icon(Icons.transfer_within_a_station),
            label: "",
            activeIcon: Icon(Icons.transfer_within_a_station),
          ),
        ],
      ),
    );
  }
}
