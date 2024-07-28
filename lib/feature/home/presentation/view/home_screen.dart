import "Package:flutter/material.dart";
import "package:file_share/core/presentation/palette.dart";
import "package:file_share/feature/home/presentation/widgets/floating_button/action_button.dart";
import "package:file_share/feature/home/presentation/widgets/app_card.dart";
import "package:file_share/feature/home/presentation/widgets/floating_button/expandable_fab.dart";
import "package:file_share/feature/home/presentation/widgets/photo_tab.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                        Text(
                          'Quick Share',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        CircleAvatar(),
                      ],
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      'Share any file with another phone!',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            TabBar(
              tabAlignment: TabAlignment.start,
              indicatorColor: Palette.blue,
              labelColor: Palette.blue,
              controller: _tabController,
              isScrollable: true,
              labelStyle: const TextStyle(fontSize: 18),
              tabs: const [
                Tab(text: 'History'),
                Tab(text: 'App'),
                Tab(text: 'Photo'),
                Tab(text: 'Music'),
                Tab(text: 'Video'),
                Tab(text: 'File'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  AppCard(),
                  AppCard(),
                  PhotoTab(),
                  AppCard(),
                  AppCard(),
                  AppCard(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: ExpandableFab(
          distance: 112,
          children: [
            ActionButton(
              onPressed: () {},
              icon: const Icon(Icons.upload_rounded),
              iconText: 'Send',
            ),
            ActionButton(
              onPressed: () {},
              icon: const Icon(Icons.download_rounded),
              iconText: 'Receive',
            ),
          ],
        ),
      ),
    );
  }
}
