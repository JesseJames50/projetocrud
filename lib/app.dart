import 'package:flutter/material.dart';

import 'Home/movie_page .dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Cadastro de Filmes';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData.dark(),
      home: const MoviePage(),
    );
  }
}
