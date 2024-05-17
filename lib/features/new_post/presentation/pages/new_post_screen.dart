import 'package:flutter/material.dart';

import '../../data/repositories/new_post_repository_impl.dart';
import '../../domain/entities/x_file_entity.dart';
import '../../domain/repositories/new_post_repository.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final NewPostRepository _newPostRepository = NewPostRepositoryImpl();
  final TextEditingController _postController = TextEditingController();
  bool isLoading = false;
  late XFileEntities xFileEntities;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () async {
            final result = await _newPostRepository.selectImage();
            result.fold((failure) {}, (data) {
              if (data != null) {
                xFileEntities = data;
              }
            });
          },
          child: const Text('select image'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            controller: _postController,
            decoration: InputDecoration(
              labelText: 'Post title',
              labelStyle: const TextStyle(color: Colors.black),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
            ),
            onTapOutside: (_) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
          ),
        ),
        isLoading
            ? const Center(child: CircularProgressIndicator())
            : ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  _newPostRepository
                      .addPost(
                    xFileEntities,
                    _postController.text,
                  )
                      .whenComplete(() {
                    setState(() {
                      isLoading = false;
                    });
                  });
                },
                child: const Text('add'),
              )
      ],
    );
  }
}
