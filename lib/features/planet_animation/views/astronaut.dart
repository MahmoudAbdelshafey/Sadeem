import 'dart:async';

import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import 'custom_page_routes.dart';
import 'model.dart';
import 'planet_page.dart';


class Astronaut extends StatefulWidget {
  final  Size? size;
  final List<Planet>? planets;
  final int? currentPlanetIndex;
  final Stream? shouldNavigate;

  const Astronaut(
      {
      this.size ,
      this.planets,
      this.currentPlanetIndex ,
      this.shouldNavigate});
  @override
  AstronautState createState() {
    return new AstronautState();
  }
}

class AstronautState extends State<Astronaut> with TickerProviderStateMixin {
  late AnimationController _smokeAnimController;
  late AnimationController _scaleAnimController;
  late AnimationController _floatingAnimController;
  late Animation<Offset> _floatingAnim;
  late TabController _tabController;
  late StreamSubscription _navigationSubscription;

  @override
  void initState() {
    super.initState();
    _smokeAnimController =
        AnimationController(duration: Duration(seconds: 35), vsync: this);

    _floatingAnimController = AnimationController(
        duration: Duration(milliseconds: 1700), vsync: this);

    _floatingAnim = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 0.025))
        .animate(_floatingAnimController);

    _smokeAnimController.repeat();

    _floatingAnimController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _floatingAnimController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _floatingAnimController.forward();
      }
    });

    _floatingAnimController.forward();

    _tabController = TabController(
        initialIndex: widget.currentPlanetIndex!,
        length: widget.planets!.length,
        vsync: this);

    _navigationSubscription = widget.shouldNavigate!.listen((_) async {
      Navigator.of(context)
          .push(
        MyPageRoute(
          transDuation: Duration(milliseconds: 700),
          builder: (BuildContext context) {
            return PlanetPage(
              currentPlanet: widget.planets![widget.currentPlanetIndex!],
            );
          },
        ),
      )
          .then((_) {
        _scaleAnimController.reverse();
      });

      await _scaleAnimController.forward();
    });

    _scaleAnimController = AnimationController(
        lowerBound: 1.0,
        upperBound: 7.0,
        duration: Duration(milliseconds: 700),
        vsync: this);
  }

  @override
  void didUpdateWidget(Astronaut oldWidget) {
    if (widget.currentPlanetIndex != oldWidget.currentPlanetIndex) {
      _tabController.animateTo(widget.currentPlanetIndex!);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    _smokeAnimController.dispose();
    _floatingAnimController.dispose();
    _tabController.dispose();
    _navigationSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final double size = widget.size!.width * 0.86;
    return SlideTransition(
      position: _floatingAnim,
      child: ScaleTransition(
        scale: _scaleAnimController,
        child: Container(
          width: size,
          height: size,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                Assets.threedSpacesuit,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: size * 0.2,
                left: size * 0.24,
                child: Container(
                  width: size * 0.5,
                  height: size * 0.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  foregroundDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: <Color>[Colors.transparent, Colors.black],
                        stops: [0.1, 0.8]),
                  ),
                  child: ClipOval(
                    child: TabBarView(
                      controller: _tabController,
                      physics: NeverScrollableScrollPhysics(),
                      children: widget.planets!.map((Planet p) {
                        return PlanetViewImg(
                          p.imgBack,
                          planetName: p.name,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -size * 0.6,
                child: RotationTransition(
                  turns: _smokeAnimController,
                  child: Image.asset(
                    Assets.threedSpacesmoke,
                    fit: BoxFit.cover,
                    color: Colors.white,
                    width: size,
                    height: size,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanetViewImg extends StatelessWidget {
  final String planetName;
  final String imgAssetPath;
  const PlanetViewImg(
    this.imgAssetPath, {

    this.planetName = '',
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '$planetName',
      flightShuttleBuilder: (BuildContext flightContext,
          Animation<double> animation,
          HeroFlightDirection flightDirection,
          BuildContext fromHeroContext,
          BuildContext toHeroContext) {
        if (flightDirection == HeroFlightDirection.pop) {
          return Container();
        } else if (flightDirection == HeroFlightDirection.push) {
          return toHeroContext.widget;
        }
        return Container();
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          imgAssetPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
