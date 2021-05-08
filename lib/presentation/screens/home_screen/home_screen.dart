import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_infinite/logic/cubit/homeScreenCubit.dart';
import 'package:pokemon_infinite/logic/cubit/homeScreenStates.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<HomeScreenCubit, HomeScreenStates>(
          builder: (context, state) {
        if (state is SplashScreenState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PokemonListLoadedState) {
          return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: state.pokemonListings.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/details',
                    arguments: state.pokemonListings[index].id),
                child: Card(
                  child: GridTile(
                    child: Column(
                      children: [
                        Image.network(state.pokemonListings[index].imageUrl),
                        Row(
                          children: [
                            for (var i in state.pokemonListings[index].type)
                              Text(
                                i.toString(),
                              ),
                            //Text(state.pokemonListings[index].type[0].toString()),
                          ],
                        ),
                        Text(state.pokemonListings[index].name)
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
