import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uy_ishi_3/cubid/theme_cubid.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? imagefile;

  void uploadImage(ImageSource imageSource) async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(source: imageSource);
    if (pickedImage != null) {
      setState(() {
        imagefile = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Screen"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  uploadImage(ImageSource.camera);
                },
                icon: const Icon(Icons.camera),
              ),
              IconButton(
                onPressed: () {
                  uploadImage(ImageSource.gallery);
                },
                icon: const Icon(Icons.image),
              ),
            ],
          ),
          if (imagefile != null)
            Container(
              width: 500,
              height: 500,
              child: Image.file(imagefile!),
            ),
          BlocBuilder<ThemeCubit, bool>(
            builder: (context, isDarkMode) {
              return SwitchListTile(
                title: const Text("Change Theme"),
                value: isDarkMode,
                onChanged: (bool value) {
                  context.read<ThemeCubit>().changeTheme();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
