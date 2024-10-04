import 'package:flutter/material.dart';
import 'package:level_map/level_map.dart';
import 'package:page_transition/page_transition.dart';

import '../../../generated/assets.dart';
import 'map_stars.dart';

class LevelMapPage extends StatefulWidget {
  @override
  _LevelMapPageState createState() => _LevelMapPageState();
}

class _LevelMapPageState extends State<LevelMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.sizeOf(context).height,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(Assets.mapSpacewal4), fit: BoxFit.cover)
              ),
              child: LevelMap(
                scrollToCurrentLevel: true,
                levelMapParams: LevelMapParams(
                  dashLengthFactor: 0.1,

                  levelCount: 40,
                  currentLevel: 20,
                  pathColor: Colors.white,
                  // here put the star
                  currentLevelImage: ImageParams(
                    path: Assets.mapCurrentBlack,
                    size: Size(40, 47),
                  ),
                  // here put the star
                  lockedLevelImage: ImageParams(
                    path: Assets.mapLockedBlack,
                    size: Size(40, 42),
                  ),
                  completedLevelImage: ImageParams(
                    path: Assets.mapCompletedBlack,
                    size: Size(40, 42),
                  ),
                  startLevelImage: ImageParams(
                    path: Assets.mapBoyStudy,
                    size: Size(60, 60),
                  ),
                  pathEndImage: ImageParams(
                    path: Assets.mapBoyGraduation,
                    size: Size(60, 60),
                  ),
                  // images for the background
                  bgImagesToBePaintedRandomly: [
                    ImageParams(
                        path: Assets.mapFirst,
                        size: Size(40, 40),
                        repeatCountPerLevel: 0.1),
                    ImageParams(
                        path: Assets.mapSec,
                        size: Size(40, 40),
                        repeatCountPerLevel: 0.1),
                    ImageParams(
                        path: Assets.mapThird,
                        size: Size(40, 40),
                        repeatCountPerLevel: 0.1),
                    ImageParams(
                        path: Assets.mapFourth,
                        size: Size(40, 40),
                        repeatCountPerLevel: 0.1),
                    ImageParams(
                        path: Assets.mapFifth,
                        size: Size(40, 40),
                        repeatCountPerLevel: 0.1),
                    ImageParams(
                        path: Assets.mapSix,
                        size: Size(40, 40),
                        repeatCountPerLevel: 0.1),
                    ImageParams(
                        path: Assets.mapSeven,
                        size: Size(40, 40),
                        repeatCountPerLevel: 0.1),
                    ImageParams(
                        path: Assets.mapEight,
                        size: Size(40, 40),
                        repeatCountPerLevel: 0.1),
                  ],
                ),
              ),
            ),
          )
        ],

      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: FloatingActionButton(

          backgroundColor: Colors.black,
          child: const Icon(
            Icons.bolt,
            color: Colors.white,
          ),
          onPressed: () {
            // setState(() {
            //   //Just to visually see the change of path's curve.
            // });
            Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: const StarsDetails(),
                ));
          },
        ),
      ),
    );
  }
}
