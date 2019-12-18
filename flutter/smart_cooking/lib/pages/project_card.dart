import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/projects_bloc.dart';
import 'package:smart_cooking/custom-painters/custom_confirm_vote_dialog.dart';
import 'package:smart_cooking/custom-painters/custom_flushbar.dart';
import 'package:smart_cooking/models/project_model.dart';
import 'package:smart_cooking/pages/projects_details_page.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel _projectModel;
  final ProjectBloc _bloc;
  final String query;

  ProjectCard(this._projectModel, this._bloc, this.query);

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  List<TextSpan> _getSpans(String text, String matchWord) {
    List<TextSpan> spans = [];
    int index = 0;
    if (matchWord == '') {
      spans.add(TextSpan(text: text));
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
          spans.add(TextSpan(text: text[index]));
          index++;
        }
      }
      return spans;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProjectsDetailsPage(widget._projectModel, widget._bloc)));
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.display1,
                        children:
                            _getSpans(widget._projectModel.title, widget.query),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            widget._projectModel.paid
                                ? widget._projectModel.paid = false
                                : widget._projectModel.paid = true;
                          });
                        },
                        child: widget._projectModel.completed
                            ? Container()
                            : widget._projectModel.paid
                                ? Icon(Icons.star, size: 30
//                                  width: 48,
//                                  height: 30,
                                    )
                                : Icon(Icons.star_border, size: 30)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 4),
                child: Text('Stopień trudności',
                        style: Theme.of(context).textTheme.display4),
              ),
              Row(
                children: <Widget>[
                  Visibility(
                    visible: !widget._projectModel.completed,
                    child: Expanded(
                      flex: widget._projectModel.amount,
                      child: DecoratedBox(
                        child: SizedBox(
                          height: 4,
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Color(0xFF84C7FF),
                          Color(0xFF3116C2)
                        ])),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: (widget._projectModel.budget -
                            widget._projectModel.amount),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: widget._projectModel.completed
                            ? Theme.of(context).accentColor
                            : Theme.of(context).disabledColor,
                      ),
                      child: SizedBox(
                        height: 4,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
