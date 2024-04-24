# Music-Database-Project

This repository contains a SQL database project for a music streaming platform. The project includes table definitions, sample data insertion scripts, and various views to facilitate common queries.

## Database Design

The database consists of the following tables:

- `USER`: Stores user information, including username, email, join date, and premium status.
- `GENRE`: Stores different music genres.
- `ARTIST`: Stores information about artists, including name, country, and the year they started.
- `MUSIC_ALBUM`: Stores album details, such as album name, release year, and associated genre.
- `MUSIC_TRACK`: Stores information about individual music tracks, including track name, duration, release date, and associated album and genre.
- `USER_REVIEW`: Stores user reviews for music tracks, including review text, rating, and review date.
- `ARTIST_ALBUM`: Stores the mapping between artists and their albums.

The project also includes several views to simplify common queries, such as retrieving track genres, album artists, user reviews, and album tracks.

## Usage

1. Clone the repository or download the `Music_Database.sql` file.
2. Run the SQL script in your preferred database management system to create the database schema and populate the tables with sample data.
3. Explore the included views and modify the queries as needed for your specific use case.

## Contributing

Contributions to this project are welcome. If you find any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.
