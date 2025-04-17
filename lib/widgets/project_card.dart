import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/utils/project_utils.dart';


// ignore: deprecated_member_use
import 'dart:js' as js;

// ignore: camel_case_types
class projectCardWidget extends StatelessWidget {
  const projectCardWidget({super.key, required this.project});

  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 295,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.bgLight2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            project.image,
            height: 115,
            width: 250,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              project.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              project.subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          const Spacer(),
          Container(
            color: CustomColor.bgLight1,
            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            child: Row(
              children: [
                if (project.githubLink != null)
                  const Text("Available on:",style: TextStyle(color: CustomColor.yellowSecondary,fontSize: 12),),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      js.context.callMethod("open", [project.githubLink]);
                    },
                    child: Chip(
                      label: const Text("Github"),
                      avatar: Image.asset("assets/github.png"),
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