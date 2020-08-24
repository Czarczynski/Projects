import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/models/pokemon_model.dart';
import 'package:pokemon_app/pages/pokemon_card.dart';

class PokemonSearchPage extends SearchDelegate {
  List<PokemonModel> _pokemonsModel = [];


  PokemonSearchPage(){
    PokemonSearchBloc.getModels().then((_list) => _pokemonsModel = _list);
  }

  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Color.fromRGBO(255, 99, 99, 1));
  }


  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: query != '' ? () {
            query = '';
          } : null,
          icon: Icon(Icons.backspace, color: Colors.white,))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _SearchRecipes(query, _pokemonsModel, context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _SearchRecipes(query, _pokemonsModel, context);
  }
}

// ignore: must_be_immutable
class _SearchRecipes extends StatelessWidget {
  List<PokemonModel> _projectModels = List<PokemonModel>();
  String query = '';
  SearchBloc _searchBloc;

  _SearchRecipes(this.query, this._projectModels, BuildContext context) {
    this._searchBloc = SearchBloc(this._projectModels, context);
  }

  @override
  Widget build(BuildContext context) {
    if (query.trim() == '')
      return Center(
        child: Text("Search",
        ),
      );
    else {
      return StreamBuilder(
        stream: this._searchBloc.getSearchResultsStream(query),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? snapshot.data.length == 0
              ? Center(child: Text("No results"))
              : ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return PokemonCard(snapshot.data[index], index+1, query);
              })
              : snapshot.hasError
              ? throw Exception(snapshot.error)
              : Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }
  }
}
