import 'package:assignment4/constants/sizes.dart';
import 'package:assignment4/shared/custom_list_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<Map<String, String>> data = [
  {
    'nickname': 'powerbong1',
    'name': 'bongu1',
    'followers': '25.5k',
    'imgUrl': 'https://picsum.photos/250?image=1',
  },
  {
    'nickname': 'powerbong2',
    'name': 'bongu2',
    'followers': '35.5k',
    'imgUrl': 'https://picsum.photos/250?image=2',
  },
  {
    'nickname': 'powerbong3',
    'name': 'bongu3',
    'followers': '3.5k',
    'imgUrl': 'https://picsum.photos/250?image=3',
  },
  {
    'nickname': 'powerbong4',
    'name': 'bongu4',
    'followers': '5k',
    'imgUrl': 'https://picsum.photos/250?image=4',
  },
  {
    'nickname': 'powerbong5',
    'name': 'bongu5',
    'followers': '3.5k',
    'imgUrl': 'https://picsum.photos/250?image=5',
  },
  {
    'nickname': 'powerbong6',
    'name': 'bongu6',
    'followers': '25.6k',
    'imgUrl': 'https://picsum.photos/250?image=6',
  },
  {
    'nickname': 'powerbong7',
    'name': 'bongu7',
    'followers': '25.7k',
    'imgUrl': 'https://picsum.photos/250?image=7',
  },
  {
    'nickname': 'powerbong8',
    'name': 'bongu8',
    'followers': '25.8k',
    'imgUrl': 'https://picsum.photos/250?image=8',
  },
  {
    'nickname': 'powerbong8',
    'name': 'bongu8',
    'followers': '25.8k',
    'imgUrl': 'https://picsum.photos/250?image=8',
  },
  {
    'nickname': 'powerbong8',
    'name': 'bongu8',
    'followers': '25.8k',
    'imgUrl': 'https://picsum.photos/250?image=8',
  },
  {
    'nickname': 'powerbong8',
    'name': 'bongu8',
    'followers': '25.8k',
    'imgUrl': 'https://picsum.photos/250?image=8',
  },
  {
    'nickname': 'powerbong8',
    'name': 'bongu8',
    'followers': '25.8k',
    'imgUrl': 'https://picsum.photos/250?image=8',
  },
  {
    'nickname': 'powerbong8',
    'name': 'bongu8',
    'followers': '25.8k',
    'imgUrl': 'https://picsum.photos/250?image=8',
  },
  {
    'nickname': 'powerbong8',
    'name': 'bongu8',
    'followers': '25.8k',
    'imgUrl': 'https://picsum.photos/250?image=8',
  },
];

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _onSearchChanged(String value) {}

  void _onSearchSubmitted(String value) {}

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Sizes.size150,
        title: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(
                Sizes.size20,
              ),
              child: const Text(
                'Search',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Sizes.size36,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            CupertinoSearchTextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              onSubmitted: _onSearchSubmitted,
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(
          Sizes.size20,
        ),
        child: ListView(
          children: [
            for (final item in data)
              CustomListTile(
                nickname: item['nickname']!,
                name: item['name']!,
                subsubtitle: '${item['followers']} K Followers',
                trailingText: 'Follow',
                imgUrl: item['imgUrl']!,
                titleSide: const FaIcon(
                  FontAwesomeIcons.circleCheck,
                  size: Sizes.size14,
                  color: Colors.blue,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
