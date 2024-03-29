import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<T> showLoader<T>(
  BuildContext context,
  Future<T> future,
) async {
  final overlayState = Overlay.of(context);
  final entry = OverlayEntry(
    builder: (_) => Container(
      color: Colors.black45,
      child: Center(
        child: Platform.isAndroid
            ? const CircularProgressIndicator()
            : const CupertinoActivityIndicator(),
      ),
    ),
  );
  overlayState.insert(entry);

  final result = await future;
  entry.remove();

  return result;
}
