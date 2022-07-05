import 'package:demo_luci_web/src/shared/blocs_app/route_page_cubit/route_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../generated/l10n.dart';
import '../injection_container.dart';
import 'shared/blocs_app/loading_cubit/loading_cubit.dart';
import 'shared/config/routes/route_names.dart';
import 'shared/config/routes/routes.dart';
import 'shared/config/themes/theme_app.dart';
import 'shared/constants/app_constants.dart';
import 'shared/widgets/loading.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  List<BlocProvider> _getProviders() => [
        BlocProvider<LoadingCubit>(
          create: (_) => getIt<LoadingCubit>(),
        ),
        BlocProvider<RoutePageCubit>(
          create: (_) => getIt<RoutePageCubit>(),
        ),
      ];

  List<BlocListener> _getBlocListener(context) => [];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return MultiBlocProvider(
        providers: _getProviders(),
        child: MaterialApp(
          navigatorKey: Routes.instance.navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Luci demo',
          onGenerateRoute: Routes.generateRoute,
          initialRoute: RouteNames.mainScreen,
          theme: getAppTheme(),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          builder: (context, widget) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(
                context,
                LoadingApp(
                  child: GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Scaffold(
                      // appBar: const PreferredSize(
                      //     preferredSize: Size(double.infinity, 66),
                      //     child: widget!),
                      body: widget,
                    ),
                  ),
                )),
            defaultScale: true,
            minWidth: AppScreenResponsive.minWidth,
            defaultName: MOBILE,
            breakpoints: [
              const ResponsiveBreakpoint.autoScale(
                  AppScreenResponsive.autoScaleMobile,
                  name: MOBILE),
              const ResponsiveBreakpoint.resize(
                  AppScreenResponsive.resizeMobile,
                  name: MOBILE),
              const ResponsiveBreakpoint.resize(
                  AppScreenResponsive.resizeTablet,
                  name: TABLET),
              const ResponsiveBreakpoint.resize(
                  AppScreenResponsive.resizeDesktop,
                  name: DESKTOP),
            ],
            background: Container(color: Colors.white),
          ),
        ));
  }
}
