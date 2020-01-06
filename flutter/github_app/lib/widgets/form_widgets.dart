import 'package:flutter/material.dart';

class GithubFormLabel extends StatelessWidget {
  final String labelText;
  final double bottomPadding;

  const GithubFormLabel(this.labelText, {this.bottomPadding = 8});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(labelText,
          style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w700)),
    );
  }
}

class GithubTextFormField extends StatelessWidget {
  final String labelText, hintText;
  final String initialValue;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final bool obscureText;

  const GithubTextFormField(
      {Key key,
      this.labelText,
      this.hintText,
      this.initialValue,
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      this.onSaved,
      this.validator,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Visibility(visible: labelText != null, child: GithubFormLabel(labelText)),
      TextFormField(
          initialValue: initialValue,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(10, 16, 10, 16),
              border: OutlineInputBorder(),
              hintText: hintText,
              errorStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.red, fontSize: 12),
              hintStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.black54)),
          onSaved: onSaved,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
          textCapitalization: obscureText || keyboardType == TextInputType.emailAddress
              ? TextCapitalization.none
              : TextCapitalization.words,
          obscureText: obscureText,
          validator: validator,
          keyboardType: keyboardType,
          textInputAction: textInputAction)
    ]);
  }
}
