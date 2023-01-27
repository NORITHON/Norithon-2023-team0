import 'package:flutter/material.dart';
import 'package:flutter_norithon_team0/post/view/detail_view.dart';
import 'package:get/get.dart';

import 'package:flutter_norithon_team0/post/controller/post_controller.dart';
import 'package:flutter_norithon_team0/widget/grid_view.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => PostViewState();
}

class PostViewState extends State<PostView> {
  final PostController _postController = Get.find();

  Widget postListTile(BuildContext context) {
    return GetBuilder<PostController>(builder: (_) {
      if (_postController.isLoaded) {
        return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: _postController.postList.length,
            itemBuilder: (context, i) {
              return ElevatedButton(
                onPressed: () {
                  _postController.selectPost(_postController.postList[i]);
                  Get.to(const DetailView());
                },
                child: Text(_postController.postList[i].title!),
              );
            });
      } else {
        return Container();
      }
    });
    // });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    // final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
          shadowColor: colorScheme.shadow,
          elevation: 1.0,
          centerTitle: true,
          title: const Text('AppName'
              // TODO: add font style

              )),
      body: Center(child: postListTile(context)),
    );
  }
}
