import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon_model.dart';
//import 'package:sowa_marketing_taks/pages/pokemons_list.dart';

class PokemonsBloc {
  List<PokemonModel> _models = [];
  // ignore: close_sinks
  final StreamController<List<PokemonModel>> _controller =
      StreamController<List<PokemonModel>>.broadcast();

  Stream<List<PokemonModel>> get getPokemonList => _controller.stream;
  final Dio _dioClient = new Dio();
  static String _next = "https://pokeapi.co/api/v2/pokemon?limit=10&offset=0";

  PokemonsBloc() {
    _getSet().listen((v) {
      _controller.sink.add(v);
      _models.addAll(v);
    });
  }

  void getAnotherSet() {
    _getSet().listen((v) {
      _controller.sink.add(_models + v);
      _models.addAll(v);
    });
  }

  Stream<List<PokemonModel>> _getSet() {
    return Future.value(_httpRequest()).asStream();
  }

  Future<List<PokemonModel>> _httpRequest() async {
    try {
      final response = await _dioClient.get(_next);
      if (response.statusCode == 200) {
        PokemonListModel _parsed = PokemonListModel.fromJson(response.data);
        _next = _parsed.next;
        return _parsed.results;
      } else
        throw Exception(response.data);
    } catch (e) {
      throw e;
    }
  }
}

class SinglePokemonBloc {
  // ignore: close_sinks
  final StreamController<PokemonModel> _controller =
      StreamController<PokemonModel>.broadcast();

  Stream<PokemonModel> get getPokemon => _controller.stream;
  final Dio _dioClient = new Dio();
  final _url;

  SinglePokemonBloc(this._url) {
    _getPokemon().listen((v) {
      _controller.sink.add(v);
    });
  }

  Stream<PokemonModel> _getPokemon() {
    return Future.value(_httpRequest()).asStream();
  }

  Future<PokemonModel> _httpRequest() async {
    try {
      final response = await _dioClient.get(_url);
      if (response.statusCode == 200) {
        return PokemonModel.fromJson(response.data);
      } else
        throw Exception(response.data);
    } catch (e) {
      throw e;
    }
  }
}

class PokemonSearchBloc {


  static Future<List<PokemonModel>> getModels() async {
    try {
      final response = await Dio().get("https://pokeapi.co/api/v2/pokemon?limit=964");
      if (response.statusCode == 200) {
        return PokemonListModel.fromJson(response.data).results;
      } else
        throw Exception(response.data);
    } catch (e) {
      throw e;
    }
  }
}

class SearchBloc {
  final List<PokemonModel> _pokemonsModel;
  final BuildContext context;

  SearchBloc(this._pokemonsModel, this.context);

  List<PokemonModel> searchModels(String query) {
    try {
      return _pokemonsModel.where((_item) {
        if (_item.name.toLowerCase().contains(query.toLowerCase()))
          return true;
        else
          return false;
      }).toList();
    } catch (error) {
      throw error;
    }
  }

  Stream<List<PokemonModel>> getSearchResultsStream(String query) {
    return Future.value(searchModels(query)).catchError((_) {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Internet problem'),
          action: SnackBarAction(label: 'dismiss', onPressed: () {})));
    }).asStream();
  }
}
