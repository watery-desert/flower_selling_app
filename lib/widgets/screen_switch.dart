import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenSwitch extends StatelessWidget {
  final ScreenSwitchController controller;
  final List<Widget> screens;

  const ScreenSwitch({Key? key, required this.controller, required this.screens})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => controller,
        child: Consumer(
          builder: (BuildContext context, ScreenSwitchController value,
              Widget? child) {
            return PageTransitionSwitcher(
              reverse: value.forwardAnimation(),
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation, secondaryAnimation) {
                return FadeThroughTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  fillColor: Colors.transparent,
                  child: child,
                );
              },
              child: screens[value.selectedIndex],
            );
          },
        ),
      ),
    );
  }
}

class ScreenSwitchController extends ChangeNotifier {
  ScreenSwitchController(this._selectedScreenIndex)
      : _previousScreenIndex = _selectedScreenIndex;

  int _previousScreenIndex;
  int _selectedScreenIndex;
  int get selectedIndex => _selectedScreenIndex;

  void updateIndex({ required int currentIndex}) {
    _previousScreenIndex = _selectedScreenIndex;
    _selectedScreenIndex = currentIndex;
    notifyListeners();
  }

  bool forwardAnimation() {
    if (_selectedScreenIndex - _previousScreenIndex > 0) {
      return false;
    } else {
      return true;
    }
  }
}
