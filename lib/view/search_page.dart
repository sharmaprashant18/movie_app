import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:movieapp/view/homepage.dart';

class SearchPage extends StatelessWidget {
  // final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                title: TextFormField(
                  // controller: textController,
                  onFieldSubmitted: (value) {
                    if (value.isEmpty) {
                      Get.defaultDialog(
                          title: 'Required',
                          middleText: 'Please enter a search query');
                    } else {
                      Get.to(() => HomePage());
                      // textController.clear();
                    }
                  },
                ),
                // backgroundColor: Colors.white,
              )),
        );
      },
    );
  }
}
