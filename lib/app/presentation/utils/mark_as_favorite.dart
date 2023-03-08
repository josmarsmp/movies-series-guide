import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/models/media/media.dart';
import '../global/controllers/favorites/favorites_controller.dart';

Future<void> markAsFavorite({
  required BuildContext context,
  required Media media,
  required bool Function() mounted,
}) async {
  final FavoritesController favoritesController = context.read();
  final result = await favoritesController.markAsFavorite(media);

  if (!mounted()) {
    return;
  }

  result.whenOrNull(
    left: (failure) {
      final errorMessage = failure.when(
        notFound: () => 'Resource not found',
        network: () => "Look's like you don't have access to internet",
        unauthorized: () => 'You are not authorized to do this action',
        unknown: () => 'Something went wrong',
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
    },
  );
}
