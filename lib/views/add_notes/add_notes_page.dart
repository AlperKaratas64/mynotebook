import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotebook/data/src/colors.dart';
import 'package:mynotebook/data/src/strings.dart';
import 'package:mynotebook/views/add_notes/add_notes_controller.dart';

class AddNotesPage extends GetWidget<AddNotesController> {
  const AddNotesPage({super.key});
  static const String routeName = '/views/add_notes/add_notes_Page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(addNotesBarText),
          backgroundColor: mainColor,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleText(),
                _buildSizedBox(),
                _buildTextFieldTitle(),
                _buildSizedBox(),
                Divider(),
                _buildSizedBox(),
                _buildDescription(),
                _buildSizedBox(),
                _buildTextFieldDescription(),
              ],
            ),
          ),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildTitleText() {
    return Text(
      addNoteTitleText,
      style: TextStyle(fontSize: 16),
    );
  }

  Widget _buildTextFieldTitle() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 60),
        child: TextField(
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: addNoteAddTitleHintText),
          controller: controller.titleController,
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      AddNoteDescriptionText,
      style: TextStyle(fontSize: 16),
    );
  }

  Widget _buildTextFieldDescription() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 40),
        child: TextField(
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: addNotesAddDescriptionHintText),
          controller: controller.decriptionController,
        ),
      ),
    );
  }

  Widget _buildButton() {
    const double size = 40;
    return SizedBox(
      height: size,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(addNoteSaveButton),
        style: ElevatedButton.styleFrom(
          primary: mainColor,
        ),
      ),
    );
  }

  Widget _buildSizedBox() {
    return const SizedBox(
      height: 20,
    );
  }
}
