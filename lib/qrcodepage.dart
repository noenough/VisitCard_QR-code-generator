import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
    return Scaffold(body: Center(child: QrImageView(data: jsonEncode(data))));
  }
}
