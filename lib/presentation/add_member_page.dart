// add_member_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o2o_point_configuration/domain/entities/member.dart';

class AddMemberPage extends StatefulWidget {
  @override
  _AddMemberPageState createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Member')),
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
                  final newMember = Member(
                    name: _nameController.text,
                    phone: _phoneController.text,
                    registeredDate: DateTime.now(),
                    visitCount: 0,
                    point: 0,
                  );
                  Get.back(result: newMember);
                }
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}