import 'package:flutter/material.dart';

import 'loading_value_notifier.dart';

abstract class IFortuneRepository {
  Future<String> fetch();
}

class FortuneValueNotifier extends ValueNotifier<String> {
  final IFortuneRepository _repository;
  final LoadingValueNotifier _loadingValueNotifier;

  FortuneValueNotifier(this._repository, this._loadingValueNotifier)
      : super('');

  void draw() async {
    _loadingValueNotifier.loading(true);
    super.value = await _repository
        .fetch()
        .whenComplete(() => _loadingValueNotifier.loading(false));
  }
}
