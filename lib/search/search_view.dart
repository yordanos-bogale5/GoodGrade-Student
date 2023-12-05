import 'package:creavers_project/common/extension.dart';

import '/search/search_filter_view.dart';
import '/search/search_force_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extenstion.dart';
import '../../common_widget/history_row.dart';
import '../../common_widget/search_grid_cell.dart';


class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController txtSearch = TextEditingController();
  int selectTag = 0;
  List tagsArr = [
    "Category",
    "Status",
    "Level",
    "Ratings",
    "Instructors",
    "Price"
  ];

  List searchArr = [
    {
      "name": "Biology",
      "img": "assets/biology.webp",
    },
    {
      "name": "Digital signal processing",
      "img": "assets/Digital signal processing.webp",
    },
    {
      "name": "Mathematics",
      "img": "assets/Mathematics.webp",
    },
    {
      "name": "Gender, family and social change",
      "img": "assets/Gender, family and social change.webp",
    },
    {
      "name": "Intercultural communication and management",
      "img": "assets/Intercultural communication and management.webp",
    },
    {
      "name": "Graphic Design Fundamentals",
      "img": "assets/Graphic Design Fundamentals.webp",
    },
    {
      "name": "Enviromental Science",
      "img": "assets/Enviromental Science.webp",
    },
    {
      "name": "Gender, family and social change",
      "img": "assets/Gender, family and social change.webp",
    },
    {
      "name": "Biology",
      "img": "assets/biology.webp",
    },
    {
      "name": "Mathematics",
      "img": "assets/Mathematics.webp",
    },
    {
      "name": "Intercultural communication and management",
      "img": "assets/Intercultural communication and management.webp",
    },
    {
      "name": "Enviromental Science",
      "img": "assets/Enviromental Science.webp",
    }
  ];

  List sResultArr = [
    {
      "name": "Enviromental Science",
      "img": "assets/Enviromental Science.webp",
      "author": "Yordanos Bogale",
      "description":
          "Nutrition and Lifestyle in Pregnancy offers an overview of the latest research findings.",
      "rate": 5.0
    },
    {
      "name": "Mathematics",
      "img": "assets/Mathematics.webp",
      "author": "Seare Hagos",
      "description":
          "derivation and integration are the best part of maths",
      "rate": 4.0
    },
    {
      "name": "Biology",
      "img": "assets/biology.webp",
      "author": "Yordanos Tibebu",
      "description":
          "Reproductions of the Biology",
      "rate": 3.0
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          elevation: 0,
          title: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: TColor.textbox,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    controller: txtSearch,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchForceView(
                            didSearch: (sText) {
                              txtSearch.text = sText;
                              if (mounted) {
                                setState(() {});
                              }
                            },
                          ),
                        ),
                      );
                      endEditing();
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 8),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: TColor.text),
                      suffixIcon: SizedBox(
                        width: 40,
                        child: IconButton(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchFilterView(
                                    didFilter: (fObj) {
                                      if (mounted) {
                                        setState(() {});
                                      }
                                    },
                                  ),
                                ),
                              );
                              endEditing();
                            },
                            icon: Icon(Icons.tune, color: TColor.text)),
                      ),
                      hintText: "Search Books. Instructors. or category",
                      labelStyle: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              if (txtSearch.text.isNotEmpty)
                const SizedBox(
                  width: 8,
                ),
              if (txtSearch.text.isNotEmpty)
                TextButton(
                    onPressed: () {
                      txtSearch.text = "";
                      setState(() {});
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: TColor.text,
                        fontSize: 17,
                      ),
                    ))
            ],
          ),
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: tagsArr.map((tagName) {
                    var index = tagsArr.indexOf(tagName);
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 15),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectTag = index;
                          });
                        },
                        child: Text(
                          tagName,
                          style: TextStyle(
                              color: selectTag == index
                                  ? TColor.text
                                  : TColor.subTitle,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            if (txtSearch.text.isEmpty)
              Expanded(
                child: GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.75,
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemCount: searchArr.length,
                  itemBuilder: (context, index) {
                    var sObj = searchArr[index] as Map? ?? {};
                    return SearchGridCell(
                      sObj: sObj,
                      index: index,
                    );
                  },
                ),
              ),
            if (txtSearch.text.isNotEmpty)
              Expanded(
                  child: ListView.builder(
                    padding:
                      const EdgeInsets.symmetric( horizontal: 15),
                      itemCount: sResultArr.length,
                      itemBuilder: (context, index) {
                        var sObj = sResultArr[index] as Map? ?? {};
                        return HistoryRow(
                          sObj: sObj,
                        );
                      },),)
          ],
        ));
  }
}
