import 'dart:async';

import 'package:github_app/api/error/errors.dart';
import 'package:github_app/base/base_bloc.dart';
import 'package:github_app/common/utils.dart';
import 'package:github_app/pages/login/login_bloc.dart';
import 'package:github_app/pages/repositories/repositories_page.dart';
import 'package:github_app/widgets/form_widgets.dart';
import 'package:flutter/material.dart';

final _loginFormKey = GlobalKey<FormState>();

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _LoginPageWidget(),
    );
  }
}

class _LoginPageWidget extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BaseWidgetState<_LoginPageWidget, LoginBloc> {
  LoginParams currentLoginParams;

  StreamSubscription streamSubscription;

  @override
  LoginBloc createBloc() => LoginBloc();

  @override
  void initState() {
    super.initState();
    currentLoginParams = LoginParams();

    streamSubscription = bloc.loginObservable.listen((response) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => RepositoriesPage()), (_) => false);
    }, onError: (error) {
      if (error is UnauthorizedError) {
        GithubUtils.showErrorSnackbar(context, "Incorrect username or password.");
      } else {
        GithubUtils.showErrorSnackbar(context, error);
      }
    });
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(42),
                child: Image.asset("assets/images/github_logo.png", height: 80),
              ),
              GithubTextFormField(
                labelText: "Email",
                hintText: "name@example.com",
                keyboardType: TextInputType.emailAddress,
                validator: _defaultValidator,
                onSaved: (value) => currentLoginParams..email = value,
              ),
              Container(height: 16),
              GithubTextFormField(
                labelText: "Password",
                hintText: "********",
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: _defaultValidator,
                onSaved: (value) => currentLoginParams..password = value,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: StreamBuilder<bool>(
                    stream: bloc.progressObservable,
                    builder: (context, snapshot) {
                      if (snapshot.data ?? false) {
                        return CircularProgressIndicator();
                      }
                      return MaterialButton(
                        minWidth: 160,
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (_loginFormKey.currentState.validate()) {
                            _loginFormKey.currentState.save();
                            bloc.loginParamsSubject.add(currentLoginParams);
                          }
                        },
                      );
                    }),
              )
            ],
          )),
    );
  }

  String _defaultValidator(value) {
    if (value?.isEmpty ?? true) {
      return "This field is required";
    }
    return null;
  }
}
