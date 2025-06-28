import fs from "fs";
const db = JSON.parse(fs.readFileSync("./database.json", "utf-8"));

// Untuk menyimpan daftar bookmark di memori server.
// Set lebih efisien untuk menyimpan data unik.
// Kita inisialisasi dengan beberapa film agar tidak kosong.
const bookmarkedMovieIds = new Set([12, 13, 14, 15, 16, 17]);

// Untuk menyimpan daftar film yang sudah dibeli di memori server
const purchasedMovieIds = new Set();

const routes = [
  {
    method: "GET",
    path: "/",
    handler: (request, h) => 
    {
      return {
        message: "Selamat datang di Movies API!",
        version: "1.0.0",
        endpoints: 
        {
          all_movies: "/movies",
          new_movies: "/movies/new",
          popular_movies: "/movies/popular",
          movie_by_id: "/movies/{id}",

          bookmarked_movies: "/movies/bookmarked",
          add_bookmark: "POST /movies/{id}/bookmark",
          remove_bookmark: "DELETE /movies/{id}/bookmark",
          
          purchased_movies: "/movies/purchased",
          purchase_movie: "POST /movies/{id}/purchase",
        },
      };
    },
  },

  // Endpoint untuk mendapatkan semua film
  {
    method: "GET",
    path: "/movies",
    handler: (request, h) => 
    {
      const movies = db.movies
        .map((movie) => ({...movie,
          isBookmarked: bookmarkedMovieIds.has(movie.id),
          isPurchased: purchasedMovieIds.has(movie.id),
        }));
      return h.response(movies);
    },
  },

  // Endpoint untuk mendapatkan film baru
  {
    method: "GET",
    path: "/movies/new",
    handler: (request, h) => 
    {
      const newMovies = db.movies
        .filter((movie) => db.newMovieIds.includes(movie.id))
        .map((movie) => ({...movie,
          isBookmarked: bookmarkedMovieIds.has(movie.id),
          isPurchased: purchasedMovieIds.has(movie.id),
        }));
      return h.response(newMovies);
    },
  },

  // Endpoint untuk mendapatkan film populer
  {
    method: "GET",
    path: "/movies/popular",
    handler: (request, h) => 
    {
      const popularMovies = db.movies
        .filter((movie) => db.popularMovieIds.includes(movie.id))
        .map((movie) => ({...movie,
          isBookmarked: bookmarkedMovieIds.has(movie.id),
          isPurchased: purchasedMovieIds.has(movie.id),
        }));
      return h.response(popularMovies);
    },
  },

  // Endpoint untuk mendapatkan film yang sudah dibookmark
  {
    method: "GET",
    path: "/movies/bookmarked",
    handler: (request, h) => 
    {
      const bookmarkedMovies = db.movies
        .filter((movie) => bookmarkedMovieIds.has(movie.id))
        .map((movie) => ({...movie,
          isBookmarked: true,
          isPurchased: purchasedMovieIds.has(movie.id),
        }));
      return h.response(bookmarkedMovies);
    },
  },

  // Endpoint untuk mendapatkan film yang sudah dibeli
  {
    method: "GET",
    path: "/movies/purchased",
    handler: (request, h) => 
    {
      const purchasedMovies = db.movies
        .filter((movie) => purchasedMovieIds.has(movie.id))
        .map((movie) => ({...movie,
          isBookmarked: bookmarkedMovieIds.has(movie.id),
          isPurchased: true,
        }));
      return h.response(purchasedMovies);
    },
  },

  // Endpoint untuk mendapatkan film berdasarkan ID
  {
    method: "GET",
    path: "/movies/{id}",
    handler: (request, h) => 
    {
      const id = parseInt(request.params.id, 10);
      const movie = db.movies.find((m) => m.id === id);

      if (movie) 
      {
        return h.response({...movie,
          isBookmarked: bookmarkedMovieIds.has(movie.id),
          isPurchased: purchasedMovieIds.has(movie.id),
        });
      }
      return h.response({ message: "Movie not found" }).code(404);
    },
  },

  // Endpoint untuk menambahkan atau menghapus bookmark
  {
    method: "POST",
    path: "/movies/{id}/bookmark",
    handler: (request, h) => 
    {
      const id = parseInt(request.params.id, 10);
      const movieExists = db.movies.some((m) => m.id === id);

      if (!movieExists) 
      {
        return h
          .response({ message: "Movie not found" })
          .code(404);
      }

      bookmarkedMovieIds.add(id);
      return h
        .response({
          message: `Movie with id ${id} has been bookmarked.`,
          bookmarkedIds: [...bookmarkedMovieIds],
        })
        .code(200);
    },
  },

  // Endpoint untuk menghapus bookmark
  {
    method: "DELETE",
    path: "/movies/{id}/bookmark",
    handler: (request, h) => 
    {
      const id = parseInt(request.params.id, 10);

      if (bookmarkedMovieIds.has(id)) 
      {
        bookmarkedMovieIds.delete(id);
        return h
          .response({
            message: `Movie with id ${id} has been removed from bookmarks.`,
            bookmarkedIds: [...bookmarkedMovieIds],
          })
          .code(200);
      }

      return h
        .response({ message: "Movie was not bookmarked or does not exist." })
        .code(404);
    },
  },

  // Endpoint untuk membeli film
  {
    method: "POST",
    path: "/movies/{id}/purchase",
    handler: (request, h) => 
    {
      const id = parseInt(request.params.id, 10);
      const movieExists = db.movies.some((m) => m.id === id);

      if (!movieExists) 
      {
        return h
          .response({ message: "Movie not found" })
          .code(404);
      }
      if (purchasedMovieIds.has(id)) 
      {
        return h
          .response({ message: `Movie with id ${id} has already been purchased.` })
          .code(200);
      }

      purchasedMovieIds.add(id);
      return h
        .response({
          message: `Movie with id ${id} has been purchased successfully!`,
          purchasedIds: [...purchasedMovieIds],
        })
        .code(200);
    },
  },
];

// Menggunakan export default untuk ES Module
export default routes;
