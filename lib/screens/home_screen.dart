import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_group/blocs/backend_bloc/backend_bloc.dart';
import 'package:project_group/blocs/backend_bloc/transfer_event.dart';
import 'package:project_group/blocs/front_cards/card_bloc.dart';

import '../blocs/front_cards/card_state.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int fromCard = 0;

  int toCard = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserSuccessState) {
            print(state.cards.length);
            return Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (v) {
                      fromCard = v;
                      setState(() {});
                    },
                    itemCount: state.cards.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {},
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color(int.parse(
                                      "0xff${state.cards[index].color}"))
                                  .withOpacity(0.9),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        state.cards[index].cardName,
                                        style: const TextStyle(
                                          shadows: [Shadow(blurRadius: 5)],
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        state.cards[index].bankName,
                                        style: const TextStyle(
                                          shadows: [Shadow(blurRadius: 5)],
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: Text(
                                      "${state.cards[index].amount} sum",
                                      style: const TextStyle(
                                        shadows: [Shadow(blurRadius: 15)],
                                        letterSpacing: 1,
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      state.cards[index].cardNumber,
                                      style: const TextStyle(
                                        shadows: [Shadow(blurRadius: 15)],
                                        letterSpacing: 1,
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      state.cards[index].expireDate,
                                      style: const TextStyle(
                                        shadows: [Shadow(blurRadius: 8)],
                                        letterSpacing: 1,
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      state.cards[index].ownerName,
                                      style: const TextStyle(
                                        shadows: [Shadow(blurRadius: 8)],
                                        letterSpacing: 0,
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (v) {
                      toCard = v;
                      setState(() {});
                    },
                    itemCount: state.cards.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {},
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color(int.parse(
                                      "0xff${state.cards[index].color}"))
                                  .withOpacity(0.9),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        state.cards[index].cardName,
                                        style: const TextStyle(
                                          shadows: [Shadow(blurRadius: 5)],
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        state.cards[index].bankName,
                                        style: const TextStyle(
                                          shadows: [Shadow(blurRadius: 5)],
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: Text(
                                      "${state.cards[index].amount} sum",
                                      style: const TextStyle(
                                        shadows: [Shadow(blurRadius: 15)],
                                        letterSpacing: 1,
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      state.cards[index].cardNumber,
                                      style: const TextStyle(
                                        shadows: [Shadow(blurRadius: 15)],
                                        letterSpacing: 1,
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      state.cards[index].expireDate,
                                      style: const TextStyle(
                                        shadows: [Shadow(blurRadius: 8)],
                                        letterSpacing: 1,
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      state.cards[index].ownerName,
                                      style: const TextStyle(
                                        shadows: [Shadow(blurRadius: 8)],
                                        letterSpacing: 0,
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                TextButton(
                    onPressed: () {
                      context.read<TransferBloc>().add(SendMoneyEvent(
                          fromCardModel:
                              state.cards[fromCard].copyWith(amount: 12340),
                          toCardModel:
                              state.cards[toCard].copyWith(amount: 987655)));
                      setState(() {});
                    },
                    child: Text("Send 10000")),
                SizedBox(
                  height: 80,
                ),
              ],
            );
          } else if (state is UserErrorState) {
            return const Center(
              child: Text("xato"),
            );
          } else
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
        },
        listener: (BuildContext context, state) {},
      ),
    );
  }
}
