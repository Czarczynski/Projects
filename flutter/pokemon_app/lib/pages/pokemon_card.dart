import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon_model.dart';
import 'package:pokemon_app/pages/pokemon_details_page.dart';

class PokemonCard extends StatefulWidget {
  final PokemonModel _pokemon;
  final _index;
  final String _query;

  PokemonCard(this._pokemon, this._index, this._query);

  @override
  _PokemonCardState createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  List<TextSpan> _getQuote(String text, String matchWord) {
    List<TextSpan> spans = [];
    int index = 0;
    if (matchWord == '') {
      spans.add(TextSpan(text: text,style: TextStyle(color: Colors.black)));
      return spans;
    } else {
      while (index < text.length) {
        if (index == text.toLowerCase().indexOf(matchWord.toLowerCase())) {
          spans.add(TextSpan(
              text: text.substring(index, index + matchWord.length),
              style: TextStyle(color: Colors.red)));
          text = text.substring(index + matchWord.length);
          index = 0;
        } else {
          spans.add(TextSpan(text: text[index],style: TextStyle(color: Colors.black)));
          index++;
        }
      }
      return spans;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 16,
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
          color: Color.fromRGBO(250, 250, 250, 1),
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 3))
          ]),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PokemonDetailPage(
                      widget._pokemon.url, widget._pokemon.name)));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                "${widget._index}",
                style: TextStyle(fontSize: 30),
              ),
            ),
            RichText(
                text: TextSpan(
              children: _getQuote(widget._pokemon.name, widget._query),
              style: TextStyle(fontSize: 24),
            )),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
