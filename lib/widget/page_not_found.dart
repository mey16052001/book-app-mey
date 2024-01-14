import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Tidak Ada"),
      ),
      body: const Center(
        child: Text("Halaman Tidak Tersedia."),
      ),
    );
  }
}