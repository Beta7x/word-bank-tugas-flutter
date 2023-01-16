import 'package:blog_crud/Controllers/word_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.title});
  WordController wordController = Get.put(WordController());

  final String title;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WordController>(
      init: WordController(),
      initState: (_) {},
      builder: (wordController) {
        wordController.getData();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow,
            title: const Text(
              'Word Bank',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                letterSpacing: 2,
                color: Colors.black,
              ),
            ),
          ),
          body: Center(
            child: wordController.isLoading
                ? const CircularProgressIndicator()
                : ListView.separated(
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.deepOrange.shade100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    wordController.wordList[index].title,
                                    style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.visible,
                                    textAlign: TextAlign.start,
                                  ),
                                  Text(
                                    wordController.wordList[index].meaning,
                                    style: const TextStyle(fontSize: 16),
                                    overflow: TextOverflow.visible,
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          FontAwesomeIcons.penToSquare)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          FontAwesomeIcons.deleteLeft))
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, index) {
                      return const Divider(
                        thickness: 2,
                        color: Colors.black,
                      );
                    },
                    itemCount: wordController.wordList.length,
                  ),
          ),
        );
      },
    );
  }
}
