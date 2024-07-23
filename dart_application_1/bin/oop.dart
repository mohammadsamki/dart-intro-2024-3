// ignore_for_file: non_constant_identifier_names

void main() {
  //  oop in dart ()
  Book book1 = Book(
      id: 'id1',
      author: 'author1',
      LibraryPrice: 100,
      year: 2011,
      discription: 'this is a book',
      categores: ['fiction', 'novel'],
      name: 'book1',
      libraryLocation: 'location1',
      libraryName: 'test');
  print(book1);
  book1.readBook();
}

class Library {
  String name;

  String Location;

  Library({required this.name, required this.Location});

  @override
  String toString() {
    // TODO: implement toString
    return 'this library info: $name, $Location';
  }
}

class Book extends Library {
  //  attributes
  String name;
  String _id; // private field
  String author;
  double price;
  double _LibraryPrice;
  int year;
  String discription;
  List categores;
  //  constructor
  Book(
      {required String id,
      required double LibraryPrice,
      required this.name,
      required this.author,
      required this.year,
      required this.discription,
      required this.categores,
      required String libraryName,
      required String libraryLocation})
      : _id = id,
        _LibraryPrice = LibraryPrice,
        price = (LibraryPrice + (LibraryPrice * 0.15)),
        super(name: libraryName, Location: libraryLocation);
  //  getter
  String get id => _id;
  //  setter
  set id(String value) {
    _id = value + '0';
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'this book info: ${this.name}, $discription, $price, $year, $author, $categores, $Location, ${super.name}';
  }

  void readBook() {
    print('you start reading the book $name');
  }

  //  methods
}

// class Novel extends Book {
//   String novelName;

//   Novel(this.novelName):super(LibraryPrice:10,name:'fghjk',author:'hjkl', )
// }
