// import 'dart:async';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// import 'package:get/get.dart';

// class BleController extends GetxController {
//   RxList<BluetoothDevice> devicesList = <BluetoothDevice>[].obs;
//   var isScanning = false.obs;
//   StreamSubscription? _scanSubscription;

//   final String targetDeviceName = "HMSoft";
//   final String targetDeviceId = "1893D701242D";

//   Future<void> scanDevices() async {
//     if (isScanning.value) return;

//     isScanning.value = true;
//     devicesList.clear();

//     try {
//       await FlutterBluePlus.startScan(timeout: const Duration(seconds: 10));

//       _scanSubscription?.cancel();
//       _scanSubscription = FlutterBluePlus.scanResults.listen((results) {
//         for (ScanResult result in results) {
//           if (result.device.platformName == targetDeviceName ||
//               result.device.remoteId.toString() == targetDeviceId) {
//             FlutterBluePlus.stopScan();
//             _scanSubscription?.cancel();
//             devicesList.add(result.device);
//             connectToDevice(result.device);
//             break;
//           }
//         }
//       });

//       await Future.delayed(const Duration(seconds: 10));
//       await FlutterBluePlus.stopScan();
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to scan devices: $e');
//     } finally {
//       isScanning.value = false;
//     }
//   }

//   Future<void> connectToDevice(BluetoothDevice device) async {
//     if (device.isConnected) {
//       Get.snackbar('Info', 'Already connected to ${device.platformName}');
//       return;
//     }

//     try {
//       await device.connect(autoConnect: false);
//       Get.snackbar('Connected', 'Connected to ${device.platformName}');
//     } catch (e) {
//       Get.snackbar('Error', 'Error connecting to ${device.platformName}: $e');
//     }
//   }

//   Future<void> disconnectDevice() async {
//     if (devicesList.isNotEmpty) {
//       try {
//         await devicesList.first.disconnect();
//         devicesList.clear();
//         Get.snackbar('Disconnected', 'Device disconnected');
//       } catch (e) {
//         Get.snackbar('Error', 'Error disconnecting: $e');
//       }
//     }
//   }

//   @override
//   void onClose() {
//     _scanSubscription?.cancel();
//     FlutterBluePlus.stopScan();
//     super.onClose();
//   }
// }
