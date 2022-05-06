import 'package:flutter/material.dart';
import 'package:search_listview/book_page.dart';
import 'package:search_listview/books.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Search',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter ListView Search'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  List<Book> books = allBooks;

  void searchBook(String query) {
    final suggestions = allBooks.where((book) {
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();
      return bookTitle.contains(input);
    }).toList();

    setState(() {
      books = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
            onChanged: searchBook,
            decoration: const InputDecoration(
              hintText: 'Search a book',
              contentPadding: EdgeInsets.all(16),
            ),
          ),
          //const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ListTile(
                      leading: Image.network(
                        book.urlImage,
                        fit: BoxFit.cover,
                        width: 40,
                        height: 70,
                      ),
                      title: Text(book.title),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookPage(book: book))),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
