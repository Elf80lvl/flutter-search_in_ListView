import 'package:flutter/material.dart';
import 'package:search_listview/books.dart';

class BookPage extends StatelessWidget {
  final Book book;
  const BookPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 16),
            Image.network(
              book.urlImage,
              width: 200,
              height: 300,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
