import 'package:http/http.dart' as http;
import '../modals/post.dart';

class ApiCall {

  Future<List<Article>> getPostApi() async {
    List<Article> articleList = [];
    String api =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=4fe2338f564a4b429df7fddbbca2a238";

    print("In getPostApi");
    var client = http.Client();
    print("15");
    var uri = Uri.parse(api);
    print("17");
    try {
      print("20");
      var response = await client.get(uri);
      print("22");
      // var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        print(response.statusCode.toString());
        // for (Map i in data) {
        //   print("loop");
        //   // articleList.add(Article.fromJson(i));
        // }
        print("return done");
        return apiClassFromJson(response.body).articles;

      } else {
        print(response.statusCode.toString());
        return articleList;
      }
    } catch (e) {
      print("in catch");
      print(e);
    }

    return articleList;
  }
}
