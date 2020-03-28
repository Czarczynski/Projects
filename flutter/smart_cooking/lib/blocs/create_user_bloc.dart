import 'package:smart_cooking/api/network_api_client.dart';
class CreateUserBloc{
  final String email, password, password2, firstname, lastname, phone;

  bool confirmation=false;
  CreateUserBloc(this.email, this.password, this.password2, this.firstname,
      this.lastname, this.phone){
    _postNewUser();
  }

  Future _postNewUser() async{
    try {
      await new SmartCookingHttpClient().post("/api/Account/Register?" +
          "firstName=" + this.firstname +
          "&lastName=" + this.lastname +
          "&phoneNumber=" + this.phone,
          body: {
            'Email': this.email,
            'Password': this.password,
            'ConfirmPassword': this.password2
          });
      confirmation = true;
    } catch (error) {
      throw error;
    }
  }


}
