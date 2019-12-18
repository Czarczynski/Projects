import 'package:smart_cooking/pages/web_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LinkTextSpan extends TextSpan {
  LinkTextSpan(BuildContext context, {TextStyle style, String url, String text})
      : super(
            style: style,
            text: text ?? url,
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WebPage(url))));
}

class RichTextView extends StatelessWidget {
  final String text;

  RichTextView({@required this.text});

  bool _isLink(String input) {
    final matcher = RegExp(
        r"(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)");
    return matcher.hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    var wordsList = text.split('\n');
    List<TextSpan> span = [];
    wordsList.forEach((words) {
      final wordList = words.split(' ');
      wordList.forEach((word) {
        span.add(_isLink(word)
            ? LinkTextSpan(context,
                text: '$word\n',
                url: word,
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .copyWith(color: Colors.blue))
            : TextSpan(
                text: '$word ', style: Theme.of(context).textTheme.body1));
      });

      span.add(TextSpan(
          text: '\n', style: Theme.of(context).textTheme.body1));
    });
    if (span.length > 0) {
      return RichText(
        text: TextSpan(text: '', children: span),
      );
    } else {
      return Text(text);
    }
  }
}
