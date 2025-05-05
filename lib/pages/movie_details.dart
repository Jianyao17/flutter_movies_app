import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';

class MovieDetailsPage extends StatelessWidget
{
  final Movie currentMovie;
  const MovieDetailsPage({super.key, required this.currentMovie});

  @override
  Widget build(BuildContext context)
  => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context)
        ),
        title: Text('Movie Details',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20
          )
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster Image with back button
            SizedBox(
              width: double.infinity,
              height: 450,
              child: Image.network(
                currentMovie.posterUrl,
                fit: BoxFit.cover,
              ),
            ),

            // Movie Info Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title and Year
                            Text('${currentMovie.title} (${currentMovie.year.toString()})',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Rating and Length
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 20),
                                Text(' ${currentMovie.rating}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(width: 16),

                                Icon(Icons.access_time, color: Colors.grey[600], size: 20),
                                Text(' ${currentMovie.length}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        alignment: Alignment.center,
                        child: FloatingActionButton(
                          backgroundColor: Colors.green,
                          child: Icon(
                              Icons.bookmark_outline_rounded,
                              color: Colors.white,
                              size: 24),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Genres
                  Wrap(
                    spacing: 8,
                    children: currentMovie.genres
                        .map((genre) => Chip(
                          padding: const EdgeInsets.all(4),
                          label: Text(genre,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14
                            )
                          ),
                          backgroundColor: Colors.white10,
                          side: BorderSide(color: Colors.transparent),
                        )).toList(),
                  ),
                  const SizedBox(height: 24),

                  // Synopsis
                  const Text(
                    'Synopsis',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    currentMovie.synopsis,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 56)
                ],
              ),
            ),
          ],
        ),
      ),
    );
}
