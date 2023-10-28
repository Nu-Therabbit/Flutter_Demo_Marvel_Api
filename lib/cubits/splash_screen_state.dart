part of 'splash_screen_cubit.dart';

@immutable
abstract class SplashScreenState {}

class SplashScreenInitial extends SplashScreenState {}

class SplashScreenAuthenticated extends SplashScreenState {
  final bool isLogin;
  SplashScreenAuthenticated(this.isLogin);
}
