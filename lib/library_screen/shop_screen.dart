import 'package:flutter/material.dart';
import 'package:creavers_project/library_screen/filters/filter_row_section.dart';
import 'package:creavers_project/library_screen/suggestion/discount_books.dart';
import 'package:creavers_project/library_screen/suggestion/popular_books.dart';
import 'package:creavers_project/library_screen/suggestion/trend_books.dart';

import 'filters/search_bar.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Shope'),
            backgroundColor:Colors.blue[900],
            foregroundColor:Colors.white,
            elevation: 0,
            leading: IconButton(
          icon: const Icon(Icons.arrow_back, color:Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
          ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SearchBarSection(),
              SizedBox(height: 24),
              FilterRowSection(),
              SizedBox(height: 24),
              TrendBooks(),
              SizedBox(height: 24),
              PopularBooks(),
              SizedBox(height: 24),
              DiscountBooks(),
            ],
          ),
        ),
      ),
    );
  }
}
