import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_group/blocs/backend_bloc/backend_bloc.dart';
import 'package:project_group/screens/tab/tab_box_screen.dart';
import 'package:project_group/services/local_notification_services.dart';
import 'package:project_group/views/tab_view/tab_view_model.dart';
import 'package:provider/provider.dart';
import 'blocs/front_cards/card_bloc.dart';
import 'blocs/front_cards/card_event.dart';
import 'data/card_repo/cards_repo.dart';
import 'data/network/api_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureLocalTimeZone();
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    ApiProvider apiProvider = ApiProvider();

    LocalNotificationService.localNotificationService.init(navigatorKey);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepository(
            apiProvider: apiProvider,
          ),
        ),
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
          ChangeNotifierProvider(create: (_) => TabViewModel()),
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
      child: const TabBoxScreen(),
    );
  }
}
