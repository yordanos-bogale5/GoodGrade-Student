
class OnbordingContent {
  String image;
  String title;
  String discription;

  OnbordingContent({required this.image, required this.title, required this.discription});
}

List<OnbordingContent> contents = [
  OnbordingContent(
    title: 'Creavers',
    image: 'assets/cre.webp',
    discription:"Welcome To Creavers "
    "We provide long standing experience for online teaching and learning by highly experienced instructors, for students who want to deepen their knowledge, "
  ),
  OnbordingContent(
    title: 'Good Grade Students',
    image: 'assets/good.jpg',
    discription:    "Makes Schooling Fun  "
    "School is live 24 hours everyday with full tutoring, refresher courses for those in need. Online quizzes and exams. Pursue your academic and professional goals by taking online courses on a schedule that fits your convenience, "

  ),
  OnbordingContent(
    title: 'Here We Go',
    image: 'assets/wellcome.jpg',
    discription: "Be Better "
    "Learn Better, "
  ),
];
