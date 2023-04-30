class EndPoints {
  final String _baseUrl = 'http://api.weatherapi.com/v1';
  final String _currentWeather = '/current.json';
  final String _apiKey = '4495b3e1588d457fa4394420233004';

  String getWeatherStatus(String userLocation) {
    return '$_baseUrl$_currentWeather?key=$_apiKey&q=$userLocation&aqi=no';
  }
}
