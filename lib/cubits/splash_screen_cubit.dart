import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenInitial());

  Future<bool> _checkIfAuthenticated() async {
    await Future.delayed(Duration(seconds: 3));
    return true;
  }

  isLogin() async {
    final isLogin = await _checkIfAuthenticated();
    emit(SplashScreenAuthenticated(isLogin));
  }
}
