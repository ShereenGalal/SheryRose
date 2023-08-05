import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:sheryrose/Pages/LogIn.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: SingleChildScrollView(
        controller: ScrollController(),
        child: const Image(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/onboarding1.jpg')),
      ),
    ),
    PageModel(
      widget: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: const [
            Image(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/onboarding2.jpg'))
          ],
        ),
      ),
    ),
    PageModel(
      widget: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: const [
            Image(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/onboarding3.jpg'))
          ],
        ),
      ),
    ),
  ];
  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: const Color(0xffC6BDC2),
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: const Color(0xffAC7B81),
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LogIn()),
          );
        },
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Sign up',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIndicator(
                      netDragPercent: dragDistance,
                      pagesLength: pagesLength,
                      indicator: Indicator(
                        indicatorDesign: IndicatorDesign.line(
                          lineDesign: LineDesign(
                            lineType: DesignType.line_uniform,
                          ),
                        ),
                      ),
                    ),
                    index == pagesLength - 1
                        ? _signupButton
                        : _skipButton(setIndex: setIndex)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
