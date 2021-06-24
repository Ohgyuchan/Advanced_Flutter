class Post {
  String authorName;
  String authorImageUrl;
  String timeAgo;
  String imageUrl;

  Post({
    required this.authorName,
    required this.authorImageUrl,
    required this.timeAgo,
    required this.imageUrl,
  });
}

final List<Post> posts = [
  Post(
    authorName: 'Sam Martin',
    authorImageUrl: 'assets/images/user2.jpg',
    timeAgo: '5 min',
    imageUrl: 'assets/images/post0.png',
  ),
  Post(
    authorName: 'Sam Martin',
    authorImageUrl: 'assets/images/user2.jpg',
    timeAgo: '10 min',
    imageUrl: 'assets/images/post1.jpg',
  ),
];

final List<String> stories = [
  'assets/images/user1.jpg',
  'assets/images/user2.jpg',
  'assets/images/user3.jpg',
  'assets/images/user4.jpg',
  'assets/images/user4.jpg',
  'assets/images/user1.jpg',
  'assets/images/user2.jpg',
  'assets/images/user3.jpg',
];