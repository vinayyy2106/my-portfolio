class ProjectUtils{
  final String image;
  final String title;
  final String subtitle;
  final String? githubLink;
  ProjectUtils({required this.image,
  required this.title,
  required this.subtitle,
  this.githubLink});
}
List<ProjectUtils> hobbyProjectUtils=[
  ProjectUtils(image: 'assets/ca.jpg', title: 'Aviation Project', subtitle: 'Fulfilled optimized and secured solutions by providing optimal mobile application for Aviation industry at my workplace.'),
  ProjectUtils(image: 'assets/assistant.jpeg', title: 'Wb Controlled Assistant robot for Visually Impaired Ptients', subtitle: 'This project is all about a assistant robot which follows a lane and guides the aged/visually impaired ones to their destination.',githubLink: 'https//github.com/vinayyy2106/Assistant-AI-Robot'),
  ProjectUtils(image: 'assets/police.jpg', title: 'Tamil Nadu Police', subtitle: 'Contributed to the development of secure and efficient application for police for searching accused, death status and etc., enhancing public safety operations.')
];
