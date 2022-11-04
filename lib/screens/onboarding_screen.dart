import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/styles/colors.dart';
import 'package:flutter_todo_app/routes.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  static int currentIndex = 0;

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingCard> cards = [
    OnBoardingCard(
        title: "Manage Your Task",
        description:
            "With This Small App You Can Organize All Your Tasks And Duties In A One Single App",
        image: 'assets/images/onboardingone.png'),
    OnBoardingCard(
        title: "Manage Your Task",
        description:
            "With this small app you can organize All your tasks and duties and in a one Single app",
        image: 'assets/images/onboardingtwo.png'),
    OnBoardingCard(
        title: "Manage Your Task",
        description:
            "With this small app you can organize All your tasks and duties and in a one Single app",
        image: 'assets/images/onboardingthree.png'),
  ];

  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.welcomeScreen);
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 4),
                      child: Text('Skip'),
                    ),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.secondary),
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(24),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      OnBoardingScreen.currentIndex = value;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    return MainContent(cards: cards, index: index);
                  }),
            ),
            //  MainContent(cards: cards, index: index),
            OnBoardingNavigationWidgets(
              cards: cards,
              pageController: _pageController,
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingNavigationWidgets extends StatefulWidget {
  const OnBoardingNavigationWidgets({
    Key? key,
    required this.cards,
    required this.pageController,
  }) : super(key: key);

  final List<OnBoardingCard> cards;
  final PageController pageController;

  @override
  State<OnBoardingNavigationWidgets> createState() =>
      _OnBoardingNavigationWidgetsState();
}

class _OnBoardingNavigationWidgetsState
    extends State<OnBoardingNavigationWidgets> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              if (OnBoardingScreen.currentIndex >= 0 &&
                  OnBoardingScreen.currentIndex < widget.cards.length) {
                if (OnBoardingScreen.currentIndex >= 0 &&
                    OnBoardingScreen.currentIndex < widget.cards.length - 1) {
                  widget.pageController.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeIn);
                }
                if (OnBoardingScreen.currentIndex == widget.cards.length - 1) {
                  Navigator.pushReplacementNamed(context, Routes.welcomeScreen);
                }
              }
            },
            child: (OnBoardingScreen.currentIndex == widget.cards.length - 1)
                ? const Icon(Icons.check)
                : const Icon(Icons.arrow_right_alt_sharp),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(20),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.pink.shade200),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (OnBoardingScreen.currentIndex > 0 &&
                          OnBoardingScreen.currentIndex < widget.cards.length) {
                        widget.pageController.previousPage(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.easeIn);
                        OnBoardingScreen.currentIndex--;
                      }
                    });
                  },
                  child: Text(
                    'Back',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(fontSize: 13),
                  ),
                ),
                Row(
                  children: List.generate(
                    widget.cards.length,
                    (index) => buildDot(index, context),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    width: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    // Another Container returned
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: index == OnBoardingScreen.currentIndex
            ? AppColors.black
            : Colors.grey,
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
    required this.cards,
    required this.index,
  }) : super(key: key);

  final List<OnBoardingCard> cards;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          cards[index].image,
          scale: 7,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          cards[index].title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            cards[index].description,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}

class OnBoardingCard {
  final String title;
  final String image;
  final String description;

  OnBoardingCard(
      {required this.title, required this.description, required this.image});
}

// class CustomDesign extends CustomPainter {
//   final Color color;
//
//   const CustomDesign({required this.color});
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 5
//       ..color = color;
//
//     final path = Path();
//
//     // path.addRect(Rect.fromCenter(
//     //   center: Offset(0, 0),
//     //   width: size.width,
//     //   height: size.height + 10,
//     // ));
//
//     //path.lineTo(0, size.height - 100);
//     // path.quadraticBezierTo(
//     //    size.width * 0.1, size.height - 50, size.width * .5, size.height - 90);
//
//     // path.quadraticBezierTo(size.width - (size.width * 0.1), size.height - 35,
//     //     size.width, size.height - 100);
//
//     path.lineTo(size.width, 0);
//     path.lineTo(0, 0);
//     path.close();
//
//     canvas.drawPath(path, paint);
//
//     canvas.drawRect(
//         Rect.fromCenter(
//           center: Offset(100, 120),
//           width: size.width + 200,
//           height: size.height + 50,
//         ),
//         paint);
//
//     // canvas.drawArc(Rect.fromCircle(center: Offset(50, -4), radius: 40), 0.1, 5,
//     //     true, Paint()..color = Colors.grey.shade50);
//
//     const circleRadius = 55.0;
//     var circleCenter = Offset(size.width * .5, size.height - 80);
//
//     // canvas.drawCircle(circleCenter, circleRadius, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
