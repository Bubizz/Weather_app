
class Weather 
{
  final String city;

 

Weather.fromJson(Map<String, dynamic> json)
      : city = json['data'][0]['city_name'];
     
}