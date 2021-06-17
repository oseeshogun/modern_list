import 'dart:ui';

class User {
  final String name;
  final String asset;
  final String title;
  final int ranking;
  final Color color;

  const User({
    required this.name,
    required this.asset,
    required this.title,
    required this.ranking,
    required this.color,
  });
}

const List<User> users = [
  User(
    name: 'David Borg',
    title: 'Flying wings',
    asset: 'images/1.jpg',
    ranking: 1,
    color: Color(0xff7fabf4),
  ),
  User(
    name: 'Lucy',
    title: 'Growing up trouble',
    asset: 'images/2.jpg',
    ranking: 2,
    color: Color(0xfff3af64),
  ),
  User(
    name: 'Jerry Cool West',
    title: "Scultor's diary",
    asset: 'images/3.jpg',
    ranking: 3,
    color: Color(0xffec6188),
  ),
  User(
    name: 'Bold',
    title: 'Illustration of little girl',
    asset: 'images/4.jpg',
    ranking: 1,
    color: Color(0xffb17bf3),
  ),
  User(
    name: 'David Borg',
    title: 'Flying wings',
    asset: 'images/5.jpg',
    ranking: 1,
    color: Color(0xff69e2bf),
  ),
];
