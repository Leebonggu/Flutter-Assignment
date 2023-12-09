import 'package:assignment4/constants/gaps.dart';
import 'package:assignment4/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        child: const Column(
          children: [
            Text(
              'Recent Searches',
              style: TextStyle(
                color: Colors.black,
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
