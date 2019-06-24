import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:sky_engine/_http/http.dart' as http;
import './myfuncs.dart';

class formTester extends StatefulWidget {
  @override
  formTesterState createState() {
    return formTesterState();
  }
}

class formTesterState extends State<formTester> {
  final _formKey = GlobalKey<FormState>();
  final loginField = TextEditingController();
  final passwordField = TextEditingController();
  final nameField = TextEditingController();
  final surnameField = TextEditingController();
  final peselField = TextEditingController();
  // final peselField = TextEditingController();
  @override
  void dispose() {
    loginField.dispose();
    passwordField.dispose();
    nameField.dispose();
    surnameField.dispose();
    peselField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Registration',
                textAlign: TextAlign.right, style: TextStyle(fontSize: 35)),
            TextFormField(
              controller: loginField,
              decoration: InputDecoration(hintText: 'Enter a login'),
              // keyboardType: TextInputType.numberWithOptions(),
              validator: (login) {
                if (login.length <= 2) {
                  return 'Login is not long enough';
                }
              },
            ),
            TextFormField(
              controller: passwordField,
              obscureText: true,
              decoration: InputDecoration(hintText: 'Enter a password'),
              validator: (password) {
                if (password.length < 8 || password.length > 20)
                  return "Password's length is not between 8 and 20";
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Confirm password'),
              validator: (password2) {
                if (password2 != passwordField.text)
                  return "Passwords are different";
              },
            ),
            TextFormField(
              controller: nameField,
              obscureText: false,
              decoration: InputDecoration(hintText: 'Enter a name'),
              validator: (name) {
                if (name.length < 2 || !Is_letter(name))
                  return "Name is not long enough or not contains only letters";
              },
            ),
            TextFormField(
              controller: surnameField,
              obscureText: false,
              decoration: InputDecoration(hintText: 'Enter a surname'),
              validator: (surname) {
                if (surname.length < 2 || !Is_letter(surname))
                  return "Surame is not long enough or not contains only letters";
              },
            ),
            TextFormField(
              keyboardType: TextInputType.numberWithOptions(),
              controller: peselField,
              obscureText: false,
              maxLength: 11,
              decoration: InputDecoration(hintText: 'Enter a pesel'),
              validator: (pesel) {
                if (pesel.length != 11 || !Is_numeric(pesel))
                  return "Pesel is not numeric or length is not equal 11";
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    // Scaffold.of(context).showSnackBar(
                    //     SnackBar(content: Text('Data Processing')));
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: Text('Your data'),
                              content: Row(children: <Widget>[
                                Column(children: <Widget>[
                                  Text('Login: \nName: \nSurname: \nPesel: ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.deepOrangeAccent)),
                                  RaisedButton(
                                      onPressed: () {}, child: Text('Confirm'))
                                ]),
                                Column(children: <Widget>[
                                  Text(
                                      loginField.text +
                                          '\n' +
                                          nameField.text +
                                          '\n' +
                                          surnameField.text +
                                          '\n' +
                                          peselField.text,
                                      style: TextStyle(fontSize: 20))
                                ])
                              ]));
                        });
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
