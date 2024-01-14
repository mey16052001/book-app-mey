import 'package:books_app/model/book.dart';
import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {
  const BookTile(this.book, {super.key});
  final BookModel book;

  @override
  Widget build(BuildContext context) {

  return Card(
          color: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: book.volumeInfo.imageLinks.thumbnail != null 
                      ? Image.network(
                        book.volumeInfo.imageLinks.thumbnail,
                        height: 150,
                        width: 110,
                        fit: BoxFit.fill,
                      )
                    : Image.asset(
                        "assets/images/noImage.png",
                        height: 110,
                        width: 110,
                        fit: BoxFit.fill,
                      ),
              ),
              Container(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.volumeInfo.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14
                      ),
                    ),
                    Text(
                      book.volumeInfo.authors.join(","),
                      style: const TextStyle(fontSize: 12)
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 5, bottom: 5),
                          child: Row(
                            children: [
                              Text(
                                "Bahasa: ${book.volumeInfo.language == 'id' ? 'Indonesia' : 'English'}",
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(width: 30),
                              book.volumeInfo.categories != null
                              ? Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                      ),
                                      child: Text(
                                          book.volumeInfo.categories,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                          textAlign:
                                              TextAlign.center)
                                            )
                                          )
                              : const Text("")
                            ],
                          )
                        )
                      )
                    ),
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
