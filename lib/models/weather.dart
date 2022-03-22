
class Weather 
{
  final String city;
  final double temp;
  final String image;
  final String description;


Weather({required this.city, required this.temp, required this.image, required this.description});

factory Weather.fromJson(Map<String, dynamic> json) {

  return Weather(
      city : json['city_name'],
      temp : json['temp'] as double,
      description : json['weather']['description'],
      image : json['weather']['icon'],
    );
    


}
     
}