import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;

import '../../../utils/api.dart';

class RegisterController extends GetxController {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;

  Future<void> register() async {
    isLoading.value = true;

    final String url = '${BaseUrl.api}/register';
    final Http.Response response = await Http.post(
      Uri.parse(url),
      body: {
        'name': namaController.text,
        'email': emailController.text,
        'password': passwordController.text,
      },
    );
    if (response.statusCode == 201) {
      Get.snackbar("Succes", "Register Success",
          snackPosition: SnackPosition.BOTTOM);
      Get.offAllNamed('/login');
    } else {
      Get.snackbar("Error", "Register Failed",
          snackPosition: SnackPosition.BOTTOM);
    }
    isLoading(false);
  }

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
