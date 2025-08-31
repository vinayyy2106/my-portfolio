import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/size.dart';
import 'package:portfolio/constants/snsLinks.dart' as snsLinks;
import 'package:portfolio/constants/Snslinks.dart';
import 'package:portfolio/widgets/custom_text_field.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: deprecated_member_use
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  
  const ContactSection({super.key});
  
  Future<void> launchEmail(String name, String email, String message) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'vinaykumarpabba73@gmail.com',
    queryParameters: {
      'subject': 'Contact from Portfolio',
      'body': 'Name: $name\nEmail: $email\nMessage: $message'
    },
  );
  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  } else {
    throw 'Could not launch email app';
  }
}
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final messageController = TextEditingController();
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
                // return buildNameMailField();
                return buildNameMailField(nameController, emailController);
              } else {
                // return buildNameMailFieldMobile();
                return buildNameMailFieldMobile(nameController, emailController);
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
                
                onPressed: (){
                  final name = nameController.text;
                  final email = emailController.text;
                  final message = messageController.text;
                  launchEmail(name, email, message);
                },
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

  // Row buildNameMailField() {
  //   return const Row(
  //     children: [
  //       Flexible(
  //         child: CustomTextField(
  //           hintText: "Your name",
  //         ),
  //       ),
  //       Flexible(
  //         child: SizedBox(
  //           width: 15,
  //         ),
  //       ),
  //       Flexible(
  //         child: CustomTextField(
  //           hintText: "Your E-Mail",
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Column buildNameMailFieldMobile() {
  //   return const Column(
  //     children: [
        // Flexible(
        //   child: CustomTextField(
        //     hintText: "Your name",
        //   ),
        // ),
  //       SizedBox(
  //         height: 15,
  //       ),
  //       Flexible(
  //         child: CustomTextField(
  //           hintText: "Your E-Mail",
  //         ),
  //       ),
  //     ],
  //   );
  // }
  Row buildNameMailField(TextEditingController nameController, TextEditingController emailController) {
  return Row(
    children: [
      Flexible(
        child: CustomTextField(
          controller: nameController,
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
          controller: emailController,
          hintText: "Your E-Mail",
        ),
      ),
    ],
  );
}

Column buildNameMailFieldMobile(TextEditingController nameController, TextEditingController emailController) {
  return Column(
    children: [
      Flexible(
          child: CustomTextField(
            controller: nameController, 
            hintText: "Your name",
          ),
        ),
      SizedBox(height: 15),
      Flexible(
        child: CustomTextField(
          controller: emailController,
          hintText: "Your E-Mail",
        ),
      ),
    ],
  );
}

}