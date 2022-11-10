import 'package:flutter/material.dart';
import '../../model/movie_model.dart';

class MovieListTile extends StatelessWidget {
  final AsyncSnapshot<List<MovieModel>> snapshot;
  final int index;
  final VoidCallback onTap;
  const MovieListTile({
    Key? key,
    required this.snapshot,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: const Icon(Icons.newspaper),
        title: Text(snapshot.data?[index].movie ?? "nome do filme"),
        subtitle: Text(
          snapshot.data?[index].description ?? "descrição do filme",
          maxLines: 2,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
