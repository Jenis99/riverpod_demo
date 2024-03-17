import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_demo/logger_riverpod.dart';
import 'package:riverpod_demo/model/api_model.dart';
import 'package:riverpod_demo/model/user.dart';
import 'package:riverpod_demo/provider_class.dart';
// par

//providers
//(1) provider
//(2) SateProvider
//(3) StateNotifier and StateNotifierProvider
//(4) changeNotifierProvider and StateNotifier ///not recommendation
//(5) FutureProvider
//(6) StreamProvider

///---->((1))
final nameProvider = Provider<String>((ref) => "Varnish");

///---->((2))
final nameProviderState = StateProvider<String>((ref) => "");

///---->((3))
final nameProviderStateNotifier = StateNotifierProvider<UserNotifier, User>(
  ((ref) => UserNotifier(
        const User(name: "", age: 0),
      )),
);

///---->((4))
final nameChangeNotifier = ChangeNotifierProvider((ref) => UserNotifierChange());

///---->((5))
final fetchUSerProvider = FutureProvider((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData();
});

///---->((6))
final streamProvider = StreamProvider((ref) async* {
  yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
});

///---->((7)) .family--->argument pass krva
///---->((8)) .autoDispose--->automatic dispose kare che provider ne
///---->((9)  ref.keepAlive()---> dispose krya pachi live krva mate
///---->((9)  ref.onDispose()---> dispose krva
///---->((10)  ref.onCancel()--->..pause krva mate
///---->((11)  ref.onResume()--->..pause krya pachi pacho sharu krva mate
///---->((12)  ref.onRemoveListener()--->
///---->((12)  ref.onAddListener()--->
///---->((13)  riverpod annotation and generator


//            packages---> riverpod_annotation, build_runner ,riverpod_generator


// @override
// Future<ApiModel> fetchUser(FetchUserRef ref,String input)
// {
//   final userRepository = ref.watch(userRepositoryProvider);
//   return userRepository.fetchUserData();
// }

// final fetchUSerProviderS = FutureProvider.family.autoDispose((ref, String input) {
//   ///---> you can access a family member using this
//   final userRepository = ref.watch(userRepositoryProvider);
//   return userRepository.fetchUserData();
// });

/// return ref.watch(fetchUSerProvider(input));
/// argument pass krva mate only one argument pass thay che............tena mate (((((---tuple: ^2.0.2---))))) no use thay che

/// ref ---------------> provider to provider call krva mate
/// WidgetRef ref------> Widget mathi provider call krva mate use thay
/// provider ref-------> provider to another  provider

void main() {
  runApp(
    ProviderScope(
      observers: [
        MyProviderObserver(),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstProviderEx(),
    );
  }
}
