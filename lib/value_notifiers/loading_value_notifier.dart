import 'package:flutter/material.dart';

class LoadingValueNotifier extends ValueNotifier<bool> {
  LoadingValueNotifier() : super(false);

  loading(bool isLoading) {
    super.value = isLoading;
  }
}
