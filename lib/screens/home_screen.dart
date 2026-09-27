import 'package:flutter/material.dart';
import '../data/movies_data.dart';
import '../models/movie.dart';
import 'details_screen.dart';
import 'watchlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _openWatchlist() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const WatchlistScreen()),
    );
    setState(() {});
  }

  Future<void> _openDetails(Movie movie) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailsScreen(movie: movie)),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Watchlist'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark),
            tooltip: 'View Watchlist',
            onPressed: _openWatchlist,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: sampleMovies.length,
        itemBuilder: (context, index) {
          final movie = sampleMovies[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  movie.posterPath,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(movie.title),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _openDetails(movie),
            ),
          );
        },
      ),
    );
  }
}
