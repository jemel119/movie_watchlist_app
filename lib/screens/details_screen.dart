import 'package:flutter/material.dart';
import '../models/movie.dart';

class DetailsScreen extends StatefulWidget {
  final Movie movie;
  const DetailsScreen({super.key, required this.movie});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        actions: [
          IconButton(
            icon: Icon(
              movie.isWatchlisted ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.amber,
            ),
            tooltip: 'Toggle Watchlist',
            onPressed: () => setState(() {
              movie.isWatchlisted = !movie.isWatchlisted;
            }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              movie.posterPath,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  Text('Cast', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(movie.cast.join(', ')),
                  const SizedBox(height: 12),
                  Text('Synopsis',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(movie.synopsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
