# Todo movies
Aplicativo para listagens de filmes.

## Descrição
Projeto desenvolvido/refatorado usado como caso de estudos durante a mentoria de flutter ministradas pelo instrutor paulo mendes.

# Changelog:

## 2025/06/02 by rudsonalves

### Introduce FavoriteModel, refine MovieModel/UserModel, and enhance Result type

This commit adds a new `FavoriteModel` for managing user favorites, refines `MovieModel` and `UserModel` mappings/serialization, tweaks dependency injection annotation formatting, and enriches the `Result` sealed class with convenience getters and a `fold` method for cleaner error handling.

### Modified Files

* **lib/new/app/config/injection.dart**

  * Reformatted the `@InjectableInit` annotation to place parameters on separate lines for improved readability.
  * Ensured `initializerName`, `preferRelativeImports`, and `asExtension` are each on their own line within the annotation.

* **lib/new/app/domain/model/movie/movie\_model.dart**

  * Replaced the Flutter import with `dart:convert`.
  * Renamed `nomeMovieModel` to `originalTitle` and changed `releaseDate` from `String` to `DateTime`.
  * Removed the single-constructor JSON initializer in favor of `toMap/fromMap` methods.
  * Added `toMap` and `fromMap` implementations that serialize/deserialize all fields, including converting `releaseDate` to/from milliseconds since epoch.
  * Updated `copyWith` to accept `String?` for `posterPath`/`popularidade` and `DateTime?` for `releaseDate`.
  * Refactored `toString` to include all properties in a clearer format.

* **lib/new/app/domain/model/user/user\_model.dart**

  * Reformatted the `fromJson` factory to place the arrow function on its own line.
  * Adjusted the `toString` method to break long lines into multiple concatenated segments for better readability.

* **lib/new/app/utils/result.dart**

  * Added `isOk` and `isError` getters to distinguish between success and error variants.
  * Introduced `value` and `error` getters that return `T?` or `Exception?` respectively.
  * Implemented a `fold` method that accepts callbacks for both success and error cases, using Dart’s `switch` expression on the sealed type.
  * Updated `Ok` and `Error` classes to store their payload in a private field (`_value`/`_error`) and override the corresponding getter.
  * Kept the original constructors but moved them below the new getters for consistency.

### New Files

* **lib/new/app/domain/model/favorites/favorite\_model.dart**

  * Defines `FavoriteModel` with `id`, `movieId`, and `comment` fields.
  * Implements `copyWith`, `toMap`, and `fromMap` for converting between model instances and maps.
  * Provides `toJson` and `fromJson` for string-based serialization.

### Conclusion

The code now supports user favorites via `FavoriteModel`, has more robust and type-safe model serialization for movies and users, and offers a richer `Result` API—ensuring cleaner dependency injection and error handling throughout the app.
