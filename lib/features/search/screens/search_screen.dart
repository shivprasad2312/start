import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final String searhQuery;
  static const String routeName='/search-screen';
  const SearchScreen({super.key,required this.searhQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.searhQuery),),
    );
  }
}