import 'package:demo_luci_web/src/shared/blocs_app/route_page_cubit/route_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/widgets/menu_bar.dart';
import 'project_manager/project_manager_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80), child: MenuBarWidget()),
      body: BlocBuilder<RoutePageCubit, RoutePageState>(
        builder: (context, state) {
          if (state is RoutePageProjectManagement) {
            return const ProjectManagerScreen();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
