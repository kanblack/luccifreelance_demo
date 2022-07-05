import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../injection_container.dart';
import 'shared/blocs_app/loading_cubit/loading_cubit.dart';
import 'shared/config/routes/route_names.dart';
import 'shared/config/routes/routes.dart';
import 'shared/config/themes/theme_app.dart';
import 'shared/widgets/loading.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  List<BlocProvider> _getProviders() => [
        BlocProvider<LoadingCubit>(
          create: (_) => getIt<LoadingCubit>(),
        ),
        // BlocProvider<AuthenticationBloc>(
        //     create: (_) => getIt<AuthenticationBloc>())
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
          title: 'BalikbayanBox',
          onGenerateRoute: Routes.generateRoute,
          initialRoute: RouteNames.splashScreen,
          theme: getAppTheme(),
          localizationsDelegates: const [
            // S.delegate,
            // GlobalMaterialLocalizations.delegate,
            // GlobalWidgetsLocalizations.delegate,
            // GlobalCupertinoLocalizations.delegate,
          ],
          // supportedLocales: S.delegate.supportedLocales,
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
            minWidth: 480,
            defaultName: DESKTOP,
            breakpoints: [
              const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
              const ResponsiveBreakpoint.resize(600, name: MOBILE),
              const ResponsiveBreakpoint.resize(850, name: TABLET),
              const ResponsiveBreakpoint.resize(1080, name: DESKTOP),
            ],
            background: Container(color: Colors.white),
          ),
        ));
  }
}
