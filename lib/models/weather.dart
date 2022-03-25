
class Weather 
{
  final String city;
  final num temp;
  final String image;
  final String description;
  final num windspeed;
  final String? timeStamp;


Weather({required this.city, required this.temp, required this.image, required this.description, required this.windspeed, required this.timeStamp});

factory Weather.fromJson(Map<String, dynamic> json) {
  

  return Weather(
      city : json['city_name'],
      temp : json['temp'] as num,
      description : json['weather']['description'],
      image : json['weather']['icon'],
      windspeed : json['wind_spd'] as num,
      timeStamp : json['ob_time'],

    );
    


}
     
}