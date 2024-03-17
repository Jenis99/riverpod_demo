import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/main.dart';

/// ((1))----> ConsumerWidget,Widget ref
// class FirstProviderEx extends ConsumerWidget {
//   const FirstProviderEx({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final name = ref.watch(nameProvider);
//     return Scaffold(
//       body: Column(children: [
//         Center(
//           child: Text(name),
//         )
//       ]),
//     );
//   }
// }

/// ((2))----> Consumer Builder chages in buildWidget

///final name = ref.watch(nameProvider); watch continuously value read kare che ------> WidgetBuild ni andar use krvo
///final nameS=ref.read(nameProvider);   one time value read kare che           ------> WidgetBuild ni bar use krvo
// class FirstProviderEx extends StatelessWidget {
//   const FirstProviderEx({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Consumer(
//               builder: (context, ref, child) {
//                 final name = ref.watch(nameProvider);///-----> watch continuously value read kare che ------> WidgetBuild ni andar use krvo
//                 final nameS=ref.read(nameProvider);///-------> one time value read kare che           ------> WidgetBuild ni bar use krvo
//                 return Column(children: [
//                   Center(
//                     child: Text(name),
//                   )
//                 ]);
//               },
//               // child: ,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/// ((3))----> ConsumerStateFullWidget , ConsumerStatelessWidget

/// ((4))---->SateProvider
// class FirstProviderEx extends ConsumerWidget {
//   const FirstProviderEx({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     void onSubmittedD(WidgetRef ref, String value) {
//       ref.read(nameProviderState.notifier).update((state) => value);
//     }
//     final name = ref.watch(nameProviderState);
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Consumer(
//               builder: (context, ref, child) {
//                 return Column(children: [
//                   TextField(onSubmitted: (value) => onSubmittedD((ref), value),),
//                   Center(
//                     child: Text(name),
//                   )
//                 ]);
//               },
//               // child: ,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/// ((5))---->StateNotifier
// class FirstProviderEx extends ConsumerWidget {
//   const FirstProviderEx({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     void onSubmittedD(WidgetRef ref, String value) {
//       ref.read(nameProviderStateNotifier.notifier).updateName(value);
//     }
//
//     void onSubmittedAge(WidgetRef ref, String value) {
//       ref.read(nameProviderStateNotifier.notifier).updateAge(int.parse(value));
//     }
//
//     final user = ref.watch(nameProviderStateNotifier);
//     final userS= ref.watch(nameProviderStateNotifier.select((value) => value.name));///select thi only one property j update thay che
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Consumer(
//               builder: (context, ref, child) {
//                 return Column(children: [
//                   TextField(
//                     onSubmitted: (value) => onSubmittedD((ref), value),
//                   ),
//                   TextField(
//                     onSubmitted: (value) => onSubmittedAge((ref), value),
//                   ),
//                   Center(
//                     child: Text(user.name.toString()),
//                   ),
//                   Center(
//                     child: Text(user.age.toString()),
//                   )
//                 ]);
//               },
//               // child: ,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/// ((5))---->UserNotifierChange
// class FirstProviderEx extends ConsumerWidget {
//   const FirstProviderEx({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     void onSubmittedD(WidgetRef ref, String value) {
//       ref.read(nameChangeNotifier.notifier).updateName(value);
//     }
//
//     void onSubmittedAge(WidgetRef ref, String value) {
//       ref.read(nameChangeNotifier.notifier).updateAge(int.parse(value));
//     }
//
//     final user = ref.watch(nameChangeNotifier).user;
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Consumer(
//               builder: (context, ref, child) {
//                 return Column(children: [
//                   TextField(
//                     onSubmitted: (value) => onSubmittedD((ref), value),
//                   ),
//                   TextField(
//                     onSubmitted: (value) => onSubmittedAge((ref), value),
//                   ),
//                   Center(
//                     child: Text(user.name.toString()),
//                   ),
//                   Center(
//                     child: Text(user.age.toString()),
//                   )
//                 ]);
//               },
//               // child: ,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/// ((6))---->UserNotifierChange
// class FirstProviderEx extends ConsumerWidget {
//   const FirstProviderEx({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ref.watch(fetchUSerProvider).when(
//       data: (data) {
//         return Scaffold(
//           body: Column(
//             children: [
//               Text(data.name),
//             ],
//           ),
//         );
//       },
//       error: (error, stackTrace) {
//         return Center(
//           child: Text(error.toString()),
//         );
//       },
//       loading: () {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//   }
// }


/// ((6))---->StreamProvider
class FirstProviderEx extends ConsumerWidget {
  const FirstProviderEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(streamProvider).when(
      data: (data) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Text(data.toString()),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(error.toString()),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}