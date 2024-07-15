import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uy_ishi_3/cubid/theme_cubid.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    print("objects");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDarkMode) {
          return SwitchListTile(
            title: const Text("Change Theme"),
            value: isDarkMode,
            onChanged: (bool value) {
              print("object");
              context.read<ThemeCubit>().changeTheme();
            },
          );
        },
      ),
    );
  }
}
