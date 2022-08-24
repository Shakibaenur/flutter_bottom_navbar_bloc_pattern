import 'package:bottom_navbar_bloc_pattern/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:bottom_navbar_bloc_pattern/ui/dashboard/dashBoard.dart';
import 'package:bottom_navbar_bloc_pattern/ui/profile/profile.dart';
import 'package:bottom_navbar_bloc_pattern/ui/setting/setting.dart';
import 'package:bottom_navbar_bloc_pattern/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => Home();
}

class Home extends State<HomeScreen> {
  late List<Widget> _pages;
  late Widget _page1;
  late Widget _page2;
  late Widget _page3;

  @override
  void initState() {
    _page1 = const DashBoardScreen();
    _page2 = const ProfileScreen();
    _page3 = const SettingScreen();
    _pages = [_page1, _page2, _page3];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: AppBar(
              title: Text(
                Constants.bottomNavigationItemList[getCurrentIndex(state)],
              ),
              backgroundColor: Colors.blue,
              centerTitle: true,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: getCurrentIndex(state),
            type: BottomNavigationBarType.fixed,
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.dashboard),
                label: Constants.bottomNavigationItemList[0],
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person_sharp),
                label: Constants.bottomNavigationItemList[1],
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: Constants.bottomNavigationItemList[2],
              ),
            ],
            selectedItemColor: Colors.blue,
            onTap: (index) {
              BlocProvider.of<BottomNavigationBloc>(context)
                  .getBottomNavItem(index);
            },
          ),
          body: bottomNavigationBody(),
        );
      },
    );
  }

  Widget bottomNavigationBody() {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        if (state is BottomNavigationInitial) {
          return _pages[state.index];
        }
        return Container();
      },
    );
  }

  getCurrentIndex(BottomNavigationState state) {
    if (state is BottomNavigationInitial) {
      return state.index;
    }
  }
}
