import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:list_design_tuto/data.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAppBar(tabController: tabController),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  final User user = users[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 15.0),
                    height: MediaQuery.of(context).size.height * .18,
                    decoration: BoxDecoration(
                      color: user.color,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: user.color.withOpacity(.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(10, 5),
                        )
                      ],
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ListItemContainer(user: user),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ClipPath(
                            clipper: ArcClipper(),
                            child: Container(
                              color: Colors.white.withOpacity(.3),
                              width: MediaQuery.of(context).size.width * .28,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.moveTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - 30, 0);
    path.quadraticBezierTo(3, size.height * .25, 0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ListItemContainer extends StatelessWidget {
  const ListItemContainer({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 20.0,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(user.asset),
            radius: 30,
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Title: ' + user.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InfoItem(
                      number: '2342',
                      category: 'Popularity',
                    ),
                    InfoItem(
                      number: '4736',
                      category: 'Like',
                    ),
                    InfoItem(
                      number: '136',
                      category: 'Followers',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ),
                const SizedBox(height: 20),
                Text(
                  user.ranking.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Ranking",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  const InfoItem({
    Key? key,
    required this.number,
    required this.category,
  }) : super(key: key);

  final String number;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '2332',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Popularity',
          style: TextStyle(
            color: Colors.white,
            fontSize: 8,
          ),
        ),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffd86cf5),
            Color(0xffac4df1),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 5,
            blurRadius: 10,
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TabBar(
                controller: tabController,
                indicatorColor: Colors.white,
                indicatorWeight: 5.0,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  TabItem(
                    title: 'Designer',
                    active: tabController.index == 0,
                  ),
                  TabItem(
                    title: 'Category',
                    active: tabController.index == 1,
                  ),
                  TabItem(
                    title: 'Attention',
                    active: tabController.index == 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({
    Key? key,
    required this.title,
    required this.active,
  }) : super(key: key);

  final String title;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Transform(
        transform: Matrix4.identity()..scale(active ? 1.5 : 1.0),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}
