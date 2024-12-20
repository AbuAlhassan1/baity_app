import 'package:baity_app/common/views/pages_wrapper.dart';
import 'package:baity_app/onboarding/views/onboarding_page_wrapper.dart';
import 'package:baity_app/routing/route_builder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/onboarding',
  // navigatorKey: navigatorKey,
  
  // redirect: (context, state) {
  //   log(state.fullPath.toString());
  //   if( !context.read<AuthCubit>().isLoggedIn && state.fullPath != '/login' ){
  //     return '/login';
  //   } else if ( context.read<AuthCubit>().isLoggedIn && state.fullPath == '/login' ){
  //     return '/';
  //   } else {
  //     return state.fullPath;
  //   }
  // },
  routes: [

    routeBuilder(
      path: '/',
      child: (context, state) => const PagesWrapper(),
    ),
    routeBuilder(
      path: '/login',
      child: (context, state) => const Placeholder(),
    ),
    
    routeBuilder(
      path: '/onboarding',
      child: (context, state) => const OnboardingPageWrapper(),
    ),
    

  ],
  errorPageBuilder: (context, state) => MaterialPage(
    child: Scaffold(
      body: Center(
        child: Text(state.error.toString())
      ),
    )
  ),
);