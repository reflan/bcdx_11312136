import 'package:bcdx_11312136/app/modules/mahasiswa2/models/Mahasiswa.dart';
import 'package:bcdx_11312136/app/modules/mahasiswa2/views/mahasiswa2_form_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mahasiswa2_controller.dart';

class Mahasiswa2View extends GetView<Mahasiswa2Controller> {
  const Mahasiswa2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListMahasiswa2();
  }
}

class ListMahasiswa2 extends StatefulWidget {
  @override
  State<ListMahasiswa2> createState() => _ListMahasiswa2State();
}

class _ListMahasiswa2State extends State<ListMahasiswa2> {
  List<Mahasiswa> _listMahasiswa = [];

  void getMahasiswa() async {
    _listMahasiswa = await Mahasiswa2Controller.getMahasiswa();

    setState(() {});
  }

  @override
  void initState() {
    getMahasiswa();
    super.initState();
  }

  void showOption(Mahasiswa? mahasiswa) async {
    var result = await Get.dialog(
        SimpleDialog(
          children: [
            ListTile(
              onTap: () => Get.back(result: 'update'),
              title: Text('Update'),
            ),
            ListTile(
              onTap: () => Get.back(result: 'delete'),
              title: Text('Delete'),
            ),
            ListTile(
              onTap: () => Get.back(),
              title: Text('Close'),
            ),
          ],
        ),
        barrierDismissible: false);
    switch (result) {
      case 'update':
        Get.to(Mahasiswa2FormView(mahasiswa: mahasiswa))
            ?.then((value) => getMahasiswa());
        break;
      case 'delete':
        Mahasiswa2Controller.deleteMahasiswa(mahasiswa!.mhsNpm!)
            .then((value) => getMahasiswa());
        break;
    }
  }

  Widget build(BuildContext context) {
    return Stack(children: [
      _listMahasiswa.length > 0
          ? ListView.builder(
              itemCount: _listMahasiswa.length,
              itemBuilder: (context, index) {
                Mahasiswa mahasiswa = _listMahasiswa[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                    backgroundColor: Colors.white,
                  ),
                  title: Text(mahasiswa.mhsNama ?? ''),
                  subtitle: Text(mahasiswa.mhsNpm ?? ''),
                  trailing: IconButton(
                      onPressed: () => showOption(mahasiswa),
                      icon: Icon(Icons.more_vert)),
                );
              },
            )
          : Center(
              child: Text("Data Kosong"),
            ),
    ]);
  }
}
