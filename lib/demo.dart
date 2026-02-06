import 'package:flutter/material.dart';
import 'package:flutter_api_response_wrapper/api%20resoponse%20wrapper/api_response.dart';
import 'package:flutter_api_response_wrapper/api%20resoponse%20wrapper/post_model.dart';
import 'package:flutter_api_response_wrapper/api%20resoponse%20wrapper/post_repository.dart';
import 'api resoponse wrapper/api_status.dart';

class PostDemoScreen extends StatefulWidget {
  const PostDemoScreen({Key? key}) : super(key: key);

  @override
  State<PostDemoScreen> createState() => _PostDemoScreenState();
}

class _PostDemoScreenState extends State<PostDemoScreen> {
  final PostRepository _repository = PostRepository();
  ApiResponse<List<PostModel>> _response = ApiResponse.initial();

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    setState(() {
      _response = ApiResponse.loading();
    });

    final result = await _repository.fetchPosts();

    setState(() {
      _response = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Response Wrapper Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchPosts,
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    switch (_response.status) {
      case ApiStatus.initial:
        return const Center(
          child: Text('Initializing...'),
        );

      case ApiStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );

      case ApiStatus.error:
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _response.message ?? 'Something went wrong',
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _fetchPosts,
                child: const Text('Retry'),
              ),
            ],
          ),
        );

      case ApiStatus.success:
        final posts = _response.data!;
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(post.id.toString()),
                ),
                title: Text(post.title),
                subtitle: Text(
                  post.body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
        );
    }
  }
}
