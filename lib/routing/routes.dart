import 'package:baity_app/home/views/home_page_wrapper.dart';
import 'package:baity_app/realestate/views/realestate_page_wrapper.dart';
import 'package:baity_app/routing/route_builder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
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
      child: (context, state) => const HomePageWrapper(),
    ),

    routeBuilder(
      path: '/details/:id',
      child: (context, state) {
        return RealestatePageWrapper(id: state.pathParameters['id'].toString());
      },
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