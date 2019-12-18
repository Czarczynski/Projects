import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/guidebook_bloc.dart';
import 'package:smart_cooking/models/guidebook_model.dart';
import 'package:smart_cooking/pages/DrawerPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GuideBook2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeConfig.WHITE_SMOKE,
        drawer: DrawerPage(CurrentDrawerPage.DEVICES),
        appBar: AppBar(
          brightness: Brightness.light,
          title: Row(
//              height: 26,
              children: <Widget>[
                Text(EngStrings.GUIDEBOOK2,
                    style: Theme.of(context).textTheme.title),
                Text(" Smart Cooking",
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(color: ThemeConfig.PURPLE_)),
              ]),
        ),
        body: ChangeNotifierProvider<GuidebookBloc>(
            builder: (context) => GuidebookBloc(), child: _GuideBook2State()));
  }
}

class _GuideBook2State extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GuidebookBloc>(builder: (context, GuidebookBloc bloc, _) {
      if (bloc.isInProgress) return Center(child: CircularProgressIndicator());
      List<GuideBookModel> _gudiebookList = bloc.post.where((_item) =>
        _item.owning).toList();
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
            itemCount: _gudiebookList.length,
            itemBuilder: (context, int index) {
              var _itemGuidebook = _gudiebookList[index];
              return GestureDetector(
                onTap: () => bloc.changeVisibility(_itemGuidebook),
                child: Card(
                  margin:
                      const EdgeInsets.only(bottom: 12, left: 16, right: 16),
                  elevation: 0.4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Text(
                                "${_itemGuidebook.id}. ${_itemGuidebook.name}",
                                style: _itemGuidebook.visibility
                                    ? Theme.of(context)
                                        .textTheme
                                        .display1
                                        .copyWith(color: ThemeConfig.PURPLE_)
                                    : Theme.of(context).textTheme.display1),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(right: 24.0),
                              child: Row(
                                children: <Widget>[
                                  Text("Status: "),
                                  _itemGuidebook.status
                                      ? Icon(Icons.signal_wifi_4_bar,
                                          color: Colors.green)
                                      : Icon(Icons.signal_wifi_off,
                                          color: Colors.red),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Icon(
                                      _itemGuidebook.visibility
                                          ? Icons.remove
                                          : Icons.add,
                                      color: Color.fromRGBO(36, 43, 52, 1),
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                    Container(
                      child: Stack(children: <Widget>[
                        Container(),
                        AnimatedOpacity(
                          duration: Duration(milliseconds: 650),
                          opacity: _itemGuidebook.visibility ? 1.0 : 0.0,
                          child: Container(
                            height: _itemGuidebook.visibility ? null : 0,
                            child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 24, right: 24),
                                child: Column(
                                  children: <Widget>[
                                    Image(
                                        image:
                                            AssetImage(_itemGuidebook.photo)),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Text(
                                                  "${_itemGuidebook.description}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .display1
                                                      .copyWith(
                                                          color: ThemeConfig
                                                              .BLUE_GRAY)))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 10),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: InkWell(
                                          onTap: () =>
                                              bloc.changeState(_itemGuidebook),
                                          child: _itemGuidebook.status
                                              ? Text(
                                                  "Rozłącz",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .display1
                                                      .copyWith(
                                                          color: ThemeConfig
                                                              .RED_NEAR_VENETIAN),
                                                )
                                              : Text(
                                                  "Połącz",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .display1
                                                      .copyWith(
                                                          color: Colors.green),
                                                ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        )
                      ]),
                    )
                  ]),
                ),
              );
            }),
      );
    });
  }
}
