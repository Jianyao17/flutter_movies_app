import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/pages/movie_details.dart';

class MovieCarousel extends StatefulWidget {
  final List<Movie> movies;

  const MovieCarousel({super.key, required this.movies});

  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  Timer? _timer;
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void initState()
  {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer)
    {
      if (_currentPage < widget.movies.length - 1) { _currentPage++; }
      else { _currentPage = 0; }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,);
    });
  }

  @override
  void dispose()
  {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              padEnds: false,
              controller: _pageController,
              onPageChanged: (int page)
              {
                setState(() {
                  _currentPage = page;
                  _timer?.cancel();
                  _startAutoSlide();
                });
              },
              itemCount: widget.movies.length,
              itemBuilder: (context, index) {
                return carouselItem(widget.movies[index]);
              },
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
              widget.movies.map((movie)
              {
                int index = widget.movies.indexOf(movie);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                              ? Colors.green
                              : Colors.grey.withOpacity(0.5),
                  ),
                );
              }).toList(),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget carouselItem(Movie movie)
  {
    return InkWell(
      onTap: ()
      {
        Navigator.push(context,
          PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 300),
              pageBuilder: (_, __, ___) => MovieDetailsPage(currentMovie: movie),
              transitionsBuilder: (_, animation, __, child)
              => SlideTransition(
                  position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero
                  ).animate(animation),
                  child: child
              )
          ),
        );
      },
      splashColor: Colors.white.withValues(alpha: .2),
      highlightColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(movie.posterUrl, fit: BoxFit.cover),
              Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: const [0.3, 0.4, 0.56],
                        colors: [
                          Colors.black.withValues(alpha: .76),
                          Colors.black.withValues(alpha: .56),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0, left: 0, right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${movie.year} • ${movie.length}',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              _buildRatingStars(movie.rating),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            movie.title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                height: 1.2
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            movie.genres.join(', '),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingStars(double rating)
  {
    int fullStars = (rating / 2).floor();
    double remainder = rating / 2 - fullStars;

    return Row(
      children: [
        Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 6),
        Row(
          children: List.generate(5, (index)
          {
            if (index < fullStars) {
              return const Icon(Icons.star, color: Colors.amber, size: 18);
            } else if (remainder > 0.5 && index == fullStars) {
              return const Icon(Icons.star_half, color: Colors.amber, size: 18);
            } else {
              return const Icon(Icons.star_border, color: Colors.amber, size: 18);
            }
          }),
        ),
      ],
    );
  }
}
