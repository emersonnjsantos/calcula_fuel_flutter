import 'package:flutter/material.dart';

// 1. Define a Data Model
class GasStation {
  String name;
  String address;
  double alcoholPrice;
  double gasolinePrice;

  GasStation({
    required this.name,
    required this.address,
    required this.alcoholPrice,
    required this.gasolinePrice,
  });
}

class GasStationsScreen extends StatefulWidget {
  const GasStationsScreen({super.key});

  @override
  State<GasStationsScreen> createState() => _GasStationsScreenState();
}

class _GasStationsScreenState extends State<GasStationsScreen> {
  // 2. Update GasStationsScreen State
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _alcoholPriceController = TextEditingController();
  final TextEditingController _gasolinePriceController = TextEditingController();

  List<GasStation> _savedStations = [];

  void _saveStation() {
    // Retrieve text from controllers
    final String name = _nameController.text;
    final String address = _addressController.text;
    final double? alcoholPrice = double.tryParse(_alcoholPriceController.text);
    final double? gasolinePrice = double.tryParse(_gasolinePriceController.text);

    // Perform basic validation
    if (name.isEmpty || address.isEmpty || alcoholPrice == null || gasolinePrice == null || alcoholPrice <= 0 || gasolinePrice <= 0) {
      // Show an error message (e.g., using a SnackBar)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid input. Please check all fields.')),
      );
      return;
    }

    // Create a GasStation object
    final newStation = GasStation(
      name: name,
      address: address,
      alcoholPrice: alcoholPrice,
      gasolinePrice: gasolinePrice,
    );

    // Add the new GasStation object to the _savedStations list
    setState(() {
      _savedStations.add(newStation);
    });

    // Clear the text controllers
    _nameController.clear();
    _addressController.clear();
    _alcoholPriceController.clear();
    _gasolinePriceController.clear();

    // Print the details of the saved station
    print('Saved: ${newStation.name}, ${newStation.address}, Alcohol: ${newStation.alcoholPrice}, Gasoline: ${newStation.gasolinePrice}');
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${newStation.name} saved successfully!')),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gas Stations'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      // 3. Build the Input Form
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Gas Station Name'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _alcoholPriceController,
                decoration: const InputDecoration(labelText: 'Price of Alcohol (e.g., 3.45)'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _gasolinePriceController,
                decoration: const InputDecoration(labelText: 'Price of Gasoline (e.g., 4.99)'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveStation,
                child: const Text('Save Station'),
              ),
              const Divider(height: 30, thickness: 1),
              // 4. Display Saved Stations
              Text(
                'Saved Stations:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              _savedStations.isEmpty
                  ? const Center(child: Text('No stations saved yet.'))
                  : ListView.builder(
                      shrinkWrap: true, // Important to make ListView work inside SingleChildScrollView
                      physics: const NeverScrollableScrollPhysics(), // Disable scrolling for inner ListView
                      itemCount: _savedStations.length,
                      itemBuilder: (context, index) {
                        final station = _savedStations[index];
                        return ListTile(
                          title: Text(station.name),
                          subtitle: Text('${station.address}\nAlcohol: R\$${station.alcoholPrice.toStringAsFixed(2)} - Gasoline: R\$${station.gasolinePrice.toStringAsFixed(2)}'),
                          isThreeLine: true,
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
