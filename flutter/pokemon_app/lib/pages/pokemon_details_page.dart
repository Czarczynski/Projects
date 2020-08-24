import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/models/pokemon_model.dart';

class PokemonDetailPage extends StatefulWidget {
  final String _url, _name;

  PokemonDetailPage(this._url, this._name);

  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState(_url);
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  SinglePokemonBloc _stream;

  _PokemonDetailPageState(_url) {
    this._stream = SinglePokemonBloc(_url);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _stream.getPokemon,
        builder: (context, snapshot) {
          PokemonModel _pokemon = snapshot.data;
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromRGBO(255, 99, 99, 1),
                title: Text(widget._name),
              ),
              body: SafeArea(
                  child: Container(
                      color: Colors.white,
                      child: !snapshot.hasData
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView(
                              padding: EdgeInsets.all(30),
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Name:",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      _pokemon.name,
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Experience:",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      '${_pokemon.baseExperience}',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Weight:",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      '${_pokemon.weight}',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Height:",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      '${_pokemon.height}',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "Abilities:",
                                            style: TextStyle(fontSize: 25),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    blurRadius: 2,
                                                    spreadRadius: 1)
                                              ],
                                              color: Colors.amberAccent,
                                            ),
                                            height: 200,
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45 -
                                                30,
                                            child: ListView(
                                              padding: EdgeInsets.all(10),
                                              children: _pokemon.abilities
                                                  .map((item) =>
                                                      SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(4.0),
                                                            child: Text(item
                                                                .ability.name,style: TextStyle(fontSize: 15),),
                                                          )))
                                                  .toList(),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Moves:",
                                            style: TextStyle(fontSize: 25),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    blurRadius: 2,
                                                    spreadRadius: 1)
                                              ],
                                              color: Colors.amberAccent,
                                            ),
                                            height: 200,
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45 -
                                                30,
                                            child: ListView(
                                              padding: EdgeInsets.all(10),
                                              children: _pokemon.moves
                                                  .map((item) =>
                                                      SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(4.0),
                                                            child: Text(
                                                                item.move.name,style: TextStyle(fontSize: 15),),
                                                          )))
                                                  .toList(),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "Stats:",
                                            style: TextStyle(fontSize: 25),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(20)),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    blurRadius: 2,
                                                    spreadRadius: 1,offset: Offset(0,4))
                                              ],
                                              color: Colors.greenAccent,
                                            ),
                                            padding: EdgeInsets.only(top: 10),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                60,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  "name",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,fontSize: 20),
                                                ),
                                                Text(
                                                  "value",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,fontSize: 20),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      bottom:
                                                          Radius.circular(20)),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    blurRadius: 2,
                                                    spreadRadius: 1, offset: Offset(0,4))
                                              ],
                                              color: Colors.greenAccent,
                                            ),
                                            height: 300,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                60,
                                            child: ListView(
                                              padding: EdgeInsets.all(50),
                                              children: _pokemon.stats
                                                  .map((item) => Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.all(4.0),
                                                            child: Text(item.stat.name, style: TextStyle(fontSize: 20),),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.all(4.0),
                                                            child: Text(
                                                                '${item.baseStat}', style: TextStyle(fontSize: 20),),
                                                          ),
                                                        ],
                                                      ))
                                                  .toList(),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ))));
        });
  }
}
