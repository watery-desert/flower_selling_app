import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../authentication/authentication_view.dart';

import 'build_page.dart';
import 'top_bar.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _navigateToSigin() {
    Navigator.of(context).push(AuthenticationView.show());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TopBar(
              controller: _pageController,
              onTap: _navigateToSigin,
            ),
            Expanded(
                child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const <Widget>[
                BuildPage(
                  assetLink: 'assets/images/flower.png',
                  title: 'Best quality flower',
                ),
                BuildPage(
                  assetLink: 'assets/images/wallet.png',
                  title: 'Budget friendly price',
                ),
                BuildPage(
                  assetLink: 'assets/images/truck.png',
                  title: 'Fast delivery',
                ),
              ],
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _currentPage++;
          if (_currentPage == 3) {
            _navigateToSigin();
          } else {
            _pageController.animateToPage(_currentPage,
                duration: const Duration(milliseconds: 1500),
                curve: Curves.elasticOut);
          }
        },
        tooltip: 'Next Page',
        child: Transform.translate(
          offset: const Offset(2, 0),
          child: const Icon(FontAwesomeIcons.play),
        ),
      ),
    );
  }
}
