import 'package:enfluwence/pages/auth/screen/auth.dart';
import 'package:enfluwence/pages/auth/screen/preview/page_preview.dart';
import 'package:enfluwence/routes/route_consts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ARouter {
  // static GoRouter returnRouter(bool isAuth) {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: ARouteConstants.homePage,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: APagePreview());
        },
      ),
      GoRoute(
        name: ARouteConstants.authRouteName,
        path: '/auth',
        pageBuilder: (context, state) {
          return const MaterialPage(child: AuthScreen());
        },
      ),
      // GoRoute(
      //   name: ARouteConstants.profileRouteName,
      //   path: '/profile/:username/:userid',
      //   pageBuilder: (context, state) {
      //     return MaterialPage(
      //         child: Profile(
      //       userid: state.params['userid']!,
      //       username: state.params['username']!,
      //     ));
      //   },
      // ),
      // GoRoute(
      //   name: ARouteConstants.aboutRouteName,
      //   path: '/about',
      //   pageBuilder: (context, state) {
      //     return MaterialPage(child: About());
      //   },
      // ),
      // GoRoute(
      //   name: ARouteConstants.contactUsRouteName,
      //   path: '/contact_us',
      //   pageBuilder: (context, state) {
      //     return MaterialPage(child: ContactUS());
      //   },
      // )
    ],
    // errorPageBuilder: (context, state) {
    //   return const MaterialPage(child: Text("Error opening this page"));
    // },
    // redirect: (context, state) {
    //   if (!isAuth &&
    //       state.location.startsWith('/${ARouteConstants.profileRouteName}')) {
    //     return context.namedLocation(ARouteConstants.contactUsRouteName);
    //   } else {
    //     return null;
    //   }
    // },
  );
  // return router;
  // }
}
