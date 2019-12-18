import 'package:smart_cooking/api/network_api_client.dart';

class QRBloc {
  Future<bool> setUserWorkplace(Map<String, dynamic> body) async {
    try {
      QRModel qrModel = QRModel.fromJson(body);

      // ignore: unused_local_variable
      final response = await AppuniteHttpClient().post('/api/v1/workplace',
          body: {
            'room': qrModel.room,
            'floor': qrModel.floor,
            'desk': qrModel.desk
          });
      return true;
    } catch (error) {
      throw error;
    }
  }
}
class QRModel {
  String room, floor, desk;

  QRModel(this.room, this.floor, this.desk);

  factory QRModel.fromJson(Map<String, dynamic> json) {
    return QRModel(
      json['room'],
      json['floor'],
      json['desk'],
    );
  }
}
