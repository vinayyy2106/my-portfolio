import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
      height: screenHeight,
      constraints: const BoxConstraints(
        maxHeight: 506.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            // child: ShaderMask(
              // shaderCallback: (bounds) {
              //   return LinearGradient(
              //     colors: [
              //       CustomColor.scaffoldBg.withOpacity(1.0),
              //       CustomColor.scaffoldBg.withOpacity(1.0),
              //     ],
              //   ).createShader(bounds);
              // },
              child: Image.asset(
                "assets/image.jpg",
                width: screenWidth / 2,
                alignment: Alignment.center,
              ),
            ),
          // ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            "Hi,\nI'm Vinay Kumar Pabbana\nWeb & App Developer",
            style: TextStyle(
              fontSize: 24.0,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 190,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                backgroundColor: const Color.fromARGB(255, 255, 177, 42),
              ),
              child: const Text("Get in Touch"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}