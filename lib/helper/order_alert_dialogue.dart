import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/gymmodel/GymListModel.dart';
import '../providers/gym_list_provider.dart';
import '../res/components/input_text_field.dart';
import '../utilities/routes/route_name.dart';

Future<void> ShowOrderDialogue(BuildContext context) async {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _gymidController = TextEditingController();
  TextEditingController _userIdController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Center(
          child: const Text(
            'Please enter details below ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        content: Builder(
          builder: (context) {
            var width = MediaQuery.of(context).size.width;
            return SingleChildScrollView(
              child: Container(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gym Id',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    TextFormField(
                      controller: _gymidController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Gym id ',
                        contentPadding: EdgeInsets.all(17),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      validator: (value) {
                        return value!.isEmpty ? ' ' : null;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'User id ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    TextFormField(
                      controller: _userIdController,
                      decoration: const InputDecoration(
                        hintText: 'Enter user id',
                        contentPadding: EdgeInsets.all(17),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      validator: (value) {
                        return value!.isEmpty ? ' ' : null;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Name',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your Name',
                        contentPadding: EdgeInsets.all(17),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      validator: (value) {
                        return value!.isEmpty ? ' ' : null;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Address',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your address',
                        contentPadding: EdgeInsets.all(17),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      validator: (value) {
                        return value!.isEmpty ? ' ' : null;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Phone',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        hintText: 'Enter mobile number',
                        contentPadding: EdgeInsets.all(17),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      validator: (value) {
                        return value!.isEmpty ? ' ' : null;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Quantity',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    TextFormField(
                      controller: _quantityController,
                      decoration: const InputDecoration(
                        hintText: 'Enter quantity',
                        contentPadding: EdgeInsets.all(17),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      validator: (value) {
                        return value!.isEmpty ? ' ' : null;
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Submit',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          )
        ],
      );
    },
  );
}
