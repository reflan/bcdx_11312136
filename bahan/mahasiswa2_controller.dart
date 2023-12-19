import 'dart:convert';
import 'package:bcdx_11312136/app/modules/mahasiswa2/model/Mahasiswa.dart';
import 'package:bcdx_11312136/app/modules/mahasiswa2/views/Mahasiswa2_view.dart';
import 'package:bcdx_11312136/app/utils/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Mahasiswa2Controller extends GetxController {
  Rx<Mahasiswa> _mahasiswa = Mahasiswa().obs;
  Mahasiswa get mahasiswa => _mahasiswa.value;

  @override
  void onInit() {
    super.onInit();
    getMahasiswa();
  }

  static Future<List<Mahasiswa>> getMahasiswa() async {
    List<Mahasiswa> listMahasiswa = [];

    try {
      var response = await http.get(Uri.parse(Api.getMahasiswa));

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          var mahasiswa = responBody['mahasiswa'];

          mahasiswa.forEach((mahasiswa) {
            listMahasiswa.add(Mahasiswa.fromJson(mahasiswa));
          });
        }
      }
    } catch (e) {
      print(e);
    }

    return listMahasiswa;
  }
}
