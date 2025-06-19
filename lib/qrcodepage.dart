import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

GlobalKey qrkod = GlobalKey();

class QrCodePage extends StatelessWidget {
  final String name;
  final String work;
  final String company;
  final String phone;
  final String mail;
  final String site;
  const QrCodePage(
    this.name,
    this.work,
    this.company,
    this.phone,
    this.mail,
    this.site,
  );
  @override
  Widget build(BuildContext context) {
    List data = [name, work, company, phone, mail, site];
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RepaintBoundary(
                key: qrkod,
                child: QrImageView(data: jsonEncode(data)),
              ),
              SizedBox(
                height: 50,
                child: FilledButton(
                  onPressed: () async {
                    final bytes = await qrimage();
                    await QrCodeSave(bytes);
                  },
                  child: Text("Save QR code as image"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<Uint8List> qrimage() async {
  RenderRepaintBoundary boundary =
      qrkod.currentContext!.findRenderObject() as RenderRepaintBoundary;
  var image = await boundary.toImage(pixelRatio: 3.0);
  ByteData? imagebyte = await image.toByteData(format: ImageByteFormat.png);
  return imagebyte!.buffer.asUint8List();
}

Future<void> QrCodeSave(Uint8List imageBytes) async {
  if (Platform.isAndroid) {
    if (await Permission.storage.request().isGranted) {
      final directory = await getExternalStorageDirectory();
      final filepath = "${directory!.path}/qrkod.png";
      final file = File(filepath);
      await file.writeAsBytes(imageBytes);
      print("SAVED! file path:${filepath}");
    } else
      print("PERMISSION ERROR");
  } else if (Platform.isWindows) {
    final directory = Directory("${Platform.environment['USERPROFILE']}/Desktop/",);

    final file = File("${directory.path}/qrkod.png");
    await file.writeAsBytes(imageBytes);
    print("SAVED ${file.path}");
  } else if (Platform.isMacOS || Platform.isLinux) {
    final directory = Directory("${Platform.environment['HOME']}/Desktop");
    final file = File("${directory.path}/qrkod.png");
    await file.writeAsBytes(imageBytes);
    print("SAVED ${file.path}");
  }
}
