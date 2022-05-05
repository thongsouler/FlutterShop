import 'package:flutter/material.dart';
import 'package:testnew/dio/dio_client.dart';
import 'package:testnew/models/post.dart';

class PostScreen extends StatefulWidget {
  static const routeName = '/post-api';
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  var requesting = false;
  DioClient dioClient;
  Future<Post> post;
  @override
  void initState() {
    super.initState();
    dioClient = DioClient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Screen'),
      ),
      body: Column(
        children: [
          if (requesting)
            FutureBuilder<Post>(
                future: post,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text('Titile: ${snapshot.data.title}'),
                          Text('Body: ${snapshot.data.body}')
                        ],
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          Center(
            child: Wrap(
              children: [
                ElevatedButton(
                    onPressed: () {
                      post = dioClient.fetchPost(1);
                      setState(() {
                        requesting = true;
                      });
                    },
                    child: const Text('Get Post')),
                ElevatedButton(
                    onPressed: () {
                      post = dioClient.createPost(1, 'title', 'body');
                      setState(() {
                        requesting = true;
                      });
                    },
                    child: const Text('Create Post'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
