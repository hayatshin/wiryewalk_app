import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:wiryewalk_app/constants/gaps.dart';
import 'package:wiryewalk_app/constants/sizes.dart';
import 'package:wiryewalk_app/features/authentication/views/reg_sign_up_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return _buildGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size52,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    foregroundColor: Colors.black,
                    radius: 40,
                    child: Lottie.asset(
                      "assets/animations/walk_anim_red.json",
                      width: 300,
                      height: 300,
                    ),
                  ),
                ),
              ),
              const Text(
                "위례워크",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.bold,
                ),
              )
                  .animate(
                    delay: 1500.ms,
                  )
                  .fadeIn(
                    begin: 0,
                    duration: 1.seconds,
                  )
                  .slideY(
                    begin: 1,
                    end: 0,
                    duration: 1.seconds,
                    curve: Curves.bounceOut,
                  ),
              Gaps.v60,
              Container(
                width: size.width * 0.8,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Sizes.size40,
                  ),
                  color: const Color(0xffffe812),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.solidComment,
                      size: Sizes.size18,
                    ),
                    Gaps.h16,
                    Text(
                      "카카오톡으로 시작하기",
                      style: TextStyle(
                        fontSize: Sizes.size14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )
                  .animate(
                    delay: 500.milliseconds,
                  )
                  .fadeIn(begin: 0)
                  .slideY(
                    begin: 2,
                    end: 0,
                  ),
              Gaps.v20,
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegSignUpScreen(),
                    ),
                  );
                },
                child: Container(
                  width: size.width * 0.8,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Sizes.size40,
                    ),
                    border: Border.all(
                      color: Colors.grey.shade200,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "일반 회원가입하기",
                        style: TextStyle(
                          fontSize: Sizes.size14,
                          color: Colors.grey.shade200,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              )
                  .animate(
                    delay: 1.seconds,
                  )
                  .fadeIn(begin: 0)
                  .slideY(
                    begin: 2,
                    end: 0,
                  ),
              Gaps.v32,
              Text(
                "일반 회원가입을 하신 적이 있나요?",
                style: TextStyle(
                  fontSize: Sizes.size14,
                  color: Colors.grey.shade400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildGradientBackground({Widget? child}) {
  final Color startColor = Colors.grey.shade300;
  final Color midColor = Colors.grey.shade500;
  final Color endColor = Colors.grey.shade800;

  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [startColor, midColor, endColor],
        stops: const [0.0, 0.2, 1.0],
      ),
    ),
    child: child,
  );
}
