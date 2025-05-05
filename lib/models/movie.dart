
class Movie {
  final int year;
  final String posterUrl;
  final String title;
  final String length;
  final double rating;
  final List<String> genres;
  final String synopsis;

  const Movie({
    required this.posterUrl,
    required this.title,
    required this.year,
    required this.length,
    required this.rating,
    required this.genres,
    required this.synopsis,
  });

  static List<Movie> allMovies({imgSize = 'w500'})
  => [
    Movie(
      posterUrl: 'https://image.tmdb.org/t/p/$imgSize/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg',
      title: 'Inside Out 2',
      year: 2024,
      length: '1h 40m',
      rating: 8.0,
      genres: ['Animation', 'Family', 'Drama', 'Comedy'],
      synopsis:
      'Film ini kembali ke pikiran Riley yang baru saja menjadi remaja tepat saat markas besar tiba-tiba dihancurkan untuk memberi ruang bagi sesuatu yang sama sekali tidak terduga: Emosi baru! Joy, Sadness, Anger, Fear, dan Disgust, yang sudah lama menjalankan operasi yang sukses, tidak yakin bagaimana perasaannya ketika Anxiety muncul. Dan sepertinya dia tidak sendirian.',
    ),
    Movie(
      posterUrl: 'https://image.tmdb.org/t/p/$imgSize/gKkl37BQuKTanygYQG1pyYgLVgf.jpg',
      title: 'Kingdom of the Planet of the Apes',
      year: 2024,
      length: '2h 25m',
      rating: 7.5,
      genres: ['Science Fiction', 'Adventure', 'Action'],
      synopsis:
      'Beberapa generasi di masa depan setelah pemerintahan Caesar, kera kini menjadi spesies dominan dan hidup harmonis sementara manusia terpaksa hidup dalam bayang-bayang. Saat pemimpin kera baru yang tiran membangun kerajaannya, seekor kera muda melakukan perjalanan mengerikan yang akan membuatnya mempertanyakan semua yang telah dia ketahui tentang masa lalu dan membuat pilihan yang akan menentukan masa depan kera dan manusia.',
    ),
    Movie(
      posterUrl: 'https://image.tmdb.org/t/p/$imgSize/d8Ryb8AunYAuycVKDp5HpdWPKgC.jpg',
      title: 'Sonic the Hedgehog 3',
      year: 2024,
      length: '1h 55m',
      rating: 7.2,
      genres: ['Action', 'Adventure', 'Family', 'Science Fiction', 'Comedy'],
      synopsis:
      'Sonic si landak biru super cepat kembali beraksi menghadapi tantangan baru dan musuh yang lebih kuat, mungkin termasuk kembalinya karakter ikonik lainnya dari dunia game.',
    ),
    Movie(
      posterUrl: 'https://image.tmdb.org/t/p/$imgSize/pzIddUEMWhWzfvLI3TwxUG2wGoi.jpg',
      title: 'Captain America: Brave New World',
      year: 2025,
      length: '2h 15m',
      rating: 7.0,
      genres: ['Action', 'Science Fiction', 'Adventure'],
      synopsis:
      'Sam Wilson bergulat dengan perannya sebagai Captain America baru, menghadapi ancaman global yang memaksanya untuk membentuk tim baru dan menghadapi masa lalu.',
    ),
    Movie(
      posterUrl: 'https://image.tmdb.org/t/p/$imgSize/iPPTGh2OXuIv6d7cwuoPkw8govp.jpg',
      title: 'Minecraft',
      year: 2025,
      length: '1h 50m',
      rating: 7.1,
      genres: ['Adventure', 'Fantasy', 'Family', 'Comedy'],
      synopsis:
      'Adaptasi live-action dari video game sandbox populer, mengikuti petualangan karakter di dunia balok yang luas dan tak terbatas.',
    ),
    Movie(
      posterUrl: 'https://image.tmdb.org/t/p/$imgSize/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg',
      title: 'The Shawshank Redemption',
      year: 1994,
      length: '2h 22m',
      rating: 8.7,
      genres: ['Drama', 'Crime'],
      synopsis:
      'Dua pria yang dipenjara menjalin ikatan selama beberapa tahun, menemukan pelipur lara dan penebusan melalui tindakan kesopanan bersama. Andy Dufresne dijatuhi hukuman penjara seumur hidup di penjara Shawshank atas pembunuhan istri dan kekasihnya.',
    ),
    Movie(
      posterUrl: 'https://image.tmdb.org/t/p/$imgSize/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
      title: 'The Dark Knight',
      year: 2008,
      length: '2h 32m',
      rating: 8.5,
      genres: ['Drama', 'Action', 'Crime', 'Thriller'],
      synopsis:
      'Ketika ancaman yang dikenal sebagai Joker mendatangkan malapetaka dan kekacauan pada orang-orang Gotham, Batman harus menerima salah satu ujian psikologis dan fisik terbesar dari kemampuannya untuk melawan ketidakadilan.',
    ),
    Movie(
      posterUrl: 'https://image.tmdb.org/t/p/$imgSize/ljsZTbVsrQSqZgWeep2B1QiDKuh.jpg',
      title: 'Inception',
      year: 2010,
      length: '2h 28m',
      rating: 8.4,
      genres: ['Action', 'Science Fiction', 'Adventure'],
      synopsis:
      'Seorang pencuri yang mencuri rahasia perusahaan melalui penggunaan teknologi berbagi mimpi diberi tugas kebalikan: menanamkan ide ke dalam pikiran target, tetapi masa lalunya yang tragis dapat membawa bencana bagi proyek dan timnya.',
    ),
    Movie(
      posterUrl: 'https://image.tmdb.org/t/p/$imgSize/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg',
      title: 'Parasite',
      year: 2019,
      length: '2h 12m',
      rating: 8.5,
      genres: ['Comedy', 'Thriller', 'Drama'],
      synopsis:
      'Keserakahan dan diskriminasi kelas mengancam hubungan simbiosis yang baru terbentuk antara keluarga Park yang kaya dan keluarga Kim yang miskin.',
    ),
    Movie(
      posterUrl: 'https://image.tmdb.org/t/p/$imgSize/uJYYizSuA9Y3DCs0qS4qWvHfZg4.jpg',
      title: 'Spider-Man: No Way Home',
      year: 2021,
      length: '2h 28m',
      rating: 8.0,
      genres: ['Action', 'Adventure', 'Science Fiction'],
      synopsis:
      'Peter Parker putus asa meminta bantuan Doctor Strange setelah identitasnya sebagai Spider-Man terungkap. Ketika sebuah mantra menjadi serba salah, musuh berbahaya dari dunia lain mulai muncul, memaksa Peter untuk menemukan apa artinya menjadi Spider-Man.',
    ),
    Movie(
      posterUrl: 'https://image.tmdb.org/t/p/$imgSize/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg',
      title: 'Avatar: The Way of Water',
      year: 2022,
      length: '3h 12m',
      rating: 7.7,
      genres: ['Science Fiction', 'Adventure', 'Action'],
      synopsis:
      'Jake Sully tinggal bersama keluarga barunya di planet Pandora. Begitu ancaman yang akrab kembali untuk menyelesaikan apa yang sebelumnya dimulai, Jake harus bekerja dengan Neytiri dan pasukan ras Na\'vi untuk melindungi planet mereka.',
    ),


    Movie(
      posterUrl: 'https://image.tmdb.org/t/p/$imgSize/d5NXSklXo0qyIYkgV94XAgMIckC.jpg',
      title: 'Dune',
      year: 2021,
      length: '2h 35m',
      rating: 8.5,
      genres: ['Science Fiction', 'Adventure'],
      synopsis:
      'Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planet`s exclusive supply of the most precious resource in existence-a commodity capable of unlocking humanity`s greatest potential-only those who can conquer their fear will survive.',
    ),
    Movie(
      posterUrl: 'https://image.tmdb.org/t/p/$imgSize/39wmItIWsg5sZMyRUHLkWBcuVCM.jpg',
      title: 'Spirited Away',
      year: 2001,
      length: '2h 5m',
      rating: 8.5,
      genres: ['Animation', 'Family', 'Fantasy'],
      synopsis:
      'Selama kepindahan keluarganya ke pinggiran kota, seorang gadis berusia 10 tahun yang cemberut berkelana ke dunia yang diperintah oleh dewa, penyihir, dan roh, dan di mana manusia diubah menjadi binatang buas.',
    ),
    Movie(
      posterUrl: 'https://image.tmdb.org/t/p/$imgSize/wf0rvyXBTf2me1af6T0Z7WykTVo.jpg',
      title: 'Mad Max: Fury Road',
      year: 2015,
      length: '2h 1m',
      rating: 7.6,
      genres: ['Action', 'Adventure', 'Science Fiction'],
      synopsis:
      'Di lanskap gurun pasca-apokaliptik, seorang wanita memberontak melawan penguasa tiran dalam mencari tanah airnya dengan bantuan sekelompok tahanan wanita, seorang pemuja psikotik, dan seorang drifter bernama Max.',
    ),
    Movie(
      posterUrl: 'https://image.tmdb.org/t/p/$imgSize/w3LxiVYdWWRvEVdn5RYq6jIqkb1.jpg',
      title: 'Everything Everywhere All at Once',
      year: 2022,
      length: '2h 19m',
      rating: 7.8,
      genres: ['Action', 'Adventure', 'Science Fiction', 'Comedy'],
      synopsis:
      'Seorang imigran Tionghoa paruh baya terseret ke dalam petualangan gila, di mana dia sendirian dapat menyelamatkan keberadaan dengan menjelajahi alam semesta lain dan menghubungkan dengan kehidupan yang bisa dia jalani.',
    ),
    Movie(
      posterUrl: 'https://image.tmdb.org/t/p/$imgSize/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
      title: 'Interstellar',
      year: 2014,
      length: '2h 49m',
      rating: 8.4,
      genres: ['Adventure', 'Drama', 'Science Fiction'],
      synopsis:
      'Ketika waktu Bumi akan segera berakhir, tim penjelajah melakukan misi paling penting dalam sejarah manusia: melakukan perjalanan melampaui galaksi ini untuk menemukan apakah umat manusia memiliki masa depan di antara bintang-bintang.',
    ),
    Movie(
      posterUrl: 'https://image.tmdb.org/t/p/$imgSize/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg',
      title: 'Joker',
      year: 2019,
      length: '2h 2m',
      rating: 8.2,
      genres: ['Crime', 'Thriller', 'Drama'],
      synopsis:
      'Selama tahun 1980-an, seorang komedian stand-up yang gagal didorong menjadi gila, mengubah hidupnya menjadi kekacauan dan kejahatan di Gotham City sambil menjadi sosok revolusi budaya yang terkenal.',
    ),
  ];

  static final List<String> _newMovieTitles = [
    'Inside Out 2',
    'Kingdom of the Planet of the Apes',
    'Sonic the Hedgehog 3',
    'Captain America: Brave New World',
    'Minecraft',
  ];

  static final List<String> _popularMovieTitles = [
    'The Shawshank Redemption',
    'The Dark Knight',
    'Inception',
    'Parasite',
    'Spider-Man: No Way Home',
    'Avatar: The Way of Water',
  ];

  static final List<String> _bookmarkedMovieTitles = [
    'Dune',
    'Spirited Away',
    'Mad Max: Fury Road',
    'Everything Everywhere All at Once',
    'Interstellar',
    'Joker',
  ];

  static List<Movie> getAllNewMovies({imgSize = 'w500'})
  => allMovies(imgSize: imgSize)
      .where((movie) => _newMovieTitles.contains(movie.title))
      .toList();

  static List<Movie> getAllPopularMovies({imgSize = 'w500'})
  => allMovies(imgSize: imgSize)
      .where((movie) => _popularMovieTitles.contains(movie.title))
      .toList();

  static List<Movie> getAllBookmarkedMovies({imgSize = 'w500'})
  => allMovies(imgSize: imgSize)
      .where((movie) => _bookmarkedMovieTitles.contains(movie.title))
      .toList();

  static Movie getMovieByTitle(String title)
  => allMovies(imgSize: 'original').firstWhere(
          (movie) => movie.title.toLowerCase().contains(title.toLowerCase()));
}