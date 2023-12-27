import 'package:bcdx_11312136/app/modules/mahasiswa2/controllers/mahasiswa2_controller.dart';
import 'package:bcdx_11312136/app/modules/mahasiswa2/views/mahasiswa2_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../models/Mahasiswa.dart';

class Mahasiswa2FormView extends GetView {
  late Mahasiswa? mahasiswa;
  Mahasiswa2FormView({this.mahasiswa});

  @override
  Widget build(BuildContext context) {
    return MahasiswaForm(mahasiswa: mahasiswa);
  }
}

class MahasiswaForm extends StatefulWidget {
  final Mahasiswa? mahasiswa;
  MahasiswaForm({Key? key, this.mahasiswa}) : super(key: key);
  @override
  State<MahasiswaForm> createState() => _MahasiswaFormState();
}

class _MahasiswaFormState extends State<MahasiswaForm> {
  var _formKey = GlobalKey<FormState>();
  var _controllerNpm = TextEditingController();
  var _controllerNama = TextEditingController();
  var _controllerAlamat = TextEditingController();
  var _controllerFakultas = TextEditingController();
  var _controllerProdi = TextEditingController();

  bool _isHidden = true;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.mahasiswa != null) {
      _controllerNpm.text = widget.mahasiswa!.mhsNpm!;
      _controllerNama.text = widget.mahasiswa!.mhsNama!;
      _controllerAlamat.text = widget.mahasiswa!.mhsAlamat!;
      _controllerFakultas.text = widget.mahasiswa!.mhsFakultas!;
      _controllerProdi.text = widget.mahasiswa!.mhsProdi!;
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        // titleSpacing: 0,
        title: widget.mahasiswa != null
            ? Text('Update Mahasiswa')
            : Text('Tambah Mahasiswa'),
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  enabled: widget.mahasiswa == null ? true : false,
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerNpm,
                  decoration: InputDecoration(
                      labelText: "NPM",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerNama,
                  decoration: InputDecoration(
                      labelText: "Nama",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerAlamat,
                  decoration: InputDecoration(
                      labelText: "Alamat",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerFakultas,
                  decoration: InputDecoration(
                      labelText: "Fakultas",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerProdi,
                  decoration: InputDecoration(
                      labelText: "Prodi",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (widget.mahasiswa == null) {
                        Mahasiswa2Controller.AddMahasiswa(
                          _controllerNpm.text,
                          _controllerNama.text,
                          _controllerAlamat.text,
                          _controllerFakultas.text,
                          _controllerProdi.text,
                        );
                      } else {
                        Mahasiswa2Controller.UpdateMahasiswa(
                          _controllerNpm.text,
                          _controllerNama.text,
                          _controllerAlamat.text,
                          _controllerFakultas.text,
                          _controllerProdi.text,
                        );
                      }
                    }
                  },
                  child: Text(
                    widget.mahasiswa == null ? 'Simpan' : 'Ubah',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      fixedSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
