import 'dart:convert';
import 'package:bcdx_11312136/app/modules/home/views/home_view.dart';
import 'package:bcdx_11312136/app/modules/mahasiswa2/models/Mahasiswa.dart';
import 'package:bcdx_11312136/app/modules/mahasiswa2/views/mahasiswa2_view.dart';
import 'package:bcdx_11312136/app/routes/app_pages.dart';
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

  static Future<void> AddMahasiswa(String mhsNpm, String mhsNama,
      String mhsAlamat, String mhsFakultas, String MhsProdi) async {
    String reason;

    try {
      var response = await http.post(Uri.parse(Api.addMahasiswa), body: {
        'mhsNpm': mhsNpm,
        'mhsNama': mhsNama,
        'mhsAlamat': mhsAlamat,
        'mhsFakultas': mhsFakultas,
        'MhsProdi': MhsProdi,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          // reason = 'Add Mahasiswa Berhasil';
          Get.defaultDialog(
            title: "Berhasil",
            middleText: "Berhasil tambah data Mahasiswa.",
            onConfirm: () {
              // Get.toNamed(Routes.HOME);
              Get.back();
              Get.back();
            },
            textConfirm: "OK",
          );
        } else {
          Get.defaultDialog(
            title: "Terjadi Kesalahan",
            middleText: "Gagal tambah data Mahasiswa.",
            onConfirm: () {
              Get.back();
              Get.back();
            },
            textConfirm: "OK",
          );
        }
      } else {
        Get.defaultDialog(
          title: "Request Gagal",
          middleText: "Gagal Request Data.",
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: "OK",
        );
      }
    } catch (e) {
      print(e);
      reason = e.toString();
    }
  }

  static Future<void> UpdateMahasiswa(String mhsNpm, String mhsNama,
      String mhsAlamat, String mhsFakultas, String MhsProdi) async {
    try {
      var response = await http.post(Uri.parse(Api.updateMahasiswa), body: {
        'mhsNpm': mhsNpm,
        'mhsNama': mhsNama,
        'mhsAlamat': mhsAlamat,
        'mhsFakultas': mhsFakultas,
        'MhsProdi': MhsProdi
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Get.defaultDialog(
            title: "Berhasil",
            middleText: "Berhasil Update Mahasiswa.",
            onConfirm: () {
              // Get.toNamed(Routes.HOME);
              Get.back();
              Get.back();
            },
            textConfirm: "OK",
          );
        } else {
          Get.defaultDialog(
            title: "Terjadi Kesalahan",
            middleText: "Gagal Update Mahasiswa.",
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> deleteMahasiswa(String mhsNpm) async {
    try {
      var response = await http
          .post(Uri.parse(Api.deleteMahasiswa), body: {'mhsNpm': mhsNpm});

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Get.defaultDialog(
            title: "Berhasil",
            middleText: "Berhasil Delete Mahasiswa",
            onConfirm: () {
              Get.back();
            },
            textConfirm: "OK",
          );
        } else {
          Get.defaultDialog(
            title: "Terjadi Kesalahan",
            middleText: "Gagal Delete Mahasiswa",
            onConfirm: () {
              Get.back();
            },
            textConfirm: "OK",
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
