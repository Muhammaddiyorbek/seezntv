import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seezntv/assets_model/assets_model.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': AssetsModel.onboardingLogo1,
      'title': 'Lorem ipsum dolor sit amet consecteur esplicit',
      'description':
          'Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem semper parturient. ',
    },
    {
      'image': AssetsModel.onboardingLogo2,
      'title': 'Lorem ipsum dolor sit amet consecteur esplicit',
      'description':
          'Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem semper parturient. ',
    },
    {
      'image': AssetsModel.onboardingLogo3,
      'title': 'Lorem ipsum dolor sit amet consecteur esplicit',
      'description':
          'Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem semper parturient. ',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 29, 43, 1),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        color: Color.fromRGBO(23, 23, 31, 1),
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          _pages[index]['image']!,
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Text(
                    _pages[_currentPage]['title']!,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _pages[_currentPage]['description']!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: List.generate(
                          _pages.length,
                          (index) => Container(
                            margin: const EdgeInsets.only(right: 8),
                            width: index == _currentPage ? 24 : 8,
                            height: index == _currentPage ? 4 : 8,
                            decoration: BoxDecoration(
                              color: index == _currentPage
                                  ? const Color(0xFFFF4D4D)
                                  : Colors.grey.withOpacity(0.5),
                              borderRadius: index == _currentPage
                                  ? BorderRadius.circular(2)
                                  : null,
                              shape: index == _currentPage
                                  ? BoxShape.rectangle
                                  : BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_currentPage < _pages.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          } else {
                            Navigator.pushNamed(context, '/auth-page');
                          }
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage(
                                _currentPage == 0
                                    ? AssetsModel.floatb1
                                    : _currentPage == 1
                                        ? AssetsModel.floatb2
                                        : AssetsModel.floatb3,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
