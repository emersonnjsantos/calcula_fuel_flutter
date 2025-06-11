import 'package:flutter/material.dart';

class GasStationsScreen extends StatefulWidget {
  const GasStationsScreen({super.key});

  @override
  State<GasStationsScreen> createState() => _GasStationsScreenState();
}

class _GasStationsScreenState extends State<GasStationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gas Stations'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: const Center(
        child: Text('Gas Stations Page - Coming Soon!'),
      ),
    );
  }
}
