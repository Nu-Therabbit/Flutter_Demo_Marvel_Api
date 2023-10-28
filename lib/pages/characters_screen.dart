import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/api/model/character/character.dart';
import 'package:marvel/cubits/character_cubit.dart';
import 'package:transparent_image/transparent_image.dart';

class CharactersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Characters"),
      ),
      body: Center(
        child: BlocBuilder<CharacterCubit, CharacterState>(
          bloc: BlocProvider.of<CharacterCubit>(context),
          builder: (context, state) {
            if (state is CharacterLoaded) {
              return ListView.builder(
                itemCount: state.characters.length,
                itemBuilder: (context, index) {
                  Character character = state.characters[index];
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Card(
                          margin: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 8,
                            bottom: 8,
                          ),
                          color: Colors.amberAccent,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: 'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg',
                              ),
                              Text(character.name),
                              Text(character.description),
                            ],
                          )),
                    ],
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
