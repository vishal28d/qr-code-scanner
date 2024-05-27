import 'package:flutter/material.dart';
import 'package:qr_code_scanner/generate_qr_code.dart';
import 'package:qr_code_scanner/scan_qr_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Scanner And Generator", style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 14, 37, 77),
      ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            setState(() {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ScanQRCode()));
            });
          }, 
          child: const Text("Scan QR Code", style: TextStyle(fontSize: 25),)
          ),

         SizedBox(height: 30),

           ElevatedButton(onPressed: (){
            setState(() {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const GenerateQRCode()));
            });
          }, 
          child: const Text("Generate QR Code", style: TextStyle(fontSize: 25),)
          ),

        ],
      ),
    ) ,

    );
  }
}