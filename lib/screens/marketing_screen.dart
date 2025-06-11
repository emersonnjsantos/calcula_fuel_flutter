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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // 2. Add Promotional Image Section
              // Note: 'assets/promo_placeholder.png' is a placeholder path.
              // The actual asset should be added to pubspec.yaml and the assets folder.
              Image.asset(
                'assets/promo_placeholder.png', // Placeholder path
                height: 200,
                fit: BoxFit.cover,
                // ErrorBuilder to show a fallback if the image doesn't load
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Text('Image not available'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),

              // 3. Add Promotional Text Section
              Text(
                'Special Promotion!',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Don't miss out on our exclusive offers! Get the best deals on fuel and services. Visit our partner stations today and save big. This offer is valid for a limited time only.",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 30),

              // 4. Add Call-to-Action Button
              ElevatedButton(
                onPressed: () {
                  print('Learn More button tapped!');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Navigating to website... (simulated)')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15), backgroundColor: Colors.amber,
                ),
                child: const Text(
                  'Learn More',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              const SizedBox(height: 20), // Extra spacing at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
