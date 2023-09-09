import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController cNpm;
  late TextEditingController cNama;
   late TextEditingController cAlamat;
    late TextEditingController cProgramStudi;
     late TextEditingController cJk;




  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void addProduct(String npm,String nama, String alamat, String Programstudi, String Jk) async {
    CollectionReference products = firestore.collection("mahasiswa");

    try{
      await products.add(
       {"npm": npm,
      "nama": nama,
      "alamat" : alamat,
      "programstudi" : Programstudi,
      "Jeniskelamin" : Jk,
    });
    Get.defaultDialog(
      title: "Berhasil",
      middleText: "Berhasil menyimpan data produk",
      onConfirm: () {
        cNama.clear();
        cNpm.clear();
        cAlamat.clear();
        cProgramStudi.clear();
        cJk.clear();
        Get.back();
        Get.back();
        textConfirm:
        "OK";
      });
    } catch(e){}
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNama = TextEditingController();
    cNpm = TextEditingController();
    cAlamat = TextEditingController();
    cProgramStudi = TextEditingController();
    cJk = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNama.dispose();
    cNpm.dispose();
    cAlamat.dispose();
    cProgramStudi.dispose();
    cJk.dispose();
    super.onClose();
  }
}