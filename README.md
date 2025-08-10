# Movie Explorer - Flutter App with TMDB API & BLoC Pattern

<img width="405" height="900" alt="Screenshot (476)" src="https://github.com/user-attachments/assets/da586a3c-7001-4b99-b081-14327382c9ab" />
<img width="422" height="826" alt="Screenshot (477)" src="https://github.com/user-attachments/assets/825e156a-067b-4588-9ff4-72699658dbb6" />
<img width="441" height="843" alt="Screenshot (478)" src="https://github.com/user-attachments/assets/c6a3a6f5-63b5-450b-8d90-5edf932c4c8f" />

## Overview

**Movie Explorer** is a Flutter application that fetches and displays popular movies and TV shows from the TMDB (The Movie Database) API. 
The app is built following the **Clean Architecture** principles and utilizes the **BLoC pattern** for state management, ensuring a scalable and maintainable codebase.

---

## Features

- Browse **Popular Movies** with horizontal scrolling.
- View details of movies including trailers, ratings, and release dates.
- Browse **Now Playing**, **Top Rated**, and **Upcoming** movies.
- Browse **Popular TV Shows**, **Top Rated TV Shows**, **Airing Today**, and **On The Air** shows.
- Separate BLoCs for Movies, Movie Details, TV Shows, and TV Details.
- Clean Architecture for separation of concerns.
- Responsive and modern UI with a dark theme.

---


## BLoC Structure

- `MoviesBloc`: Handles fetching and managing movie lists.
- `MovieDetailBloc`: Handles fetching details of a selected movie.
- `TvBloc`: Handles fetching and managing TV shows list.
- `TvDetailBloc`: Handles fetching details of a selected TV show.

Each BLoC uses events to trigger state changes and emits states accordingly to update the UI.

## Dependency Injection

This project uses **flutter_bloc**'s `MultiRepositoryProvider` for dependency injection and managing repositories across the app.  
Instead of using `get_it` (a service locator), repositories are provided directly in the widget tree, which allows easy access inside BLoCs and widgets via context.

Example:

```dart
MultiRepositoryProvider(
  providers: [
    RepositoryProvider<MovieAndTvRepository>(
      create: (_) => MovieAndTvRepositoryImpl(TmdbApi()),
    ),
  ],
  child: MultiBlocProvider(
    // Your blocs here
  ),
);
