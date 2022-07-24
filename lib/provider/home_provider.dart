import 'package:diabe/screens/dashboard/dashboard.dart';
import 'package:diabe/screens/report/history.dart';
import 'package:diabe/screens/report/report.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int selectedIndex = 0;
  int index = 0;
  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> homeChild = [
    const HomePage(),
    const ReportScreen(),
    const HistoryScreen(),
    Container(),
    Container()
  ];

  PageController controller = PageController();

  changePage(int indx) {
    controller.jumpToPage(indx);
    index = indx;
    notifyListeners();
  }

  pageChanged() {
    index = controller.page!.round();
    notifyListeners();
  }

  int _currentPage = 0;
  int get currentPage => _currentPage;

  setCurrentPage(int val) {
    _currentPage = val;
    notifyListeners();
  }
}
