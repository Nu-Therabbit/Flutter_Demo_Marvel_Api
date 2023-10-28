import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/common/route.dart';
import 'package:marvel/cubits/splash_screen_cubit.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: BlocBuilder<SplashScreenCubit, SplashScreenState>(
        bloc: BlocProvider.of<SplashScreenCubit>(context),
        builder: (context, state) {
          if (state is SplashScreenAuthenticated) {
            print("login ${state.isLogin}");
            if (state.isLogin) {
              Future.delayed(Duration.zero, () async {
                Navigator.pushReplacementNamed(context, RouterPage.home);
              });
            } else {
              Future.delayed(Duration.zero, () async {
                Navigator.pushReplacementNamed(context, RouterPage.login);
              });
              //Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/splash'));
            }
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text(
                  "Splash screen",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
