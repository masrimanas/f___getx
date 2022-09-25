import 'package:get/get.dart';

class FormController extends GetxController {
  final acaraTerpilih = Rx<int?>(null);
  final kegiatanTerpilih = Rx<int?>(null);

  final jenisAcara = <String>['Online', 'Offline'].obs;

  final jenisKegiatanOffline = <String>[
    'Menghitung jumlah rumput tetangga',
    'Menimbang beratnya beban kehidupan',
    'Menimbang beratnya beban kehidupan kita',
  ].obs;

  final jenisKegiatanOnline = <String>[
    'Membuat video pargoy paling viral',
    'Mengcover lagu rehan dengan likes terbanyak',
  ].obs;

  void pilihAcara(int index) {
    acaraTerpilih.value = index;
    kegiatanTerpilih.value = null;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
