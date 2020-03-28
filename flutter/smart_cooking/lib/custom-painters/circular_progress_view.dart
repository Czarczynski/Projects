import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/custom-painters/circular_progress_painter.dart';
import 'package:flutter/material.dart';

class CircularProgressWidget extends StatefulWidget {
  final int _amount, _budget;
  final bool _paid, _completed;

  CircularProgressWidget(this._amount, this._budget, this._paid, this._completed);

  @override
  _CircularProgressWidgetState createState() => _CircularProgressWidgetState();
}

class _CircularProgressWidgetState extends State<CircularProgressWidget>
    with TickerProviderStateMixin {
  AnimationController _progressController;
  Animation _animation;

  get _initAnimationEnd => widget._amount / widget._budget * 100;

  @override
  void didUpdateWidget(CircularProgressWidget oldWidget) {
    drawNewCircle(
        (widget._amount - 40) / widget._budget * 100, _initAnimationEnd, 0);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    drawNewCircle(0, _initAnimationEnd, 200);
  }

  drawNewCircle(double begin, double end, int delayduration) {
    _progressController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation =
        Tween<double>(begin: begin, end: end).animate(_progressController)
          ..addListener(() {
            setState(() {});
          });
    Future.delayed(Duration(milliseconds: delayduration),
        () => _progressController.forward());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 60),
      child: Center(
        child: CustomPaint(
          foregroundPainter: CircularProgress(_animation.value, widget._completed),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: ThemeConfig.SOLITUDE, width: 30),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color.fromRGBO(0, 137, 255, 0.15),
                      offset: Offset(0, 2),
                      blurRadius: 30)
                ]),
            width: MediaQuery.of(context).size.height * 0.3,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Text(EngStrings.COLLECTED,
//                      style: Theme.of(context)
//                          .textTheme
//                          .display1
//                          .copyWith(color: ThemeConfig.ST_TROPAZ)),
//                  Text(
//                      "${widget._amount.toInt()}/${widget._budget.toInt()} ${EngStrings.PLN}",
//                      style: Theme.of(context).textTheme.subhead),
//
//                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
