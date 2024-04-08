import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_group/blocs/backend_bloc/backend_bloc.dart';
import 'package:project_group/screens/home_screen.dart';

import 'blocs/front_cards/card_bloc.dart';
import 'blocs/front_cards/card_event.dart';
import 'data/card_repo/cards_repo.dart';
import 'data/network/api_provider.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ApiProvider apiProvider = ApiProvider();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => UserRepository(
                  apiProvider: apiProvider,
                ))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  UserBloc(currenciesRepo: context.read<UserRepository>())
                    ..add(GetUserInfoEvent())),
          BlocProvider(
              create: (context) =>
                  TransferBloc(currenciesRepo: context.read<UserRepository>())),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: HomeScreen(),
    );
  }
}
