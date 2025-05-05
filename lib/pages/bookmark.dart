import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/widget/movie_card.dart';


class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage>
    with AutomaticKeepAliveClientMixin
{
  String _searchQuery = '';

  @override
  bool get wantKeepAlive => true;

  void _onSearchChanged(String value)
    => setState(() => _searchQuery = value);

  final List<Movie> bookmarks = Movie.getAllBookmarkedMovies();

  @override
  Widget build(BuildContext context)
  {
    super.build(context);

    List<Movie> filteredBookmarks = bookmarks
        .where((movie) => movie.title.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        leading: Icon(Icons.bookmark_rounded),
        title: Text('Bookmarks',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20
          )
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
            const SizedBox(height: 24),

            // GridView with Images and Titles
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.6/3,
                ),
                itemCount: filteredBookmarks.length,
                itemBuilder: (context, index) => MovieCard(
                   title:  filteredBookmarks[index].title,
                   imageUrl: filteredBookmarks[index].posterUrl,
                   rating: filteredBookmarks[index].rating,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}