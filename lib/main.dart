import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as inject;

import 'src/app.dart';
import 'src/shared/blocs_app/supervisor_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inject.init();
  BlocOverrides.runZoned(
    () {
      return runApp(const App());
    },
    blocObserver: SupervisorBloc(),
  );
}
