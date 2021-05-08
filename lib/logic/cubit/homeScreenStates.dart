import 'package:flutter/cupertino.dart';
import 'package:pokemon_infinite/data/models/pokemonListModel.dart';

abstract class HomeScreenStates {}

class SplashScreenState extends HomeScreenStates {
} //this is also the loading state

class PokemonListLoadedState extends HomeScreenStates {
  final List<Pokemon> pokemonListings;

  PokemonListLoadedState({@required this.pokemonListings});
}

class NoInternetState extends HomeScreenStates {
  final message;

  NoInternetState(this.message);
}

class NoDataState extends HomeScreenStates {
  final message;

  NoDataState(this.message);
}
