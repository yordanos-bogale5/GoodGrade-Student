import 'package:flutter/material.dart';
import 'package:creavers_project/model/books.dart';
import 'package:creavers_project/widgets/book_cover.dart';
import 'package:creavers_project/widgets/book_details_bio.dart';
import 'package:creavers_project/widgets/book_details_box.dart';

class BuyingBookDetails extends StatelessWidget {
  final Book book;

  const BuyingBookDetails({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookDetailsBio(book: book),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buildDetailBox("Rating", book.rating, context),
                buildDetailBox("Release", book.yearRelease, context),
                buildDetailBox("Pages", book.pages, context),
                buildDetailBox("XP", book.totalXP, context),
              ],
            ),
            const Spacer(),
            Center(
              child: BookCover(
                imageUrl: book.imageUrl,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  book.price <= 0 ? "Free" : "${book.price} €",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
