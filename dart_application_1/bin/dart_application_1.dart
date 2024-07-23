import 'dart:io';

void main() {
  // print('test');
  //  data type : >
  //  String :> any character inside ' , " or """
  //  numbers : > int : any integer number  , double : any real number
  //  boolean : true or false
  //  null: null value
  //  list : []
  //  map : {'name':'ahmad'} //object
  //  set : {}
  //  variable declaration :>
  //  datatype name = value;
  // String user = 'ahmad\nnew';
  // String user2 = """ahmad
  // test
  // new
  // line""";
  // // print(user);

  // int age = 20;
//   // age = 21;
//   // double height = 10;
//   // // print(height);
//   // bool test = true;
//   // // print(test);
//   // List list1 = [1, '32', 'sff', true];
//   // // print(list1);
//   // List<int> thisIsInt = [1];
//   // //  var ,final,const,dynamic
//   // var v1 = 1;
//   // print(v1);
//   // // v1 = 1.1;
//   // dynamic v2 = 2;
//   // v2 = 2.2;
//   // //
//   // // const v4;
//   // final v3;

//   // if (x == 5) {
//   //   print('x = 5');
//   // }
//   // if (x > 5) {
//   //   print('x > 5');
//   // }
//   // if (x < 5) {
//   //   print('x < 5');
//   // } else {
//   //   print('x is not known');
//   // }
//   //  Switch: cases :
//   // int x = 6;

//   // if (x == 5) {
//   //   print('x is 5');
//   // } else if (x > 5) {
//   //   print('x is greater than 5');
//   // } else if (x < 5) {
//   //   print('x is less than 5');
//   // } else {
//   //   print('x is not 5');
//   // }
//   // switch (x) {
//   //   case 5:
//   //     print('x is 5');
//   //     break;
//   //   case > 5:
//   //     print('x is greater that 5');
//   //     break;
//   //   default:
//   //     print('x is unknown');
//   // }
//   // String username = 'ahmad';
//   // switch (username) {
//   //   case 'mohammad':
//   //     print('this is mohammad');
//   //     break; // close exit the switch statment
//   //   case 'ali':
//   //     print('this is ali');
//   //     break; // close exit the switch statment
//   //   case 'sam':
//   //     print('this is sam');
//   //     break; // close exit the switch statment

//   //   case 'ahmad':
//   //     print('this is ahmad');
//   //     break; // close exit the switch statment
//   //   default:
//   //     print('this user is unknow');
//   // }
//   String username = 'ahmad';
//   String pass = '123';

//   print("""
// 1- login
// 2- register
// 3- exit
// """);

// // //  null safty :>
// //   int choice = int.parse(stdin.readLineSync()!);
// //   print('your choice is ${choice}');
// //   print(choice is int); // datatype
// // if (choice ==1 ){
// //   if username == userinput && pass ==userpass {
// // //     you login suc
// // //   }
// // // }

// //   // var b = null;
// //   // var g = '';
// //   //  loops : for
// //   //  ++i >
// //   //  i++
// //   // int choice = int.parse(stdin.readLineSync()!);
// //   int choice;
// //   try {
// //     choice = int.parse(stdin.readLineSync()!);
// //   } catch (e) {
// //     choice = 0;
// //     print('the value is not int ');
// //   }

// //   for (int i = 4; i < choice; ++i) {
// //     print(i);
// //   }
//   void test(int x, int y) {
//     print('${x + y}');
//   }

//   String h() {
//     return 'hello';
//   }

//   test(6, 7);

// //   function take input from user 2 numbers > (+, /, -, *) return value

// //  return :> student {name,age,grade,major}
// //  create a return function  that take the student grade and return the major deppend on the grade
// //  create a function that take int and return boolean (check if the int number is prime or not )
// //
//   bool isPrime(int x) {
//     for (int i = 2; i < x; i++) {
//       if (x % i == 0) {
//         return false;
//       }
//     }
//     return true;
//   }

//   print(isPrime(11));
//   //  example :> >input hello >  if there is l in the string replace it with * he**o
//   //  concatenation of string  > sumation 2 string or more
//   String hello = 'hello';
//   String newHello = '';
//   for (int i = 0; i < hello.length; i++) {
//     // print(hello[i]);
//     if (hello[i]=='l'){
//       newHello += "*";
//     }
//     else{
//       newHello += hello[i];
//     }
//     print(newHello);
//   }
  //  example : assseeeddcc > output a3s3e2d2c
  //  create a fun to relpace the repeating character to int number

  bool isRuning = true;
  print("""
      Welcome to Our Hang man game !
      About this game you will be given 6 chances to guess the word.
      Every time you guess the word you will get 1 point.
      Every time you dont guess the word you will get 0 point and the draw of the ganging 
      will started.
      Good Luck!

      Player 1 choose a word :
    
""");
  String secret = stdin.readLineSync()!;
  print("""
















""");
  int turn = 1;
  List<String> spaces = [];
  for (int i = 0; i < secret.length; i++) {
    spaces.add('_');
  }

  bool checkWinner() {
    List winList = [];
    for (int i = 0; i < secret.length; i++) {
      winList.add(secret[i]);
    }
    if (winList ==spaces) {
      return true;
      
    }
    else{
      return false;
    }
  }

  print(spaces);
  void drowHanging(int turn) {
    switch (turn) {
      case 1:
        print("""
        ________
        |             |     
        |     
        |     
        |     
        -----------
        """);
        break;
      case 2:
        print("""
        ________
        |      |
        |      O 
        |     
        |       
        |     
        -----------
        """);
        break;
      case 3:
        print("""
        ________
        |      |
        |      O 
        |     /|\\
        |       
        |     
        -----------
        """);
        break;
      case 4:
        print("""
        ________
        |      |
        |      O 
        |     /|\\
        |      | 
        |     
        -----------
        """);
        break;
      case 5:
        print("""
        ________
        |      |
        |      O 
        |     /|\\
        |      | 
        |     / \\
        -----------
        """);
        break;
    }
  }

  while (isRuning) {
    print('enter your guess');
    String guess = stdin.readLineSync()!;
    if (guess.length > 1) {
      print('please inter a single letter');
      continue;
    }
    bool isGuess = false;
    for (int i = 0; i < secret.length; i++) {
      if (secret[i] == guess) {
        spaces[i] = guess;
        isGuess = true;
      }
    }
    if (isGuess == false) {
      turn += 1;
      print('your guess is wrong try again');
      print('turn : $turn');

      drowHanging(turn);
    }
    print(spaces);
    if (turn == 5) {
      print('you lose the correct word is $secret');
      isRuning = false;
    }
  }
}
