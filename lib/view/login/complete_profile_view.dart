import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:fitness/common_widget/round_textfield.dart';
import 'package:fitness/services/api_service_dart.dart';
import 'package:fitness/services/user/user_profile_service.dart';
import 'package:fitness/view/login/what_your_goal._view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  //TextEditingController txtDate = TextEditingController();
  //TextEditingController txtGender = TextEditingController();
  TextEditingController txtDateOfBirth = TextEditingController();
  TextEditingController txtWeight = TextEditingController();
  TextEditingController txtHeight = TextEditingController();

  String? selectedGender;

  final ApiService _apiService = ApiService();
  late final ProfileService _profileService;

  @override
  void initState() {
    super.initState();
    _profileService = ProfileService(_apiService);
  }

  void _submitProfile() async {
    // SharedPreferences'dan userId'yi al:
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId') ?? '';

    // Kullanıcıdan alınan bilgileri değişkenlere atama:
    String gender = selectedGender ?? '';
    String dateOfBirth = txtDateOfBirth.text.trim();
    String weight = txtWeight.text.trim();
    String height = txtHeight.text.trim();

    // Burada backend'e istek atma işlemlerinizi yapın
    try {
      final response = await _profileService.updateUserProfile(
        // userId ve diğer parametreleri ekleyin
        userId: userId,
        gender: gender,
        dateOfBirth: DateTime.parse(dateOfBirth),
        weight: double.parse(weight),
        height: double.parse(height),
      );

      // Başarılı güncelleme sonrası işlemler
      if (response.statusCode == 200) {
        _showSuccessDialog();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WhatYourGoalView()));
      } else {
// Kullanıcıya bir hata mesajı göster
        _showErrorDialog('Failed to complete profile. Please try again.');
      }
    } catch (e) {
// Kullanıcıya hata mesajı göstermek için bir dialog göster
      _showErrorDialog('An error occurred while updating profile: $e');
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Profile Completed'),
        content: const Text('Your profile has been successfully updated.'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Dialog'u kapat
            },
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Dialog'u kapat
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              Image.asset(
                "assets/img/complete_profile.png",
                width: media.width,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Text(
                "Let's complete your profile ",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "It will helps us to know more about you!",
                style: TextStyle(color: TColor.gray, fontSize: 12),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: TColor.lightGray,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Image.asset(
                                "assets/img/gender.png",
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                                color: TColor.gray,
                              ),
                            ),
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedGender,
                                  items: ["Male", "Female"].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                            color: TColor.gray, fontSize: 14),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedGender = newValue;
                                    });
                                  },
                                  hint: Text(
                                    "Choose Gender",
                                    style: TextStyle(
                                        color: TColor.gray, fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            )
                          ],
                        )),
                    SizedBox(
                      height: media.width * 0.04,
                    ),
                    RoundTextField(
                      controller: txtDateOfBirth,
                      hintText: "Date of Birth",
                      icon: "assets/img/date.png",
                    ),
                    SizedBox(
                      height: media.width * 0.04,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RoundTextField(
                            controller: txtWeight,
                            hintText: "Your Weight",
                            icon: "assets/img/weight.png",
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: TColor.secondaryG,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "KG",
                            style: TextStyle(color: TColor.white, fontSize: 12),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: media.width * 0.04,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RoundTextField(
                            controller: txtHeight,
                            hintText: "Your Height",
                            icon: "assets/img/hight.png",
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: TColor.secondaryG,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "CM",
                            style: TextStyle(color: TColor.white, fontSize: 12),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: media.width * 0.07,
                    ),
                    RoundButton(
                        title: "Next >",
                        onPressed: () {
                          _submitProfile();
                        }),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
