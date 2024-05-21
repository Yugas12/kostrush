/// Class ini berfungsi sebagai blueprint untuk membuat argument.
/// Argument ini digunakan untuk mengirim data dari satu controller ke controller lain.
abstract class BaseArguments {
  dynamic mainArgument;
}

/// Class ini berfungsi sebagai blueprint untuk membuat contoller tanpa argument.
/// Argument ini sama seperti BaseArguments, namun tidak memiliki argument.
abstract class NoArguments extends BaseArguments {
  NoArguments() {
    mainArgument = null;
  }
}
