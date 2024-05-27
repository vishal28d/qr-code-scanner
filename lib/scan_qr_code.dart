

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({Key? key}) : super(key: key);

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String qrResult = "Scanned data will appear here";

  // final Uri _url = Uri.parse(qrResult.toString());

  Uri? _url;

  void parseUrlFromString(String urlString) {
     _url = Uri.tryParse(urlString);
  }

  Future<void> _launchUrl() async {
  if (!await launchUrl(_url!)) {
    throw Exception('Could not launch $_url');
    }
  }

  bool isUrl(String value) {
  // Regular expression pattern for URL validation
  final urlPattern = RegExp(
    r'^(?:http|https):\/\/' // Protocol (http:// or https://)
    r'(?:[\w-]+\.)+\w{2,}' // Domain name (example.com)
    r'(?:\/[\w-]+)*(?:\/|\/[\w-]+\.[\w]+)?' // Path (/path/to/resource or /path/to/file.html)
    r'(?:\?[\w-]+=[\w-]+(?:&[\w-]+=[\w-]+)*)?' // Query parameters (?key1=value1&key2=value2)
    r'(?:#[\w-]+)?$' // Fragment (#section)
    r'|upi://[\w-]+' // UPI links (upi://)
    r'|\w+:\/\/' // Protocol with double slash (e.g., ftp://)
    r'|www\.[\w-]+\.[\w]{2,}' // URLs starting with www. (www.example.com)
    r'|\w+\.com' // URLs ending with .com (example.com)
    r'|\w+\.in' // URLs ending with .in (example.in)
    r'|@[\w-]+' // URLs with @ symbol (e.g., email addresses)
  );

  // Check if the value matches the URL pattern
  return urlPattern.hasMatch(value);
}

  Future<void> scanQr() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      setState(() {
        qrResult = qrCode.toString();
      });
    } on PlatformException {
      setState(() {
        qrResult = 'Failed to read QR Code';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QR Code"),
        backgroundColor: Colors.blue[100],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  qrResult,
                  style: const TextStyle(fontSize: 20, color: Colors.black87),
                ),
           if(qrResult != "Scanned data will appear here" && isUrl(qrResult))
                ElevatedButton(
                  onPressed: () {
                    parseUrlFromString(qrResult);
                    _launchUrl();
                  },
                  child: const Text('Open Web Page'),
                ),
              ],
            ),
          ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: scanQr,
              child: const Text("Scan QR Code", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
