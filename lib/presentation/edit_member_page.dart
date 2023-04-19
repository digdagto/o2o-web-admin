// edit_member_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o2o_point_configuration/domain/entities/member.dart';

class EditMemberPage extends StatefulWidget {
  final Member member;

  EditMemberPage({required this.member});

  @override
  _EditMemberPageState createState() => _EditMemberPageState();
}

class _EditMemberPageState extends State<EditMemberPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.member.name);
    _phoneController = TextEditingController(text: widget.member.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Member')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
            ),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
              validator: (value) => value!.isEmpty ? 'Please enter a phone number' : null,
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  final updatedMember = Member(
                    name: _nameController.text,
                    phone: _phoneController.text,
                    registeredDate: widget.member.registeredDate,
                    visitCount: widget.member.visitCount,
                    point: widget.member.point,
                  );
                  Get.back(result: updatedMember);
                }
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}