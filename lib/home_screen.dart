import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String data = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: QrImageView(
              data: data,
              backgroundColor: Colors.white,
              version: QrVersions.auto,
              size: 280.0,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: 280,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  data = value;
                });
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                hintText: 'Enter the data',
                hintStyle: TextStyle(fontSize: 17),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('QR Code Generated'),
                backgroundColor: Colors.green,
              ));
            },
            child: Container(
              width: 280,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                color: Colors.amber.shade300,
              ),
              child: const Center(child: Text('Generate the data')),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
