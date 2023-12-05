import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MahasiswaController extends GetxController {
  //TODO: Implement MahasiswaController
  late TextEditingController cNpm;
  late TextEditingController cNama;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference mahasiswa = firestore.collection('mahasiswa');

    return mahasiswa.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference mahasiswa = firestore.collection('mahasiswa');
    return mahasiswa.snapshots();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNpm = TextEditingController();
    cNama = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNpm.dispose();
    cNama.dispose();
    super.onClose();
  }
}
