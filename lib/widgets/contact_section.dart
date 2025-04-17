import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/size.dart';
import 'package:portfolio/constants/snsLinks.dart' as snsLinks;
import 'package:portfolio/constants/Snslinks.dart';
import 'package:portfolio/widgets/custom_text_field.dart';

// ignore: deprecated_member_use
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          const Text(
            "Get in touch",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700, maxHeight: 100),
            child: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth > kMednDeskTopWidth) {
                return buildNameMailField();
              } else {
                return buildNameMailFieldMobile();
              }
            }),
          ),
          const SizedBox(
            height: 15,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: const CustomTextField(
              hintText: "Your message",
              maxLines: 16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: const Color.fromARGB(255, 255, 177, 42),
                ),
                child: const Text('Get in touch'),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ConstrainedBox(constraints: const BoxConstraints(maxWidth: 300),
          child: const Divider(),),
          const SizedBox(height: 15,),
          Wrap(
            spacing: 15,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [Snslinks.github]);
                },
                child: Image.asset(
                  "github.png",
                  width: 25,
                  height: 25,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [Snslinks.fb]);
                },
                child: Image.asset(
                  "facebook.png",
                  width: 25,
                  height: 25,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [Snslinks.linkedin]);
                },
                child: Image.asset(
                  "linkedin.png",
                  width: 25,
                  height: 25,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [Snslinks.instagram]);
                },
                child: Image.asset(
                  "instagram.png",
                  width: 25,
                  height: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row buildNameMailField() {
    return const Row(
      children: [
        Flexible(
          child: CustomTextField(
            hintText: "Your name",
          ),
        ),
        Flexible(
          child: SizedBox(
            width: 15,
          ),
        ),
        Flexible(
          child: CustomTextField(
            hintText: "Your E-Mail",
          ),
        ),
      ],
    );
  }

  Column buildNameMailFieldMobile() {
    return const Column(
      children: [
        Flexible(
          child: CustomTextField(
            hintText: "Your name",
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Flexible(
          child: CustomTextField(
            hintText: "Your E-Mail",
          ),
        ),
      ],
    );
  }
}