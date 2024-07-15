import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uy_ishi_3/cubid/counter_cubid.dart';
import 'package:uy_ishi_3/ui/screens/settings_screen.dart';
import 'package:uy_ishi_3/ui/screens/test_screen1.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final counterCubid = context.read<CounterCubid>();
    print("object");

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Text(
                "Menu",
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SettingsScreen();
                    },
                  ),
                );
              },
              title: Text("Settings"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TestScreen1();
                    },
                  ),
                );
              },
              title: const Text("Test"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              counterCubid.decrement();
            },
            icon: const Icon(
              Icons.remove_circle,
            ),
          ),
          IconButton(
            onPressed: () {
              counterCubid.increment();
            },
            icon: const Icon(
              Icons.add_circle,
            ),
          ),
        ],
      ),
      body: BlocBuilder<CounterCubid, int>(
        builder: (context, state) {
          return Center(
            child: Text(
              state.toString(),
            ),
          );
        },
      ),
    );
  }
}
