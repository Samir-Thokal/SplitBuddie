import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:splitbuddie/features/Home/home_page.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/images/logo.png',
      height: 150,
      width: 150,
      alignment: Alignment.center,
    );
  }

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 26.0,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(
          54,
          99,
          110,
          1,
        ),
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo.png",
            height: 150,
            width: 150,
          ),
          IntroductionScreen(
            key: introKey,
            globalBackgroundColor: Colors.green,
            allowImplicitScrolling: true,
            autoScrollDuration: 3000,
            globalHeader: Align(
              alignment: Alignment.center,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16),
                  child: _buildFullscreenImage(),
                ),
              ),
            ),
            globalFooter: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                child: const Text(
                  'Let\'s go right away!',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                onPressed: () => _onIntroEnd(context),
              ),
            ),
            pages: [
              PageViewModel(
                title: "Welcome to SplitBuddie",
                body: "Instead of having to buy an entire share, invest any amount you want.",
                // image: _buildFullscreenImage(),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: "Learn as you go",
                body: "Download the Stockpile app and master the market with our mini-lesson.",
                image: _buildFullscreenImage(),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: "Kids and teens",
                body: "Kids and teens can track their stocks 24/7 and place trades that you approve.",
                image: _buildFullscreenImage(),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: "Full Screen Page",
                body:
                    "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
                image: _buildFullscreenImage(),
                decoration: pageDecoration.copyWith(
                  contentMargin: const EdgeInsets.symmetric(horizontal: 16),
                  fullScreen: true,
                  bodyFlex: 2,
                  imageFlex: 3,
                  safeArea: 100,
                ),
              ),
            ],
            onDone: () => _onIntroEnd(context),
            //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
            showSkipButton: false,
            skipOrBackFlex: 0,
            nextFlex: 0,
            showBackButton: true,
            //rtl: true, // Display as right-to-left
            back: const Icon(Icons.arrow_back),
            skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
            next: const Icon(Icons.arrow_forward),
            done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
            curve: Curves.fastLinearToSlowEaseIn,
            controlsMargin: const EdgeInsets.all(16),
            dotsDecorator: const DotsDecorator(
              size: Size(10.0, 10.0),
              color: Color(0xFFBDBDBD),
              activeSize: Size(22.0, 10.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
            dotsContainerDecorator: const ShapeDecoration(
              color: Colors.black87,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
          )
        ],
      ),
    );
  }
}