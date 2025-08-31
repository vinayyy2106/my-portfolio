class ProjectUtils{
  final String image;
  final String title;
  final String subtitle;
  final String? link;
  final String? githubLink;
  ProjectUtils({required this.image,
  required this.title,
  required this.subtitle,
  this.githubLink,this.link});
}
List<ProjectUtils> hobbyProjectUtils=[
  ProjectUtils(image: 'assets/ecommerce.png', title: 'SV Boards – Full-Stack E-commerce Platform for B2B Paper Supplier', subtitle: 'Developed and deployed a scalable e-commerce platform for a paper product business, streamlined productcatalog management and enabled customer order handling for future scalability.',link:'https://svboards.netlify.app/',githubLink: 'https://github.com/vinayyy2106/SV-Boards-Frontend'),
  ProjectUtils(image: 'assets/news.png', title: 'NewsGeek - All US news at one place', subtitle: 'This project is all about a assistant robot which follows a lane and guides the aged/visually impaired ones to their destination.',githubLink: 'https://github.com/vinayyy2106/News-App'),
  ProjectUtils(image: 'assets/cinemate.png', title: 'Cinemate', subtitle: 'Contributed to the development of secure and efficient application for police for searching accused, death status and etc., enhancing public safety operations.',githubLink: 'https://github.com/vinayyy2106/Cinemate')
];
