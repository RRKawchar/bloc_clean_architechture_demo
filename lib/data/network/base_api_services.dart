
abstract class BaseApiServices{


   Future<dynamic> getRequest(String url);

   Future<dynamic> postRequest(String url,var body);

   Future<dynamic> deleteRequest(String url);

}