import 'package:pokemon_infinite/data/models/pokemonListModel.dart';
import 'package:pokemon_infinite/data/repositories/pokemonRepository.dart';
import 'package:pokemon_infinite/logic/cubit/homeScreenStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//todo create no internet check

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  final PokemonRepository _repository;
  HomeScreenCubit(this._repository) : super(SplashScreenState());

  Future getPokemonList() async {
    emit(SplashScreenState());

    final pokemons = await _repository.getPokemonListRepo();

    try {
      if (pokemons == null) {
        emit(NoDataState('error'));
      } else {
        print(pokemons.toString());
        emit(PokemonListLoadedState(pokemonListings: pokemons.pokemon));
      }
    } on Exception catch (e) {
      print(e);
      emit(NoInternetState('Cannot connect'));
    }
  }
}
