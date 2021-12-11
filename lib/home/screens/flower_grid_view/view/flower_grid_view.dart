import 'package:flowers_repository/flowers_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../widgets/loading_widget.dart';
import '../bloc/all_flowers_bloc.dart';
import 'build_tile.dart';

class FlowerGridView extends StatelessWidget {
  const FlowerGridView._(Key? key) : super(key: key);

  static Widget show(BuildContext context, {Key? key}) {
    return BlocProvider<AllFlowersBloc>(
      create: (context) => AllFlowersBloc(
        flowersRepo: context.read<FlowersRepo>(),
      )..add(LoadFlowers()),
      child: FlowerGridView._(key),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AllFlowersBloc, AllFlowersState>(
        builder: (context, state) {
          if (state is AllFlowersLoading) {
            return const LoadingWidget();
          } else if (state is AllFlowersLoaded) {
            if (state.flowers.isEmpty) {
              /// ⚠️⚠️⚠️ Warning!
              /// Don't mad at me this is only to populate
              /// the cloud firestore. Don't do it in your app.
              ///
              // try {
              context.read<FlowersRepo>().uploadAllFlowersData();
              // } catch (_) {
              //   print('did you forget');
              // }
              return Container();
            } else {
              return AnimationLimiter(
                child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    children: [
                      ...state.flowers.map(
                        (flower) => AnimationConfiguration.staggeredGrid(
                          columnCount: 2,
                          position: state.flowers.indexOf(flower),
                          duration: const Duration(milliseconds: 800),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: BuildTile(
                                flower: flower,
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
              );
            }
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}

// class UploadFlowers extends StatelessWidget {
//   const UploadFlowers({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text(
//             'This button will populate the firebase cloud storage database instead of manually adding, You need to tap once.',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           FilledButton(
//             color: uploaded ? Colors.green : null,
//             title: getText(),
//             onTap: uploading
//                 ? null
//                 : () {
//                     if (uploaded) {
//                       showMessage(
//                         context: context,
//                         icon: Icons.check_circle_outline_outlined,
//                         code: "Already updated",
//                         message: "You can't update more than once.",
//                       );
//                     } else {
//                       context.read<UploadFlowersCubit>().uploadData();
//                     }
//                   },
//           )
//         ],
//       ),
//     );
//   }
// }
