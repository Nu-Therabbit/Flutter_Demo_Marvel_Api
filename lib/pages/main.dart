import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/common/route.dart';
import 'package:marvel/cubits/character_cubit.dart';
import 'package:marvel/cubits/splash_screen_cubit.dart';
import 'package:marvel/pages/characters_screen.dart';
import 'package:marvel/pages/login_screen.dart';
import 'package:marvel/pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouterPage.splashScreen,
      routes: {
        RouterPage.splashScreen: (context) => BlocProvider(
              create: (context) => SplashScreenCubit()..isLogin(),
              child: SplashScreenPage(),
            ),
        RouterPage.login: (context) => const LoginPage(),
        RouterPage.home: (context) => const MyHomePage(),
        RouterPage.characters: (context) => BlocProvider(
              create: (BuildContext context) =>
                  CharacterCubit()..fetchCharacters(),
              child: CharactersPage(),
            ),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Base Api"),
      ),
      body: Center(
        child: _selectMenuPage(context),
      ),
    );
  }

  Widget _selectMenuPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text("Characters"),
          onPressed: () {
            Navigator.of(context).pushNamed("/characters");
          },
        ),
        ElevatedButton(
          child: Text("New Page"),
          onPressed: () {
            // Navigate to second route when tapped.
          },
        ),
      ],
    );
  }
}
