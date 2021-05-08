import 'dart:io';
import 'package:pokemon_infinite/data/http/http_client.dart';
import 'package:pokemon_infinite/data/models/pokemonDetailsModel.dart';
import 'package:pokemon_infinite/data/models/pokemonListModel.dart';

class PokemonRepository {
  Future<PokemonList> getPokemonListRepo() async {
    try {
      final response = await HttpService.getPokemonListHttp();

      if (response.statusCode == 200) {
        final list = pokemonListFromJson(response.body);
        return list;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    }
  }

  Future<PokemonDetails> getPokemonDetails(int id) async {
    try {
      final response = await HttpService.getPokemonDetails(id);

      if (response.statusCode == 200) {
        final details = pokemonDetailsFromJson(response.body);
        return details;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    }
  }
}
