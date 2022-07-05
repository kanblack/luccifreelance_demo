import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../constants/enums_constants.dart';
import '../../../usecases/usecase.dart';
import '../../loading_cubit/loading_cubit.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      // this.logOut,
      //this.checkAuth,
      this.loadingCubit)
      : super(const AuthenticationState.unauthenticated()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    //on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    //  on<AuthenticationCheckStatusRequested>(_onAuthenticationCheckRequested);
  }
  final LoadingCubit loadingCubit;
  //final LogOut logOut;
  // final CheckAuth checkAuth;
  @override
  Future<void> close() {
    return super.close();
  }

  void _onAuthenticationStatusChanged(
      AuthenticationStatusChanged event, Emitter<AuthenticationState> emit) {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
        return emit(const AuthenticationState.authenticated());
      default:
        return emit(const AuthenticationState.unknown());
    }
  }

  void _onAuthenticationCheckRequested(AuthenticationCheckStatusRequested event,
      Emitter<AuthenticationState> emit) async {
    NoParams noParams = NoParams();
    // final auth = await checkAuth(noParams);
    //  auth.fold((l) {
    //    emit(const AuthenticationState.unauthenticated());
    //  }, (r) {
    //    emit(const AuthenticationState.authenticated());
    //  });
  }

  String getPlatform() {
    if (Platform.isAndroid) {
      return "ANDROID";
    } else if (Platform.isIOS) {
      return "IOS";
    } else {
      return "";
    }
  }
}
