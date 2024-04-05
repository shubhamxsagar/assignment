import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mxpertx/core/themes/app_pallete.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;
  const HomeScreen({required this.navigationShell, Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  void displayDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void displayEndDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  void onPageChanged(context, index) {
    widget.navigationShell.goBranch(index,
        initialLocation: index == widget.navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: widget.navigationShell,
      drawer: Container(),
      bottomNavigationBar: CupertinoTabBar(
        activeColor: currentTheme.iconTheme.color,
        backgroundColor: currentTheme.backgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  'assets/svg/home.svg', // Replace with your SVG path
                  width: 24,
                  height: 24,
                )),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  'assets/svg/comment.svg', // Replace with your SVG path
                  width: 24,
                  height: 24,
                )),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  'assets/svg/message.svg', // Replace with your SVG path
                  width: 24,
                  height: 24,
                )),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  'assets/svg/person.svg', // Replace with your SVG path
                  width: 24,
                  height: 24,
                )),
            label: '',
          ),
        ],
        onTap: (int index) => onPageChanged(context, index),
        currentIndex: widget.navigationShell.currentIndex,
      ),
    );
  }
}
