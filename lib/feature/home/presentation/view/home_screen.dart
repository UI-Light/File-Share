import "Package:flutter/material.dart";
import "package:file_share/core/presentation/palette.dart";
import "package:file_share/feature/home/presentation/widgets/app_card.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 6,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 7,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Palette.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Quick Share'),
                          CircleAvatar(),
                        ],
                      ),
                      Text('Share any file with another phone !'),
                    ],
                  ),
                ),
              ),
              const TabBar(
                isScrollable: true,
                labelStyle: TextStyle(fontSize: 13),
                tabs: [
                  Tab(text: 'History'),
                  Tab(text: 'App'),
                  Tab(text: 'Photo'),
                  Tab(text: 'Music'),
                  Tab(text: 'Video'),
                  Tab(text: 'File'),
                ],
              ),
              const TabBarView(children: [
                AppCard(),
                AppCard(),
                AppCard(),
                AppCard(),
                AppCard(),
                AppCard(),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
