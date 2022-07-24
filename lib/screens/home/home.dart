// ignore_for_file: unused_local_variable

import 'package:diabe/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      body: Consumer<HomeProvider>(builder: (context, provider, _) {
        return provider.homeChild[provider.selectedIndex];
      }),
      bottomNavigationBar:
          Consumer<HomeProvider>(builder: (context, provider, _) {
        return BottomNavigationBar(
          selectedItemColor: activeChildColor,
          unselectedItemColor: inActiveChildColor,
          currentIndex: provider.selectedIndex,
          onTap: provider.onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard_outlined,
                  size: 26,
                ),
                activeIcon: ActiveIcon(
                  icon: Icon(
                    Icons.dashboard_outlined,
                    size: 26,
                  ),
                ),
                tooltip: 'Home',
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.poll_outlined,
                  size: 26,
                ),
                activeIcon: ActiveIcon(
                  icon: Icon(
                    Icons.poll_outlined,
                    size: 26,
                  ),
                ),
                tooltip: 'Report',
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.history_rounded,
                  size: 26,
                ),
                activeIcon: ActiveIcon(
                  icon: Icon(
                    Icons.history_rounded,
                    size: 26,
                  ),
                ),
                tooltip: 'Report history',
                label: '')
          ],
        );
      }),
    );
  }
}

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({Key? key, required this.icon}) : super(key: key);
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 20,
          child: Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  //                    <--- top side
                  color: blueRound,
                  width: 3.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
