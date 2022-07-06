import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs_app/loading_cubit/loading_cubit.dart';
import '../constants/colors_constants.dart';

class LoadingSimpleApp extends StatelessWidget {
  final Widget? child;

  const LoadingSimpleApp({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child!,
        BlocBuilder<LoadingCubit, LoadingState>(
          bloc: context.read<LoadingCubit>(),
          builder: (context, state) {
            return Visibility(
              visible: state.loading!,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withOpacity(0.3),
                child: Center(
                  child: Container(
                    width: 72,
                    height: 72,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

class LoadingApp extends StatefulWidget {
  final Widget child;

  const LoadingApp({Key? key, required this.child}) : super(key: key);

  @override
  _LoadingAppState createState() => _LoadingAppState();
}

class _LoadingAppState extends State<LoadingApp> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        BlocBuilder<LoadingCubit, LoadingState>(
          bloc: context.read<LoadingCubit>(),
          builder: (context, state) {
            return Visibility(
              visible: state.loading!,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withOpacity(0.3),
                child: Center(
                  child: RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0)
                        .animate(_animationController),
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
