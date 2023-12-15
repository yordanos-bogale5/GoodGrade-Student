import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List<String> cartItems = [
    'Mathmatics',
    'Physics',
    'Biology'
  ];

  void removeItemFromCart(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Cart'),
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
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cartItems[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                removeItemFromCart(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Perform an action when the FloatingActionButton is pressed
          // For example, clear the entire cart
          setState(() {
            cartItems.clear();
          });
        },
        child: const Icon(Icons.delete_sweep),
      ),
    );
  }
}