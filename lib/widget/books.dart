import 'package:flutter/material.dart';
import 'package:books_app/widget/books_listing.dart';
import 'package:books_app/main.dart';

class Books extends StatefulWidget {
  const Books(this.list, {super.key});

  final List list;

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.list.length,
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              centerTitle: true,
              leading: BackButton(
                color: Theme.of(context).colorScheme.onTertiary,
                onPressed: () {},
              ),
              title: Text("List Buku",
                  style: Theme.of(context).textTheme.headline6),
              actions: <Widget>[
                PopupMenuButton<String>(
                  color: Theme.of(context).colorScheme.secondary,
                  icon: Icon(
                    Icons.more_vert,
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                  itemBuilder: (BuildContext context) {
                    return {'Mode Terang', 'Mode Gelap'}.map((String choice) {
                      return PopupMenuItem<String>(
                        onTap: () => BooksApp.of(context).changeTheme(
                            choice == 'Mode Terang'
                                ? ThemeMode.light
                                : ThemeMode.dark),
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                ),
              ],
              bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 5,
                indicatorColor: Theme.of(context).colorScheme.onTertiary,
                tabs: const [
                  Tab(text: 'Pemrograman'),
                  Tab(text: 'Pembelajaran'),
                  Tab(text: 'Fantasy'),
                ]
              )
            ),
          body: const TabBarView(
            children: [
              BooksListing("Pemrograman"),
              BooksListing("Pembelajaran"),
              BooksListing("Fantasy"),
            ],
          )),
    );
  }
}

ThemeClass _themeClass = ThemeClass();
