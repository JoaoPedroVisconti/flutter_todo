class Property{
  double width;
  double breadth;

  Property({
    this.width,
    this.breadth
  });

  factory Property.fromJson(Map<String, dynamic> json){
    return Property(
      width: json['width'],
      breadth: json['breadth']
    );
  }
}

class Shape{
  String shapeName;
  Property property;

  Shape({
    this.shapeName,
    this.property
  });

  factory Shape.fromJson(Map<String, dynamic> parsedJson){
    return Shape(
      shapeName: parsedJson['shapeName'],
      property: Property.fromJson(parsedJson['property'])
    );
  }
}