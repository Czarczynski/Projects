import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/pages/pokemon_card.dart';

class PokemonsList extends StatefulWidget {
  @override
  _PokemonsListState createState() => _PokemonsListState();
}

class _PokemonsListState extends State<PokemonsList> {
  PokemonsBloc _stream;

  _PokemonsListState() {
    this._stream = PokemonsBloc();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _stream.getPokemonList,
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? snapshot.hasError
                  ? throw Exception(snapshot.error)
                  : Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data.length + 1,
                  itemBuilder: (BuildContext context, int index) {

                    if (index == snapshot.data.length ) {
                      if(snapshot.data.length >964)
                        return null;
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 30),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(40),
                          onTap: () {

                            _stream.getAnotherSet();
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromRGBO(255, 99, 99, 1),
                              ),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Text(
                                'Load more',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              )),
                        ),
                      );
                    }
                    return PokemonCard(snapshot.data[index], index + 1,"");
                  });
        });
  }
}
