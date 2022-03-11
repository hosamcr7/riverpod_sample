


import 'package:riverpod_sample/screens/posts/post_model.dart';
import 'package:riverpod_sample/services/api_requests.dart';

class PostRepo{

  Future<List<Post>> getDataFromApi()async{
    try{
      final _result=  await ApiController.get(ENDPOINTS.posts);
      final _data=_result as List<dynamic>?;
      //return Future.error("error");
      return _data?.map((e) => Post.fromJson(e)).toList()??[] ;
    }catch(e){
      throw e.toString();
    }
  }

}