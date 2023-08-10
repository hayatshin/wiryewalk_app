import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:wiryewalk_app/constants/gaps.dart';
import 'package:wiryewalk_app/constants/sizes.dart';
import 'package:wiryewalk_app/utils.dart';

class RegSignUpScreen extends StatefulWidget {
  const RegSignUpScreen({super.key});

  @override
  State<RegSignUpScreen> createState() => _RegSignUpScreenState();
}

class _RegSignUpScreenState extends State<RegSignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _birthdayController = TextEditingController();
  final List<String> _regionItems = ["송파구", "성남시", "하남시", "언젠가 위례"];
  String? _selectedGender;
  String? _selectedRegion;
  DateTime? _selectedBirthday;
  bool? _agreement = false;

  void selectBirthday(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedBirthday ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.grey.shade300, // header background color
              onPrimary: Theme.of(context).primaryColor, // header text color
              onSurface: Colors.grey.shade800, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor:
                    Theme.of(context).primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _birthdayController.text = dateTimeToString(picked);
      });
    }
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
        ),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(
                  Sizes.size20,
                ),
                child: Text(
                  "정보를 입력해주세요.",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  Sizes.size20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: Sizes.size40,
                      backgroundColor: Colors.grey.shade200,
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: Sizes.size44,
                      ),
                    ),
                    Gaps.v10,
                    Text(
                      "사진",
                      style: TextStyle(
                        fontSize: Sizes.size14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Gaps.v40,
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          ...[
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "이름",
                                labelStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: Sizes.size14,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size10,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size10,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ),
                            ),
                            Gaps.v28,
                            DropdownButtonFormField2(
                              iconStyleData: const IconStyleData(),
                              hint: Text(
                                '성별',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: Sizes.size14,
                                ),
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: Sizes.size14,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade500,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size10,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size10,
                                  ),
                                ),
                              ),
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.only(right: 8),
                              ),
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                              items: ["남성", "여성"]
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: Sizes.size14,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value!;
                                });
                              },
                              selectedItemBuilder: (context) {
                                return _regionItems
                                    .map(
                                      (e) => Text(
                                        _selectedGender ?? "",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: Sizes.size14,
                                        ),
                                      ),
                                    )
                                    .toList();
                              },
                            ),
                            Gaps.v28,
                            TextFormField(
                              controller: _birthdayController,
                              decoration: InputDecoration(
                                hintText: "생년월일",
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: Sizes.size14,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size10,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size10,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ),
                              onTap: () => selectBirthday(context),
                            ),
                            Gaps.v28,
                            DropdownButtonFormField2(
                              hint: Text(
                                '위례 어디 거주하시나요?',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: Sizes.size14,
                                ),
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: Sizes.size14,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade500,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size10,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size10,
                                  ),
                                ),
                              ),
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.only(right: 8),
                              ),
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                              items: _regionItems
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: Sizes.size14,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedRegion = value!;
                                });
                              },
                              selectedItemBuilder: (context) {
                                return _regionItems
                                    .map(
                                      (e) => Text(
                                        _selectedRegion ?? "",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: Sizes.size14,
                                        ),
                                      ),
                                    )
                                    .toList();
                              },
                            ),
                            Gaps.v28,
                            DropdownButtonFormField2(
                              hint: Text(
                                '어느 아파트에 거주하시나요?',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: Sizes.size14,
                                ),
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: Sizes.size14,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade500,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size10,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size10,
                                  ),
                                ),
                              ),
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.only(right: 8),
                              ),
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                              items: _regionItems
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: Sizes.size14,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedRegion = value!;
                                });
                              },
                              selectedItemBuilder: (context) {
                                return _regionItems
                                    .map(
                                      (e) => Text(
                                        _selectedRegion ?? "",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: Sizes.size14,
                                        ),
                                      ),
                                    )
                                    .toList();
                              },
                            ),
                          ]
                              .animate(interval: 300.ms)
                              .fadeIn(begin: 0, duration: 500.ms)
                              .slideY(
                                begin: 3,
                                duration: 500.ms,
                              ),
                          Gaps.v40,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            verticalDirection: VerticalDirection.up,
                            children: [
                              Checkbox(
                                  value: _agreement,
                                  fillColor: MaterialStateProperty.all(
                                      Colors.grey.shade500),
                                  checkColor: Colors.white,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _agreement = value;
                                    });
                                  }),
                              const Expanded(
                                child: Text(
                                  "(주)랜드워크의 이용 약관에 동의하며, 위례워크 개인정보 수집 내용을 인지하고 있습니다.",
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: Sizes.size12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gaps.v40,
                          FractionallySizedBox(
                            widthFactor: 1,
                            child: AnimatedContainer(
                              height: 60,
                              duration: const Duration(
                                milliseconds: 300,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Sizes.size10,
                                ),
                                color: Colors.grey.shade300,
                              ),
                              child: const AnimatedDefaultTextStyle(
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                duration: Duration(
                                  milliseconds: 300,
                                ),
                                child: Center(
                                  child: Text(
                                    "회원가입 완료",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gaps.v20,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
