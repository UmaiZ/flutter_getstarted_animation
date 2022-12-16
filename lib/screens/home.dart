import 'package:flutter/material.dart';
import 'package:flutter_animated_starter/helpers/colors.dart';
import 'package:flutter_animated_starter/screens/getstarted.dart';
import 'package:flutter_animated_starter/widgets/backgroundcircle.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool _isContainerVisible = false;
  bool up = false;
  late AnimationController controller;
  final _player = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      _updateSize();
    });
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(seconds: 2),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) controller.reverse();
        if (status == AnimationStatus.dismissed) controller.forward();
      });
    ;
    controller.forward();
  }

  void _updateSize() {
    setState(() {
      _isContainerVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final res_width = MediaQuery.of(context).size.width;
    final res_height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: res_height * 0.1,
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            height: _isContainerVisible ? res_width * 0.9 : 0.0,
            width: _isContainerVisible ? res_width * 0.9 : 0.0,
            curve: Curves.easeOut,
            child: Stack(
              alignment: Alignment.center,
              children: [
                BackgroundCircle(
                  circleWidth: res_width * 0.9,
                  circleBorderWidth: 80.0,
                  circleOpacity: 0.1,
                  circleColor: Colors.grey,
                ),
                BackgroundCircle(
                  circleWidth: res_width * 0.8,
                  circleBorderWidth: 40.0,
                  circleOpacity: 0.2,
                  circleColor: Colors.grey,
                ),
                SlideTransition(
                  position: Tween<Offset>(
                          begin: Offset(0, -0.15), end: Offset(0, 0.15))
                      .animate(controller),
                  child: Image.asset('assets/images/character-2.png'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: res_height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
                "The time that leads to mastery is dependent on the intensity of our focus.",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .merge(TextStyle(color: Colors.grey))
                // style: TextStyle(color: Colors.grey),
                ),
          ),
          SizedBox(
            height: res_height * 0.05,
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () async {
                // await _player.setAsset('assets/audio/success.m4a');
                // _player.play();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GetStarted()),
                );
              },
              child: Container(
                width: res_width * 0.32,
                decoration: const BoxDecoration(
                    color: kprimarycolor,
                    borderRadius: BorderRadius.all(Radius.circular(13))),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.restart_alt,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Restart',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .merge(const TextStyle(color: Colors.white)))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
