# Movies API Server

API sederhana untuk daftar film, bookmark, dan kategori film (baru & populer) menggunakan Hapi.js.

## Setup & Menjalankan Server

1. **Install dependencies**
   ```sh
   npm install
   ```

2. **Jalankan server**
   ```sh
   npm start
   ```
   Atau untuk development (auto-reload):
   ```sh
   npm run dev
   ```

3. **Server berjalan di:**  
   [http://localhost:3000](http://localhost:3000)

## Endpoint Utama

- `GET /` — Info API & daftar endpoint
- `GET /movies` — Semua film
- `GET /movies/new` — Film baru
- `GET /movies/popular` — Film populer
- `GET /movies/bookmarked` — Film yang dibookmark
- `GET /movies/{id}` — Detail film berdasarkan ID
- `POST /movies/{id}/bookmark` — Bookmark film
- `DELETE /movies/{id}/bookmark` — Hapus bookmark film

## Catatan

- Data film diambil dari file [`database.json`](database.json).
- Bookmark hanya disimpan di memori server (reset saat server