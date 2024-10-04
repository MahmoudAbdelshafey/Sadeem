
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sadeem_application/features/planet_animation/views/planet_name.dart';

import 'astronaut.dart';
import 'model.dart';
import 'planet_selector.dart';

class PlanetExploreHome extends StatefulWidget {
  @override
  PlanetExploreHomeState createState() {
    return new PlanetExploreHomeState();
  }
}

class PlanetExploreHomeState extends State<PlanetExploreHome> {
  final List<Planet> _planets = planets;
  int _currentPlanetIndex = 2;
  final StreamController _navigationStreamCntrllr =
  StreamController.broadcast();

  dispose() {
    _navigationStreamCntrllr.close();
    super.dispose();
  }

  _handleArrowClick(ClickDirection direction) {
    setState(() {
      switch (direction) {
        case ClickDirection.Left:
          _currentPlanetIndex--;
          break;
        case ClickDirection.Right:
          _currentPlanetIndex++;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size ;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: <Widget>[
                Container(

                  child: Column(

                    children: [
                      FractionalTranslation(
                        translation: Offset(0.0, 0.65),
                        child: PlanetSelector(

                          screenSize: screenSize,
                          planets: _planets,
                          currentPlanetIndex: _currentPlanetIndex,
                          onArrowClick: _handleArrowClick,
                          onPlanetClicked: () => _navigationStreamCntrllr.sink.add(null),
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  height: screenSize.height,
                ),
                Container(
                  height: screenSize.height * 0.8,
                  width: double.infinity,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Container(
                            width: 400.0,
                            padding: EdgeInsets.only(left: 50.0),
                            child: PlanetName(
                              name: _planets[_currentPlanetIndex].name.toUpperCase(),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Astronaut(
                          size: screenSize,
                          planets: _planets,
                          currentPlanetIndex: _currentPlanetIndex,
                          shouldNavigate: _navigationStreamCntrllr.stream,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: screenSize.height*0.06,),
          )
        ],
      ),
    );
  }
}
