import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onboarding1.png",
      "message":
          "Discover Thousands of Ebooks\nBrowse through a wide variety of ebooks across genres. Find your next favorite read with ease!"
    },
    {
      "image": "assets/images/onboarding2.png",
      "message":
          "Seamless Reading Experience\nEnjoy a smooth and immersive reading experience with features like adjustable font sizes, night mode, and bookmarks."
    },
    {
      "image": "assets/images/onboarding3.png",
      "message":
          "Secure & Easy Checkout\nWith easy checkout and multiple payment options, buying your next book has never been more convenient!"
    },
  ];

  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      setState(() {
        _currentPage++;
      });
    } else {
      // Handle the end of the onboarding (e.g., navigate to the main app screen)
      // Navigator.pushReplacement(...); // Navigate to the next screen
    }
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: onboardingData.length,
              controller: PageController(initialPage: _currentPage),
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        onboardingData[i]["image"]!,
                        height: 200,
                        width: 200,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        onboardingData[i]["message"]!,
                        style: theme.typography.headlineSmall,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 8,
                      width: _currentPage == index ? 20 : 8,
                      decoration: BoxDecoration(
                        color:
                            _currentPage == index ? theme.primary : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    _currentPage == onboardingData.length - 1
                        ? "Get Started"
                        : "Next",
                    style: theme.typography.labelMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
