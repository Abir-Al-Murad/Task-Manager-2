class Urls{
  static String _baseUrl = 'https://api.syedbipul.me';
  static String registerUrl = "${_baseUrl}/user/register";
  static String loginUrl = "${_baseUrl}/user/login";
  static String allTask = "${_baseUrl}/task/get-all-task";
  static String addTask = "${_baseUrl}/task/create-task";
  static String deleteTask(String id) => "${_baseUrl}/task/delete-task/$id";

}