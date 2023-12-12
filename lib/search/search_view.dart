// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'search_filter_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  String searchText = '';
  bool isSearchClicked = false;
  List<String> recentSearches = []; // Keep track of recent searches
  String? selectedFilter;

  void _onSearchChanged(String value) {
    setState(() {
      searchText = value;
    });
  }

  void _toggleSearch() {
    setState(() {
      isSearchClicked = !isSearchClicked;
    });
  }

  void _performSearch() {
    // Implement your search functionality here
    // You can use the current value of `searchText` for searching
    // For now, I'm just printing the search term to the console
    print('Searching for: $searchText');

    // Add the search term to recent searches
    if (searchText.isNotEmpty && !recentSearches.contains(searchText)) {
      recentSearches.insert(0, searchText);
      if (recentSearches.length > 5) {
        recentSearches.removeLast();
      }
    }
  }

  void _openFilterView(BuildContext context) async {
    // Show the SearchFilterView and get the filter result
    final Map? filterResult = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchFilterView()),
    );

    // Handle the filter result as needed
    if (filterResult != null) {
      print('Filter Result: $filterResult');
      // Apply the filter logic using filterResult
      setState(() {
        selectedFilter = filterResult['selectedFilter'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                  icon: Icon(
                    isSearchClicked ? Icons.close : Icons.search,
                    color: Colors.grey,
                  ),
                  onPressed: () => _toggleSearch(),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  onSubmitted: (_) => _performSearch(),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(0, 20, 16, 12),
                    border: InputBorder.none,
                    hintText: 'Search here...',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _openFilterView(context),
            icon: const Icon(Icons.filter_list, color: Colors.white),
          ),
        ],
      ),
      body: isSearchClicked
          ? _buildSearchResults()
          : _buildFilterOptions(),
    );
  }

  Widget _buildSearchResults() {
    // Implement the search results UI based on searchText
    // You can use a ListView.builder or any other suitable widget
    return Center(
      child: Text('Search Results: $searchText'),
    );
  }

  Widget _buildFilterOptions() {
    // Implement your filter options UI here
    return const Center(
      child: Text('Filter Options'),
    );
  }
}

class FilterRowSection extends StatefulWidget {
  final String? selectedFilter;
  final Function(String) onSelectFilter;

  const FilterRowSection({
    Key? key,
    required this.selectedFilter,
    required this.onSelectFilter,
  }) : super(key: key);

  @override
  _FilterRowSectionState createState() => _FilterRowSectionState();
}

class _FilterRowSectionState extends State<FilterRowSection> {
  // Implement your state for FilterRowSection if needed

  @override
  Widget build(BuildContext context) {
    // Implement the build method for FilterRowSection
    return Container(); // You can return an appropriate widget here
  }
}

void main() {
  runApp(const MaterialApp(
    home: SearchView(),
  ));
}
