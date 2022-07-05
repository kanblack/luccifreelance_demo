import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../injection_container.dart';
import '../../blocs_app/loading_cubit/loading_cubit.dart';
import '../../utils/log_utils.dart';

class Routes {
  final LoadingCubit loadingCubit;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory Routes() => _instance;

  Routes._internal(this.loadingCubit);

  static final Routes _instance = Routes._internal(getIt<LoadingCubit>());

  static Routes get instance => _instance;

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) async {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateAndRemove(String routeName,
      {String? routeStopName, dynamic arguments}) async {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      routeStopName == null
          ? (Route<dynamic> route) => false
          : ModalRoute.withName(routeStopName),
      arguments: arguments,
    );
  }

  Future<dynamic> navigateAndReplace(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateAndReplaceName(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  dynamic pop({dynamic result}) {
    loadingCubit.hideLoading();
    return navigatorKey.currentState?.pop(result);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    LOG.info('Route name: ${settings.name}');
    switch (settings.name) {
      default:
        return _emptyRoute(settings);
    }
  }

  static PageTransition _pageRoute({
    PageTransitionType? transition,
    RouteSettings? setting,
    required Widget page,
  }) =>
      PageTransition(
        child: page,
        type: transition ?? PageTransitionType.rightToLeft,
        settings:
            RouteSettings(arguments: setting?.arguments, name: setting?.name),
      );

  static MaterialPageRoute _emptyRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Center(
              child: Text(
                'Back',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        body: Center(
          child: Text('No path for ${settings.name}'),
        ),
      ),
    );
  }
}
