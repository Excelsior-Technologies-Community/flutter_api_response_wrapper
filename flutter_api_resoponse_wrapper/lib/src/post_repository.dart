import 'package:flutter_api_resoponse_wrapper/src/api_client.dart';
import 'package:flutter_api_resoponse_wrapper/src/api_response.dart';
import 'package:flutter_api_resoponse_wrapper/src/post_model.dart';


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
