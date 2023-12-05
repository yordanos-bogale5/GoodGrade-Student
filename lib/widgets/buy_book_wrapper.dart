import 'package:flutter/material.dart';
import 'package:creavers_project/model/books.dart';
import 'book_cover.dart';
import 'buying_books_details.dart';

class BuyBookWrappper extends StatelessWidget {
  final Book book;

  const BuyBookWrappper({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BuyingBookDetails(book: book)),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BookCover(
            imageUrl: book.imageUrl,
          ),
          Text(
            book.price <= 0 ? "Free" : "${book.price} €",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
