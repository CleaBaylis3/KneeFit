import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart'; // Make sure to import FlutterBluePlus
import 'BleController.dart';

class ConnectToBraceScreen extends StatelessWidget {
  const ConnectToBraceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bluetooth"),
      ),
      body: GetBuilder<BleController>(
        init: BleController(),
        builder: (controller) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // StreamBuilder to display scanned devices
                StreamBuilder<List<ScanResult>>(
                  stream: FlutterBluePlus
                      .scanResults, // Use the class directly for the stream
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final data = snapshot.data![index];
                            return Card(
                              elevation: 2,
                              child: ListTile(
                                title: Text(data.device.platformName),
                                subtitle: Text(data.device.remoteId.str),
                                trailing: Text(data.rssi.toString()),
                                onTap: () =>
                                    controller.connectToDevice(data.device),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(child: Text("No Device Found"));
                    }
                  },
                ),
                const SizedBox(height: 10),
                // Scan Button
                ElevatedButton(
                  onPressed: () async {
                    controller.scanDevices();
                  },
                  child: const Text("SCAN"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
