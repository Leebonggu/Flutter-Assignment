import 'package:assignment4/constants/sizes.dart';
import 'package:assignment4/shared/custom_list_title.dart';
import 'package:flutter/material.dart';

final tabs = [
  'All',
  '요가',
  '독서',
  '음악',
  '그림',
  '운동',
  '요리',
  '자전거',
  '등산',
  '수영',
];

final contents = [
  {
    'nickname': 'powerbong1',
    'name': 'bongu1',
    'followers': '25.5k',
    'imgUrl': 'https://picsum.photos/250?image=1',
    'subsubtitle': 'Come in',
    'category': '요가',
  },
  {
    'nickname': 'powerbong1',
    'name': 'bongu1',
    'followers': '25.5k',
    'imgUrl': 'https://picsum.photos/250?image=1',
    'subsubtitle': 'Come in',
    'category': '요가',
  },
  {
    'nickname': 'powerbong1',
    'name': 'bongu1',
    'followers': '25.5k',
    'imgUrl': 'https://picsum.photos/250?image=1',
    'subsubtitle': 'Come in',
    'category': '요가',
  },
  {
    'nickname': 'powerbong1',
    'name': 'bongu1',
    'followers': '25.5k',
    'imgUrl': 'https://picsum.photos/250?image=1',
    'subsubtitle': 'Come in',
    'category': '요가',
  },
  {
    'nickname': 'powerbong1',
    'name': 'bongu1',
    'followers': '25.5k',
    'imgUrl': 'https://picsum.photos/250?image=1',
    'subsubtitle': 'Come in',
    'category': '독서',
  },
  {
    'nickname': 'powerbong1',
    'name': 'bongu1',
    'followers': '25.5k',
    'imgUrl': 'https://picsum.photos/250?image=1',
    'subsubtitle': 'Come in',
    'category': '음악',
  },
];

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: Sizes.size96,
          title: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(
                  Sizes.size20,
                ),
                child: const Text(
                  'Activity',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Sizes.size36,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade400,
            indicatorColor: Colors.black,
            labelStyle: const TextStyle(
              fontSize: Sizes.size14,
              fontWeight: FontWeight.bold,
            ),
            isScrollable: true,
            tabs: [
              for (var tab in tabs) Tab(text: tab),
            ],
          ),
        ),
        body: ListView(
          children: [
            for (var tab in tabs)
              for (var content in contents)
                if (tab == content['category'])
                  CustomListTile(
                    nickname: content['nickname']!,
                    name: content['name']!,
                    imgUrl: content['imgUrl']!,
                    titleSide: Text(content['subsubtitle']!),
                  ),
          ],
        ),
      ),
    );
  }
}
