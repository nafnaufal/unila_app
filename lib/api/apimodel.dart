import 'package:http/http.dart';
import 'dart:convert';
import 'datamodel.dart';

class ApiModel {
  String? idProdi;

  ApiModel({this.idProdi});

  Future<String> _login() async {
    const String url = 'http://onedata.unila.ac.id/api/live/0.1/auth/login';
    String dataToken;

    try {
      Response response = await post(Uri.parse(url), body: {
        "id_aplikasi": "948df317-78f7-4b92-a53f-0a56215e07de",
        "username": 'mhs-testing',
        "password": 'unilajaya'
      });
      Map token = json.decode(response.body);
      dataToken = "${token['data']['token_bearer']}";
    } catch (e) {
      dataToken = "404";
    }
    return dataToken;
  }

  Future<List<DataMahasiswa>> getData(int page) async {
    late String token;
    Map data;
    List<DataMahasiswa> mahasiswa = [];

    await _login().then((value) {
      if (value != "404") {
        token = value;
      }else{
        return [];
      }
    });

    var header = {"Authorization": token};
    var url =
        'http://onedata.unila.ac.id/api/live/0.1/mahasiswa/list_mahasiswa?page=$page&limit=10&sort_by=ASC&id_prodi=${this.idProdi}';

    Response response = await get(
      Uri.parse(url),
      headers: header,
    );

    if (response.statusCode == 200) {
      data = json.decode(response.body);

      if (data['data'] != null) {
        data['data'].forEach((v) {
          mahasiswa.add(DataMahasiswa.fromJson(v));
        });
      }
    }
    return mahasiswa;
  }

  Future<DataMahasiswa> getBest() async {
    late String token;
    int page = 1;
    Map data;
    List<DataMahasiswa> mahasiswa = [];

    await _login().then((value) {
      if (value != "404") {
        token = value;
      }
    });

    var header = {"Authorization": token};
    while (true) {
      var url =
          'http://onedata.unila.ac.id/api/live/0.1/mahasiswa/list_mahasiswa?page=${page}&limit=10&sort_by=ASC&id_prodi=${this.idProdi}';

      Response response = await get(
        Uri.parse(url),
        headers: header,
      );

      if (response.statusCode == 200) {
        data = json.decode(response.body);

        if (data['data'] != null) {
          data['data'].forEach((v) {
            mahasiswa.add(DataMahasiswa.fromJson(v));
          });
          if (mahasiswa != null && mahasiswa.isNotEmpty) {
            mahasiswa
                .sort((a, b) => b.ipk.toString().compareTo(a.ipk.toString()));
          }
        } else {
          break;
        }
      }
      page++;
    }
    return mahasiswa[0];
  }
}
