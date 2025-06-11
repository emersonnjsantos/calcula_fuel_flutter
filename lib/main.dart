import 'package:calcula_fuel/screens/calculator_screen.dart';
import 'package:calcula_fuel/screens/gas_stations_screen.dart';
import 'package:calcula_fuel/screens/login_screen.dart';
import 'package:calcula_fuel/screens/marketing_screen.dart';
import 'package:calcula_fuel/screens/profile_form_screen.dart'; // Added import
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://mfyafcsvalmnsmbkimrn.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1meWFmY3N2YWxtbnNtYmtpbXJuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDk2Njg0ODUsImV4cCI6MjA2NTI0NDQ4NX0.x3u7h4wokbqbG8BSJxi8XQAPnZMJsoHNQf9yavq_wfI',
  );
  // final supabase = Supabase.instance.client; // Client instance can be accessed anywhere via Supabase.instance.client

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Combustível',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AuthGate(), // Changed home to AuthGate
      debugShowCheckedModeBanner: false,
    );
  }
}

// New AuthGate widget
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        final session = snapshot.data?.session;
        if (session != null) {
          // User is logged in
          // Future: Check if profile exists, then navigate to ProfileFormScreen or MainScreen
          return const MainScreen();
        } else {
          // User is not logged in
          return const LoginScreen();
        }
      },
    );
  }
}


class MainScreen extends StatefulWidget {
  const MainScreen({super.key}); // Added const
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  // Made _widgetOptions non-static as it's specific to an instance of MainScreen state
  final List<Widget> _widgetOptions = <Widget>[
    const CalculatorScreen(), // Added const
    const GasStationsScreen(), // Added const
    const MarketingScreen(), // Added const
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // Added AppBar here to include Logout button
        title: const Text('Calcula Fuel'), // Generic title for MainScreen container
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Profile',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfileFormScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () async {
              try {
                await Supabase.instance.client.auth.signOut();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logged out successfully!')),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Logout failed: ${e.toString()}')),
                  );
                }
              }
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_gas_station),
            label: 'Gas Stations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign),
            label: 'Marketing',
          ),
          // Add other navigation items here
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}


