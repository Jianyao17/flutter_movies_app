import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/pages/movie_details.dart';


class MovieCard extends StatelessWidget
{
  final String title, imageUrl;
  final double rating;

  const MovieCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.rating
  });

  @override
  Widget build(BuildContext context)
  {
    final movie = Movie.getMovieByTitle(title);
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
          width: 120,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 160,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(imageUrl, fit: BoxFit.cover),
                      Positioned(top: 4, right: 4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(8),),
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 14),
                              const SizedBox(width: 4),
                              Text(rating.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
