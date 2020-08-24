import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/pages/pokemon_search_page.dart';
import 'package:pokemon_app/pages/pokemons_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Pokemons",),
          backgroundColor: Color.fromRGBO(255, 99, 99, 1),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: InkWell(
                onTap: () {
                showSearch(context: context, delegate: PokemonSearchPage());
                },
                child: Icon(Icons.search),
              ),
            )
          ]
      ),
      body: Center(
        child: Container(color: Colors.black12, child: PokemonsList())
      )
    );
  }
}
