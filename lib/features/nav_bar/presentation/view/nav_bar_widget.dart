import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import '../../../ai/memo_screen.dart';
import '../../../map/views/map_home.dart';
import '../../../planet_animation/views/planet_home_widget.dart';
import '../../../profile_feature/presentation/view/profileFeature.dart';
import 'widgets/tab_bar.dart';

class NavBarViews extends StatefulWidget {
  const NavBarViews({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NavBarViews>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  @override
  void initState()   {


    currentPage = 2;
    tabController = TabController(length: 5, vsync: this, initialIndex: 2);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomBar(
        fit: StackFit.expand,
        borderRadius: BorderRadius.circular(500),
        duration: const Duration(seconds: 1),
        curve: Curves.decelerate,
        showIcon: true,
        width: MediaQuery.of(context).size.width * 0.8,
        barColor: Theme.of(context).hintColor,
        offset: 10,
        barAlignment: Alignment.bottomCenter,
        iconHeight: 35,
        iconWidth: 35,
        reverse: false,
        hideOnScroll: false,
        scrollOpposite: false,
        onBottomBarHidden: () {},
        onBottomBarShown: () {},
        body: (context, controller) => TabBarView(
          controller: tabController,
          dragStartBehavior: DragStartBehavior.down,
          physics: const BouncingScrollPhysics(),
          children:  [
            SizedBox(),
            LevelMapPage(),
            PlanetExploreHome(),
            MemoScree(),
            ProfileFeature(),
            // FavoriteFeature( ),
            // MenuFeature(),
            // HomeEditFeature(),
            // ResultsFeature(),
            // ProfileFeature(),
          ],
        ),
        child: TabBar(
          indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
          controller: tabController,
          indicator: UnderlineTabIndicator(
              borderSide:
                  BorderSide(color: Colors.white, width: 4),
              insets: const EdgeInsets.fromLTRB(16, 0, 16, 8)),
          tabs: [
            TabBarIcon(
              selectedIcon: Icons.favorite,
              unselectedIcon: Icons.favorite_border,
              iconSelected: currentPage == 0,
            ),
            TabBarIcon(
              selectedIcon: Icons.menu_book,
              unselectedIcon: Icons.menu_book_outlined,
              iconSelected: currentPage == 1,
            ),
            TabBarIcon(
              selectedIcon: Icons.home,
              unselectedIcon: Icons.home_outlined,
              iconSelected: currentPage == 2,
            ),
            TabBarIcon(
              selectedIcon: Icons.local_fire_department_rounded,
              unselectedIcon: Icons.local_fire_department_outlined,
              iconSelected: currentPage == 3,
            ),
            TabBarIcon(
              selectedIcon: Icons.person,
              unselectedIcon: Icons.person_2_outlined,
              iconSelected: currentPage == 4,
            ),
          ],
        ),
      ),
    );
  }
}


