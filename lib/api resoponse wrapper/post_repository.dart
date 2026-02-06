import 'package:flutter_api_response_wrapper/api%20resoponse%20wrapper/api_client.dart';
import 'package:flutter_api_response_wrapper/api%20resoponse%20wrapper/api_response.dart';
import 'package:flutter_api_response_wrapper/api%20resoponse%20wrapper/post_model.dart';


class PostRepository {
  final ApiClient _apiClient = ApiClient();

  Future<ApiResponse<List<PostModel>>> fetchPosts() {
    return _apiClient.get<List<PostModel>>(
      '/posts',
          (json) => List<PostModel>.from(
        json.map((e) => PostModel.fromJson(e)),
      ),
    );
  }
}
