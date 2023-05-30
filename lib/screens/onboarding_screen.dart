import 'package:flutter/material.dart';
import 'package:calmind_mitra/screens/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<String> _slideImages = [
    'assets/images/onboarding_1.png',
    'assets/images/onboarding_2.png',
    'assets/images/onboarding_3.png',
    'assets/images/onboarding_4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: _slideImages.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildSlide(_slideImages[index]);
            },
          ),
          Positioned(
            bottom: 60.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
          ),
          _buildSkipButton(),
          _buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildSlide(String image) {
    if (image == 'assets/images/onboarding_1.png') {
      return Center(
        child: Image.asset(
          image,
          width: 900,
          height: 900,
          fit: BoxFit.contain,
        ),
      );
    } else {
      return Center(
        child: Image.asset(
          image,
          width: 600,
          height: 600,
          fit: BoxFit.contain,
        ),
      );
    }
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _slideImages.length; i++) {
      indicators.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF6869AC) : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Positioned(
      bottom: 50.0,
      left: 20.0,
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        child: const Text(
          'Skip',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Positioned(
      bottom: 50.0,
      right: 20.0,
      child: TextButton(
        onPressed: () {
          if (_currentPage < _slideImages.length - 1) {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            ); // Add action for next button on last slide
          }
        },
        child: Text(
          _currentPage < _slideImages.length - 1 ? 'Next' : 'Start',
          style: const TextStyle(
            color: Color(0xFF6869AC),
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
