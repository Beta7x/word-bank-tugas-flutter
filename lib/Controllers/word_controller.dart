import 'package:blog_crud/Model/word_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WordController extends GetxController {
  var isLoading = false;
  var wordList = <WordModel>[];

  Future<void> getData() async {
    try {
      QuerySnapshot words = await FirebaseFirestore.instance
          .collection('word_bank')
          .orderBy('title')
          .get();
      wordList.clear();

      for (var word in words.docs) {
        wordList.add(WordModel(
            word.data().toString().contains('id') ? word.get('id') : 'id',
            word.data().toString().contains('title')
                ? word.get('title')
                : 'title',
            word.data().toString().contains('meaning')
                ? word.get('meaning')
                : 'meaning'));
      }
      isLoading = false;
    } catch (error) {
      debugPrint(error.toString());
      Get.snackbar('Error', error.toString());
    }
  }
}
