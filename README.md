# 📱 TheMovieDB Flutter App - Clean Architecture
![Stars](https://img.shields.io/github/stars/josmarsmp/movies-series-guide?style=social)

_Mobile app developed using Google's [Flutter](https://flutter.dev) SDK that consumes [TheMovieD API](https://developers.themoviedb.org/3) 🎬 to retrieve trending movies and performers, user information and their favorites movies and series 🍿_


## 💡 Features

* Sign in with your TheMovieDB Credentials (if you don't have an account, you must sign up in [TheMovieDB](https://www.themoviedb.org/signup))
* See trending Movies with it's synopsis and cast 🎬
* See trending performers and their popular movies 🕴️
* Add or remove a movie from your favorites list 🌟
* See your favorites movies and series 🤩
* Set Dark or Light Mode 🌙 → ☀️


## 🏁 Getting Started

Create .env file in root with following keys
```
TMDB_KEY=Your TheMovieDB API Key
```

After that, you must run following commands for code generation

```
flutter pub get
flutter pub run buil_runner build
flutter pub run flutter_gen:flutter_gen_command
```

Run app with command
```
flutter run
```

## Preview
<p align="center">
    <img src="https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExODFmZDY5YjNiMTNhZDc1OWM2MmQ5ODc0ZjVlOWRkMTFjNDExNjRkNiZjdD1n/wGO88CSeMt7tkvkKvK/giphy.gif" alt="Movie App Light Preview" width="200">
    &nbsp;
    <img src="https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExM2VhZDZjNjE3NzYxNGY2MTNmYjk2NDcxMDQ5YTEzZjU0NjVlOGFmYiZjdD1n/cuoL6V5HijPujes4oL/giphy.gif" alt="Movie App Light Preview" width="200">
</p>


## Developed 💻 with ❤️ by

* **Josmar Salvador** 👨🏽‍💻 - [JosmarSMP](https://github.com/josmarsmp)



