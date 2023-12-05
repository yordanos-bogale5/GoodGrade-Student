import 'package:flutter/material.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WishlistViewState createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  List<String> wishlistItems = [
    'Item 1',
    'Item 2',
    'Item 3',
  ];

  void removeItemFromWishlist(int index) {
    setState(() {
      wishlistItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: wishlistItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(wishlistItems[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                removeItemFromWishlist(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Perform an action when the FloatingActionButton is pressed
          // For example, add a new item to the wishlist
          setState(() {
            wishlistItems.add('New Item');
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}