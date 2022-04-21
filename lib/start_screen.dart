import 'package:flappy_bird_clone/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'lib/images/start_wallpaper.jpg',
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8,
          ),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                'lib/images/download.png',
                width: deviceWidth / 2,
              ),
              const Spacer(),
              const Text(
                'Flappy Bird',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Spacer(),
              // MenuButton(
              //   width: deviceWidth,
              //   color: Colors.blue,
              //   textColor: Colors.white,
              //   text: 'Start Game',
              //   onPress: () {
              //     Navigator.of(context).pushNamed(HomePage.ROUTE_NAME);
              //   },
              // ),
              SizedBox(
                width: deviceWidth,
                height: 52,
                child: ElevatedButton(
                  child: const Text(
                    'Start Game',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomePage.ROUTE_NAME);
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              // MenuButton(
              //   width: deviceWidth,
              //   color: Colors.red,
              //   textColor: Colors.white,
              //   text: 'Quit',
              //   onPress: () {
              //     SystemNavigator.pop();
              //   },
              // ),
              SizedBox(
                width: deviceWidth,
                height: 52,
                child: ElevatedButton(
                  child: const Text(
                    'Quit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
