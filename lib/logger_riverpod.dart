import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProviderObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
      ProviderBase provider,
      Object? previousValue,
      Object? newValue,
      ProviderContainer container,///use in provider scope
      ) {
    log('-------->  Provider updated: $provider');
    log('-------->  Previous value: $previousValue');
    log('-------->  New value: $newValue');
    log('-------->  container: $container');

    // Perform when initialize a riverPod

  }

  @override
  void didAddProvider(ProviderBase provider, Object? value,ProviderContainer container) {
    print('Provider added: $provider');
    print('Provider value: $value');

    // Perform any necessary actions when a provider is added
  }

  @override
  void didDisposeProvider(ProviderBase provider,ProviderContainer container) {
    print('Provider disposed: $provider');

    // Perform any necessary actions when a provider is disposed
  }
}
