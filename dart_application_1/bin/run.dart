void main() {
  Circle ci1 = Circle(10);
  print(ci1.area());
  Rectangle ri1 = Rectangle(10, 20);
  print(ri1.area());
}

//  area
abstract class Shape {
  double area(); // abstract method
}

class Circle extends Shape {
  double raduis;
  Circle(this.raduis);

  @override
  double area() {
    return 3.14 * raduis * raduis;
  }
}

class Rectangle extends Shape {
  double width;
  double height;
  Rectangle(this.width, this.height);

  @override
  double area() {
    return width * height;
  }
}
