import 'package:flutter/material.dart';

void main() => runApp(const SearchApp());

class SearchApp extends StatelessWidget {
  const SearchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SearchView(),
    );
  }
}

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController txtSearch = TextEditingController();
  int selectTag = 0;
  List<String> tagsArr = [
    'Category',
    'Photography',
    'Software training',
    'Environmental Sciences',
    'Material Design',
    'Music',
    'Art',
  ];

  List<Map<String, dynamic>> searchArr = [
    // Your existing data
  ];

  List<Map<String, dynamic>> sResultArr = [
    // Your existing data
  ];

  List<String> statusList = [
    'Status',
    'Featured',
    'Hot',
    'New',
    'Special',
  ];

  List<String> levelList = [
    'Level',
    'Beginner',
    'Intermediate',
    'Advance',
  ];

  List<String> priceList = [
    'Price',
    'Low to High',
    'High to Low',
  ];

  List<String> ratingList = [
    'Rating',
    'One Star',
    'Two Stars',
    'Three Stars',
  ];

  List<String> instructorList = [
    'Instructors',
    'Yordanos',
    'Seare',
    'Phina',
    'Dada',
  ];

  List<String> recentSearches = [];

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
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: txtSearch,
                  onChanged: (query) {
                    filterSearchResults(query);
                  },
                  onTap: () async {
                    // ... existing onTap code
                  },
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    hintText: "Search Books, Instructors, or category",
                    labelStyle: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            if (txtSearch.text.isNotEmpty) ...[
              const SizedBox(width: 8),
              TextButton(
                onPressed: () {
                  saveRecentSearch(txtSearch.text);
                  txtSearch.text = "";
                  setState(() {});
                },
                child: const Text(
                  "Search",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
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
                children: [
                  DropdownButton<String>(
                    value: tagsArr[selectTag],
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 1,
                    style: const TextStyle(color: Colors.cyan),
                    underline: Container(
                      height: 1,
                      color: Colors.cyan,
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectTag = tagsArr.indexOf(value!);
                        filterSearchResults(txtSearch.text);
                      });
                    },
                    items: tagsArr.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  DropdownButton<String>(
                    value: statusList[selectTag],
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.pink),
                    underline: Container(
                      height: 2,
                      color: Colors.pink,
                    ),
                    onChanged: (String? value) {
                      // Handle the selected value for Status
                      filterSearchResults(txtSearch.text);
                    },
                    items: statusList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  DropdownButton<String>(
                    value: levelList[selectTag],
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? value) {
                      // Handle the selected value for Level
                      filterSearchResults(txtSearch.text);
                    },
                    items: levelList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  DropdownButton<String>(
                    value: ratingList[selectTag],
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.lime),
                    underline: Container(
                      height: 2,
                      color: Colors.lime,
                    ),
                    onChanged: (String? value) {
                      // Handle the selected value for Rating
                      filterSearchResults(txtSearch.text);
                    },
                    items: ratingList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  DropdownButton<String>(
                    value: instructorList[selectTag],
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.brown),
                    underline: Container(
                      height: 2,
                      color: Colors.brown,
                    ),
                    onChanged: (String? value) {
                      // Handle the selected value for Instructors
                      filterSearchResults(txtSearch.text);
                    },
                    items: instructorList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  DropdownButton<String>(
                    value: priceList[0],
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.orange),
                    underline: Container(
                      height: 2,
                      color: Colors.orange,
                    ),
                    onChanged: (String? value) {
                      // Handle the selected value for Price
                      filterSearchResults(txtSearch.text);
                    },
                    items: priceList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
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
                  mainAxisSpacing: 15,
                ),
                itemCount: searchArr.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> sObj =
                      (searchArr[index] as Map<String, dynamic>?) ?? {};
                  return SearchGridCell(
                    sObj: sObj,
                    index: index,
                  );
                },
              ),
            ),
          if (txtSearch.text.isNotEmpty)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15, top: 15),
                    child: Text(
                      'Recent Searches',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: recentSearches.length,
                    itemBuilder: (context, index) {
                      final query = recentSearches[index];
                      return ListTile(
                        title: Text(query),
                        onTap: () {
                          txtSearch.text = query;
                          filterSearchResults(query);
                        },
                      );
                    },
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: sResultArr.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> sObj =
                            (sResultArr[index] as Map<String, dynamic>?) ?? {};
                        return HistoryRow(
                          sObj: sObj,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void filterSearchResults(String query) {
    // Implement your search logic here
    // For simplicity, we'll just filter a list of sample data
    List<Map<String, dynamic>> filteredResults = [
      {'title': 'Result 1 for $query'},
      {'title': 'Result 2 for $query'},
      {'title': 'Result 3 for $query'},
    ];

    setState(() {
      sResultArr = filteredResults;
    });
  }

  void saveRecentSearch(String query) {
    if (!recentSearches.contains(query)) {
      recentSearches.insert(0, query);
      if (recentSearches.length > 5) {
        recentSearches.removeLast();
      }
    }
  }
}

class SearchGridCell extends StatelessWidget {
  final Map<String, dynamic> sObj;
  final int index;

  const SearchGridCell(
      {required this.sObj, required this.index, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Your implementation for the grid cell
    return Container(
      // Your grid cell contents
    );
  }
}

class HistoryRow extends StatelessWidget {
  final Map<String, dynamic> sObj;

  const HistoryRow({required this.sObj, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Your implementation for the list view row
    return Container(
      // Your list view row contents
    );
  }
}
