import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_printer_2/printer_service.dart';
import 'package:quick_usb/quick_usb.dart';
import 'package:usb_thermal_printer_web/usb_thermal_printer_web.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// void getPrinter() async {
//   PrinterBluetoothManager printerManager = PrinterBluetoothManager();

//   printerManager.scanResults.listen((printers) async {
//     // store found printers
//     log('printer : ${printers}');
//   });
//   printerManager.startScan(Duration(seconds: 4));

// // ...

//   // printerManager.selectPrinter(printer);
//   // final PosPrintResult res = await printerManager.printTicket(testTicket());

//   // print('Print result: ${res.msg}');
// }

class _HomePageState extends State<HomePage> {
  WebThermalPrinter _printer = WebThermalPrinter();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getListDevice() async {
    await QuickUsb.init();
// ...
    List<UsbDevice> deviceList = await QuickUsb.getDeviceList();
    if (deviceList.isEmpty) {
      log('device : empty');
    } else {
      for (var e in deviceList) {
        log('device : ${e.productId} || ${e.vendorId}');
      }
    }
// ...
    await QuickUsb.exit();
  }

// A Dummy Function that you can call on any button and test.

  printReceipt() async {
    //Pairing Device is required.
    try {
      await _printer.pairDevice(vendorId: 0x6868, productId: 0x0200);
      log('device : success connect printer');
    } catch (e) {
      log('device : failed connect printer $e');
    }

    // await _printer.printText('DKT Mart', bold: true, centerAlign: true);
    // await _printer.printEmptyLine();

    // await _printer.printRow("Products", "Sale");
    // await _printer.printEmptyLine();

    // for (int i = 0; i < 10; i++) {
    //   await _printer.printRow(
    //       'A big title very big title ${i + 1}', '${(i + 1) * 510}.00 AED');
    //   await _printer.printEmptyLine();
    // }

    // await _printer.printDottedLine();
    // await _printer.printEmptyLine();

    // await _printer.printBarcode('123456');
    // await _printer.printEmptyLine();

    // await _printer.printEmptyLine();
    // await _printer.closePrinter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                PrinterService.init();
                await PrinterService.scan();
              },
              child: Text('get device list'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                printReceipt();
              },
              child: Text('get print'),
            ),
          ],
        ),
      ),
    );
  }
}
