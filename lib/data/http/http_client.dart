import 'package:http/http.dart' as http;

class HttpService {
  static final pokemonListUrl =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static final pokemonDetailsUrl = 'https://pokeapi.co/api/v2/pokemon/';

  static Future<http.Response> getPokemonListHttp() async {
    http.Response response;

    final url = Uri.parse("$pokemonListUrl");

    try {
      response = await http.get(url);
    } on Exception catch (e) {
      throw e;
    }

    return response;
  }

  static Future<http.Response> getPokemonDetails(int id) async {
    http.Response response;

    final url = Uri.parse("$pokemonDetailsUrl$id");

    try {
      response = await http.get(url);
    } on Exception catch (e) {
      throw e;
    }

    return response;
  }
}
