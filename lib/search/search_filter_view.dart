import '../common/common_widget/round_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../common/color_extenstion.dart';

class SearchFilterView extends StatefulWidget {
  final Function(Map)? didFilter;
  const SearchFilterView({super.key, this.didFilter});

  @override
  State<SearchFilterView> createState() => _SearchFilterViewState();
}

class _SearchFilterViewState extends State<SearchFilterView> {
  int selectSort = 0;
    bool priceShowMore = false;
  int selectCategory = 0;
   int selectPrice = 0;
  int selectStatus = 0;
  int selectRate = 0;
  bool categoryShowMore = false;
  int selectGCategory = 0;
  bool statusShowMore = false;
  int selectLevel = 0;
  bool levelShowMore = false;
    int selectInstructor = 0;
      bool instructorShowMore = false;
  List sortByArr = [
    "Featured Titles",
    "Price: Low to High",
    "Price: High to Low",
    "Publication Date",
    "A - Z"
  ];
  List categoryArr = [
   'Photography',
'Software training',
'Environmental Sciences',
'Material Design',
'Music',
'Art',
'Mathematics',
'Biology',
'Marketing',
'Computer Basics',
'Electronic',
'Digital signal processing'
  ];
   List levelArr = [
'level',
'Beginner',
'Intermediate',
'Advance'
  ];
    List statusArr = [
'Featured',
' Hot',
'New',
'Special'
  ];
      List instructorArr = [
'Yordanos',
'Seare',
'Phina',
'Dada',
  ];
        List priceArr = [
'Free Courses',
'Paid Courses',
'Only Subscription',
  ];

  List ratingArr = [5.0, 4.0, 3.0, 2.0, 1.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(),
        leadingWidth: 0,
        title: Row(
          children: [
            Expanded(
                child: Text(
              "Filter",
              style: TextStyle(
                  color: TColor.text,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            )),
            const SizedBox(
              width: 8,
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: TColor.text,
                  fontSize: 17,
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Text(
                "Sort by",
                style: TextStyle(color: TColor.subTitle, fontSize: 13),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: sortByArr.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var itemName = sortByArr[index] as String? ?? "";
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectSort = index;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: Row(
                      children: [
                        Icon(
                            selectSort == index
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: selectSort == index
                                ? TColor.primary
                                : TColor.subTitle),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: Text(
                          itemName,
                          style: TextStyle(color: TColor.text, fontSize: 15),
                        )),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text(
                "Category",
                style: TextStyle(color: TColor.subTitle, fontSize: 13),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: categoryShowMore
                  ? categoryArr.length
                  : (categoryArr.length > 5 ? 5 : categoryArr.length),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var itemName = categoryArr[index] as String? ?? "";
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectCategory = index;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: Row(
                      children: [
                        Icon(
                            selectCategory == index
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: selectCategory == index
                                ? TColor.primary
                                : TColor.subTitle),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: Text(
                          itemName,
                          style: TextStyle(color: TColor.text, fontSize: 15),
                        )),
                      ],
                    ),
                  ),
                );
              },
            ),

              Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text(
                "Status",
                style: TextStyle(color: TColor.subTitle, fontSize: 13),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: statusShowMore
                  ? statusArr.length
                  : (statusArr.length > 5 ? 5 : statusArr.length),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var itemName = statusArr[index] as String? ?? "";
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectCategory = index;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: Row(
                      children: [
                        Icon(
                            selectCategory == index
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: selectCategory == index
                                ? TColor.primary
                                : TColor.subTitle),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: Text(
                          itemName,
                          style: TextStyle(color: TColor.text, fontSize: 15),
                        )),
                      ],
                    ),
                  ),
                );
              },
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  statusShowMore = !statusShowMore;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Row(
                  children: [
                    Icon(categoryShowMore ? Icons.expand_less : Icons.expand_more,
                        color: TColor.subTitle),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: Text(
                      categoryShowMore ? "Hide" : "See more",
                      style: TextStyle(color: TColor.subTitle, fontSize: 15),
                    )),
                  ],
                ),
              ),
            ),

    Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text(
                "Level",
                style: TextStyle(color: TColor.subTitle, fontSize: 13),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: levelShowMore
                  ? levelArr.length
                  : (levelArr.length > 5 ? 5 : levelArr.length),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var itemName = levelArr[index] as String? ?? "";
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectLevel = index;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: Row(
                      children: [
                        Icon(
                            selectCategory == index
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: selectCategory == index
                                ? TColor.primary
                                : TColor.subTitle),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: Text(
                          itemName,
                          style: TextStyle(color: TColor.text, fontSize: 15),
                        )),
                      ],
                    ),
                  ),
                );
              },
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  levelShowMore = !levelShowMore;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Row(
                  children: [
                    Icon(categoryShowMore ? Icons.expand_less : Icons.expand_more,
                        color: TColor.subTitle),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: Text(
                      categoryShowMore ? "Hide" : "See more",
                      style: TextStyle(color: TColor.subTitle, fontSize: 15),
                    )),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text(
                "Rating",
                style: TextStyle(color: TColor.subTitle, fontSize: 13),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: ratingArr.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var itemName = ratingArr[index] as double? ?? 1.0;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectRate = index;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                            selectRate == index
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: selectRate == index
                                ? TColor.primary
                                : TColor.subTitle),
                        const SizedBox(
                          width: 15,
                        ),
                        IgnorePointer(
                          ignoring: true,
                          child: RatingBar.builder(
                            initialRating: itemName,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 15,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: TColor.primary,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text(
                "Instructors",
                style: TextStyle(color: TColor.subTitle, fontSize: 13),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: instructorShowMore
                  ? instructorArr.length
                  : (instructorArr.length > 5 ? 5 : levelArr.length),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var itemName = instructorArr[index] as String? ?? "";
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectInstructor = index;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: Row(
                      children: [
                        Icon(
                            selectCategory == index
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: selectCategory == index
                                ? TColor.primary
                                : TColor.subTitle),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: Text(
                          itemName,
                          style: TextStyle(color: TColor.text, fontSize: 15),
                        )),
                      ],
                    ),
                  ),
                );
              },
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  instructorShowMore = !instructorShowMore;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Row(
                  children: [
                    Icon(categoryShowMore ? Icons.expand_less : Icons.expand_more,
                        color: TColor.subTitle),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: Text(
                      categoryShowMore ? "Hide" : "See more",
                      style: TextStyle(color: TColor.subTitle, fontSize: 15),
                    )),
                  ],
                ),
              ),
            ),

              Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text(
                "Price",
                style: TextStyle(color: TColor.subTitle, fontSize: 13),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: priceShowMore
                  ? priceArr.length
                  : (priceArr.length > 5 ? 5 : priceArr.length),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var itemName = priceArr[index] as String? ?? "";
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectPrice = index;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: Row(
                      children: [
                        Icon(
                            selectCategory == index
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: selectCategory == index
                                ? TColor.primary
                                : TColor.subTitle),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: Text(
                          itemName,
                          style: TextStyle(color: TColor.text, fontSize: 15),
                        )),
                      ],
                    ),
                  ),
                );
              },
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  priceShowMore = !priceShowMore;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Row(
                  children: [
                    Icon(categoryShowMore ? Icons.expand_less : Icons.expand_more,
                        color: TColor.subTitle),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: Text(
                      categoryShowMore ? "Hide" : "See more",
                      style: TextStyle(color: TColor.subTitle, fontSize: 15),
                    )),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.transparent,
              blurRadius: 3,
              offset: Offset(0, -3),
            ),
          ]),
          child: RoundButton(
              title: "Show Results",
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ),
    );
  }
}
