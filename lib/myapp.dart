import 'package:baity_app/common/controllers/l10n/l10n_cubit.dart';
import 'package:baity_app/common/controllers/master_data/master_data_cubit.dart';
import 'package:baity_app/common/controllers/theme/theme_cubit.dart';
import 'package:baity_app/common/controllers/theme/theme_cubit_states.dart';
import 'package:baity_app/constants/themes.dart';
import 'package:baity_app/home/controllers/home/home_cubit.dart';
import 'package:baity_app/realestate/controllers/realestate_details/realestate_details_cubit.dart';
import 'package:baity_app/routing/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => L10nCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => MasterDataCubit()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => RealestateDetailsCubit()),
      ],
      child: const InitRoute()
    );
  }
}


class InitRoute extends StatefulWidget {
  const InitRoute({super.key});

  @override
  State<InitRoute> createState() => _InitRouteState();
}

class _InitRouteState extends State<InitRoute> {

  @override
  void initState() {
    super.initState();
    context.read<MasterDataCubit>().getCategories();
    context.read<MasterDataCubit>().getCities();
    // context.read<AuthCubit>().onAppInit();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Material(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ThemeCubit, ThemeCubitState>(
                  builder: (context, state) => ScreenUtilInit(
                    designSize: const Size(400, 860),
                    minTextAdapt: true,
                    splitScreenMode: true,
                    builder: (context, child) => OKToast(
                      child: MaterialApp.router(
                        backButtonDispatcher: null,
                        scrollBehavior: MyCustomScrollBehavior(),
                        scaffoldMessengerKey: scaffoldKey,
                        theme: state == DarkTheme() ? Themes.darkTheme : Themes.lightTheme,
                        localizationsDelegates: context.localizationDelegates,
                        supportedLocales: context.supportedLocales,
                        locale: context.locale,
                        routerConfig: router,
                        debugShowCheckedModeBanner: false,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

class MyCustomScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics(); // Your custom ScrollPhysics
  }

  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child; // Removes the default overscroll glow (optional)
  }
}