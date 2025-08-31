import 'package:flutter/material.dart';

import 'package:portfolio/constants/colors.dart';

import 'package:portfolio/constants/size.dart';

import 'package:portfolio/widgets/contact_section.dart';

import 'package:portfolio/widgets/drawer_mobile.dart';

import 'package:portfolio/widgets/footer_widget.dart';

import 'package:portfolio/widgets/header_desktop.dart';

import 'package:portfolio/widgets/header_mobile.dart';

import 'package:portfolio/widgets/main_desktop.dart';

import 'package:portfolio/widgets/main_mobile.dart';

import 'package:portfolio/widgets/projects_section.dart';

import 'package:portfolio/widgets/skills_desktop.dart';

import 'package:portfolio/widgets/skills_mobile.dart';
import 'package:portfolio/widgets/workExperience.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final scrollController = ScrollController();

  final List<GlobalKey> navBarkeys = List.generate(4, (index) => GlobalKey());

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer:
              constraints.maxWidth >= kMinDeskTopWidth
                  ? null
                  : DrawerMobile(
                    onNavItemTap: (navIndex) {
                      scrollToSection(navIndex);
                      scaffoldKey.currentState?.closeEndDrawer();
                    },
                  ),
          body: SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(key: navBarkeys.first),
                if (constraints.maxWidth >= kMinDeskTopWidth)
                  HeaderDesktop(
                    onNavMenuTap: (int navIndex) {
                      scrollToSection(navIndex);
                    },
                  )
                else
                  HeaderMobile(
                    onLogoTap: () {},
                    onMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
                if (constraints.maxWidth >= kMinDeskTopWidth)
                  const MainDesktop()
                else
                  const MainMobile(),
                // Header
                Container(
                  key: navBarkeys[1],
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: CustomColor.bgLight1,
                  child: Column(
                    children: [
                      const Text(
                        "What I can do?",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                      const SizedBox(height: 50),
                      if (constraints.maxWidth >= kMinDeskTopWidth)
                        const SkillsDesktop()
                      else
                        const SkillsMobile(),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                WorkExperienceSection(),
                const SizedBox(height: 30),
                // projects
                ProjectsSection(key: navBarkeys[2]),
                const SizedBox(height: 30),
                // contacts
                ContactSection(key: navBarkeys[3]),
                const SizedBox(height: 30),
                const FooterWidget(),
              ],
            ),
          ),
        );
      },
    );
  }

  void scrollToSection(int navIndex) {
    final key = navBarkeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
