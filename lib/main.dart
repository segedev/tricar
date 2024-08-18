import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tricar/viewmodels/device_controller.dart';
import 'package:tricar/views/control_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DeviceController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tricar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ControlScreen(),
    );
  }
}
