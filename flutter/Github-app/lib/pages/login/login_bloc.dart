import 'package:github_app/base/base_bloc.dart';
import 'package:github_app/repositories/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BaseBloc {
  final UserRepository _userRepository = UserRepository();
  final BehaviorSubject<LoginParams> loginParamsSubject = BehaviorSubject();

  Observable<Response> loginObservable;
  Observable<bool> progressObservable;

  LoginBloc() {
    loginObservable = loginParamsSubject
        .switchMap((loginParams) =>
            _userRepository.authenticate(loginParams.email, loginParams.password).asStream())
        .asBroadcastStream();

    progressObservable =
        Observable.merge([loginParamsSubject.map((_) => true), loginObservable.map((_) => false)])
            .startWith(false);
  }

  @override
  void dispose() {
    loginParamsSubject.close();
    super.dispose();
  }
}

class LoginParams {
  String email, password;

  LoginParams({this.email, this.password});
}
