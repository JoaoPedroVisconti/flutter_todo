class Address {
  final String city;
  final List<String> streets;

  Address({
    this.city,
    this.streets
  });

  factory Address.fromJson(Map<String, dynamic> parsedJson){
    var streetsFromJson = parsedJson['streets'];
    List<String> streetList = streetsFromJson.cast<String>(); 

        // Here, first we are mapping our variable streetsFromJson to the streets entity. 
        // streetsFromJson is still a List<dynamic>. 
        // Now we explicitly create a new List<String> streetsList that contains all 
        // elements from streetsFromJson.

    return new Address(
      city: parsedJson['city'],
      streets: streetList
    );
  }

}