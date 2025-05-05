import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/widget/movie_card.dart';
import 'package:movies_app/widget/movie_carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin
{
  @override
  bool get wantKeepAlive => true;

  void _onSearchChanged(String query) {}

  final List<Movie> carouselMovies = Movie.getAllPopularMovies();
  final List<Movie> popularMovies = Movie.getAllPopularMovies();
  final List<Movie> newMovies = Movie.getAllNewMovies();


  @override
  Widget build(BuildContext context)
  {
    carouselMovies.shuffle();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        leading: Icon(Icons.home),
        title: Text('Home',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20
          )
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                onChanged: _onSearchChanged,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14
                ),
                decoration: InputDecoration(
                  hintText: 'Find Movie',
                  prefixIcon: const Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.7)),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:
                      Theme.of(context).primaryColor.withValues(alpha: 0.8), width: 2),
                      borderRadius: BorderRadius.circular(16)
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Movies Carousel
              SizedBox(
                height: 350,
                child: MovieCarousel(movies: carouselMovies),
              ),
              const SizedBox(height: 20),

              const Text(
                "Popular Movies",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Popular Movies List
              SizedBox(
                height: 210,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularMovies.length,
                  separatorBuilder: (_, _) => SizedBox(width: 12),
                  itemBuilder: (context, index) => MovieCard(
                      title: popularMovies[index].title,
                      imageUrl: popularMovies[index].posterUrl,
                      rating: popularMovies[index].rating,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              const Text(
                "New Movies",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // New Movies List
              SizedBox(
                height: 210,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: newMovies.length,
                  separatorBuilder: (_, _) => SizedBox(width: 12),
                  itemBuilder: (context, index) => MovieCard(
                    title: newMovies[index].title,
                    imageUrl: newMovies[index].posterUrl,
                    rating: newMovies[index].rating,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
