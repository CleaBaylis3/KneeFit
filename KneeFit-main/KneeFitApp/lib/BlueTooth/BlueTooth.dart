import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'BleController.dart';

class ConnectToBraceScreen extends StatelessWidget {
  const ConnectToBraceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BleController bleController = Get.put(BleController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bluetooth"),
      ),
      body: Center(
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  bleController.devicesList.isNotEmpty
                      ? "Connected to ${bleController.devicesList.first.platformName}"
                      : "Not Connected",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: bleController.devicesList.isNotEmpty
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (bleController.devicesList.isEmpty) {
                      bleController.scanDevices();
                    } else {
                      bleController.disconnectDevice();
                    }
                  },
                  child: Text(
                    bleController.devicesList.isEmpty
                        ? "CONNECT"
                        : "DISCONNECT",
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
