import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:get_x_lab/app/modules/form/controllers/form_controller.dart';

class FormView extends GetView<FormController> {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormView'),
        centerTitle: true,
      ),
      body: Obx(
        () => Column(
          children: [
            DropdownButtonFormField(
              hint: const Text('Pilih Acara'),
              value: controller.acaraTerpilih.value,
              items: controller.jenisAcara
                  .map(
                    (e) => DropdownMenuItem(
                      value: controller.jenisAcara.indexOf(e),
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                controller.pilihAcara(value as int);
                log('acara terpilih: ${controller.acaraTerpilih.value}');
              },
            ),
            DropdownButtonFormField(
              hint: const Text('Pilih Kegiatan'),
              value: controller.kegiatanTerpilih.value,
              items: _dropDownJenisKegiatan(
                index: controller.acaraTerpilih.value,
                listKegiatanOffline: controller.jenisKegiatanOffline,
                listKegiatanOnline: controller.jenisKegiatanOnline,
              ),
              onChanged: (value) {
                controller.kegiatanTerpilih.value = value as int;

                // Buat kondisi List yang diambil berdasarkan jenis acara (Offline / Online)
                if (controller.acaraTerpilih.value == 0) {
                  // Simpan dalam variable, value string yang mau diambil
                  final value = controller
                      .jenisKegiatanOnline[controller.kegiatanTerpilih.value!];
                  // Simpan value ke dalam state
                  controller.acaraTerpilihString.value = value;   

                } else {
                  final value = controller
                      .jenisKegiatanOffline[controller.kegiatanTerpilih.value!];
                   
                  controller.acaraTerpilihString.value = value;   
                }
                log('kegiatan terpilih: ${controller.kegiatanTerpilih.value}');
              },
            ),
          ],
        ),
      ),
    );
  }
}

List<DropdownMenuItem<int>>? _dropDownJenisKegiatan({
  required int? index,
  required RxList<String> listKegiatanOffline,
  required RxList<String> listKegiatanOnline,
}) {
  switch (index) {
    case 0:
      return listKegiatanOnline
          .map(
            (e) => DropdownMenuItem(
              value: listKegiatanOnline.indexOf(e),
              child: Text(e),
            ),
          )
          .toList();
    case 1:
      return listKegiatanOffline
          .map(
            (e) => DropdownMenuItem(
              value: listKegiatanOffline.indexOf(e),
              child: Text(e),
            ),
          )
          .toList();
    default:
      return null;
  }
}
