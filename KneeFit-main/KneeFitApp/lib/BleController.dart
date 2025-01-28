import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class BleController extends GetxController {
  final FlutterBluePlus flutterBlue =
      FlutterBluePlus(); // Instantiate FlutterBluePlus
  RxList<BluetoothDevice> devicesList = <BluetoothDevice>[].obs;
  var isScanning = false.obs;

  // Start scanning for Bluetooth devices
  Future<void> scanDevices() async {
    if (!isScanning.value) {
      isScanning.value = true;
      await FlutterBluePlus.startScan(
          timeout: const Duration(seconds: 4)); // Access startScan via class

      FlutterBluePlus.scanResults.listen((results) {
        // Access scanResults via class
        devicesList.clear();
        for (ScanResult result in results) {
          if (result.device.platformName.isNotEmpty &&
              !devicesList.contains(result.device)) {
            devicesList.add(result.device);
          }
        }
      });

      await FlutterBluePlus.stopScan(); // Access stopScan via class
      isScanning.value = false;
    }
  }

  // Connect to a selected Bluetooth device
  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect();
      Get.snackbar('Connected', 'Connected to ${device.platformName}');
    } catch (e) {
      Get.snackbar('Error', 'Error connecting to ${device.platformName}');
    }
  }
}
