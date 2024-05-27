import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({Key? key}) : super(key: key);

  @override
  State<GenerateQRCode> createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate QR Code"),
        backgroundColor: Colors.blue[100],

      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(urlController.text.isNotEmpty)
              QrImageView(
                  data: urlController.text,
                  errorCorrectionLevel: QrErrorCorrectLevel.H,
                  version: QrVersions.auto,
                  gapless: true,
                  backgroundColor:Colors.white,
                  eyeStyle: QrEyeStyle(color: Colors.black),
                  size: 300,
            ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: urlController,
                  decoration: const InputDecoration(
                    hintText: 'Enter URL',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    labelText: "Enter Your Data",
                  ),
                ),
              ),

            SizedBox(height: 20,),

            ElevatedButton(onPressed: (){ setState(() {
              
            });
            }, 
            child: Text("Generate QR Code", style: TextStyle(fontSize: 20),)
            )

            ],
          ),
        ),
      ),
    );
  }
}
