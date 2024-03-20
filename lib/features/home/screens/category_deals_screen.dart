import 'package:flutter/material.dart';
import 'package:start/constants/global_variable.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName='/category-deals';
  final String category;
  const CategoryDealsScreen({super.key,required this.category});

  @override
  State<CategoryDealsScreen> createState() => _CatogeryDealsScreenState();
}

class _CatogeryDealsScreenState extends State<CategoryDealsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar:AppBar(
        title: Text(widget.category),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            alignment: Alignment.topLeft,
            child: Text("Keep Shoppring for ${widget.category}",style: Styles.headLineStyle4,),
          )
        ],
      ),
    );
  }
}