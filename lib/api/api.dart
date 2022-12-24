import 'package:http/http.dart';
import 'dart:convert';

class DataModel {
  int? page;
  String? idProdi;

  DataModel({this.page, this.idProdi});

  Future<String> _login() async {
    const String url = 'http://onedata.unila.ac.id/api/live/0.1/auth/login';

    Response response = await post(Uri.parse(url), body: {
      "id_aplikasi": "948df317-78f7-4b92-a53f-0a56215e07de",
      "username": 'mhs-testing',
      "password": 'unilajaya'
    });

    Map token = json.decode(response.body);

    return ("${token['data']['type']} ${token['data']['token']}");
  }

  Future<Map> getData() async {
    late String token;
    var url =
        'http://onedata.unila.ac.id/api/live/0.1/mahasiswa/list_mahasiswa?page=${this.page}&limit=50&sort_by=ASC&id_prodi=${this.idProdi}';

    await _login().then((value) {
      token = value;
    });

    var header = {"Authorization": token};

    Response response = await get(
      Uri.parse(url),
      headers: header,
    );

    Map data = json.decode(response.body);

    return (data);
  }
}
