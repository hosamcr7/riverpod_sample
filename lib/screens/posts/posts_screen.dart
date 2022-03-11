import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/provider/user_provider.dart';
import 'package:riverpod_sample/screens/posts/post_model.dart';
import 'package:riverpod_sample/screens/posts/posts_repo.dart';
import 'package:riverpod_sample/services/api_requests.dart';
import 'package:riverpod_sample/widgets/error_widget.dart';
import 'package:riverpod_sample/widgets/loading_widget.dart';



final blogServiceProvider = Provider<PostRepo>((ref) => PostRepo());

final blogRepository = FutureProvider<List<Post>>((ref) async {
  final posts = ref.read(blogServiceProvider);
  return await posts.getDataFromApi();},
);

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer(builder: (context, ref, child) {
          final _email= ref.read(userProvider).userModel.email??'';
          return Text("Posts for "+_email,style: Theme.of(context).textTheme.headline6,);}),
            ),
            preferredSize: Size.fromHeight(60)),

      ),
      body: Consumer(
        builder: (context, ref, child) {
        final _response=ref.watch(blogRepository);
        return _response.map(
            data:(data) =>  _PostsList(data:data.value,onRefresh:() async=>await  ref.refresh(blogRepository)),
            error:(error) =>  ErrorApiWidget(errorMessage: error.error.toString(),onRetryPressed: () => ref.refresh(blogRepository),),
            loading:(loading) =>const LoadingWidget() ,
        );
      },),
    );
  }
}


class _PostsList extends StatelessWidget {
  const _PostsList({Key? key, required this.data, required this.onRefresh}) : super(key: key);
  final List<Post> data;
  final Future<void> Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh:  onRefresh,
      child: ListView.builder(
        itemBuilder: (context, index) =>
            ListTile(
              title: Text(data[index].title??''),
              subtitle: Text(data[index].body??''),
              leading: const Icon(Icons.title),

            ),),
    );
  }
}
