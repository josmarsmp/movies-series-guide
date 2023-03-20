import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/controllers/session_controller.dart';
import '../../../global/controllers/theme_controller.dart';
import '../../../global/extensions/build_context_ext.dart';
import '../../../global/utils/get_image_url.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final SessionController sessionController = context.read();
    final user = sessionController.state!;
    final bool isDarkMode = context.isDarkModeEnabled;
    final IconData icon = isDarkMode ? Icons.light_mode : Icons.dark_mode;
    const double profileSize = 200.0;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeController>().onChanged(!isDarkMode);
            },
            icon: Icon(icon),
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 50),
              SizedBox(
                height: profileSize,
                width: profileSize,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(profileSize / 2),
                  child: ExtendedImage.network(
                    getImageUrl(
                      user.avatarPath!,
                      imageQuality: ImageQuality.w300,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(user.username),
            ],
          ),
        ),
      ),
    );
  }
}
