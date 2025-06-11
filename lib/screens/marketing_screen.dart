import 'package:flutter/material.dart';

class MarketingScreen extends StatefulWidget {
  const MarketingScreen({super.key});

  @override
  State<MarketingScreen> createState() => _MarketingScreenState();
}

class _MarketingScreenState extends State<MarketingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketing'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: const Center(
        child: Text('Marketing Page - Coming Soon!'),
      ),
    );
  }
}
