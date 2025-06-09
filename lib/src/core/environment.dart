class Environment {
  static const String environment = String.fromEnvironment('env', defaultValue: 'dev');
  static const String baseUrl =
      String.fromEnvironment('base_url', defaultValue: 'https://jsonplaceholder.typicode.com');
  static const String appName = String.fromEnvironment('app_name', defaultValue: 'Flutter Kit');
}
