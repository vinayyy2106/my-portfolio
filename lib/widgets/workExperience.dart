import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
      // color:CustomColor.bgLight1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Work Experience",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          WorkExperienceCard(
            role: "Software Engineer",
            company: "Tata Consultancy Services",
            duration: "June 2023 to Present",
            responsibilities: [
              "Developed 15+ Angular UI modules for government platforms (Police, Health, Aviation), improving experience for 5000+ users.",
              "Engineered 20+ REST APIs with Spring Boot for real-time secure communication.",
              "Created reusable UI components, reducing dev time by 30%.",
              "Built secure digital licensing solutions, increasing process efficiency by 30%, supporting 5000+ users.",
              "Delivered 5+ demo/client apps to enhance pre-sales in India and Middle East.",
            ],
          ),
        ],
      ),
    );
  }
}

class WorkExperienceCard extends StatelessWidget {
  final String role;
  final String company;
  final String duration;
  final List<String> responsibilities;

  const WorkExperienceCard({
    super.key,
    required this.role,
    required this.company,
    required this.duration,
    required this.responsibilities,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 25),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$role, $company",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              duration,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 15),
            ...responsibilities.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("•  ", style: TextStyle(fontSize: 18)),
                  Expanded(child: Text(item, style: const TextStyle(fontSize: 16))),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
