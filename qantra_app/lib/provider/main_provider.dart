import 'package:flutter/material.dart';

class MainDataProvider with ChangeNotifier {


  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController emailAddressController = new TextEditingController();
  TextEditingController searchController = new TextEditingController();
  ScrollController scrollCon = new ScrollController();
}