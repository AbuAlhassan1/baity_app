import 'package:baity_app/auth/views/login_page_wrapper.dart';
import 'package:baity_app/auth/views/register_steps/birth_day.dart';
import 'package:baity_app/auth/views/register_steps/categories.dart';
import 'package:baity_app/auth/views/register_steps/gender.dart';
import 'package:baity_app/auth/views/register_steps/name.dart';
import 'package:baity_app/auth/views/register_steps/password.dart';
import 'package:baity_app/auth/views/register_steps/phone_number.dart';
import 'package:baity_app/auth/views/steps_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingPageWrapper extends StatefulWidget {
  const OnboardingPageWrapper({super.key});

  @override
  State<OnboardingPageWrapper> createState() => _OnboardingPageWrapperState();
}

class _OnboardingPageWrapperState extends State<OnboardingPageWrapper> {

  List<PageViewModel>? pages;

  @override
  void initState() {
    pages = [
      PageViewModel(
        title: "Title of second page",
        body: "Here you can write the description of the page, to explain something...",
        // image: Center(child: Image.asset("assets/images/onboarding2.png", height: 175.0)),
        decoration: const PageDecoration(
          bodyTextStyle: TextStyle(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black),
        ),
      ),
      PageViewModel(
        title: "Title of third page",
        body: "Here you can write the description of the page, to explain something...",
        decoration: const PageDecoration(
          bodyTextStyle: TextStyle(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black),
        ),
      ),
      PageViewModel(
        titleWidget: const SizedBox(),
        bodyWidget: const SizedBox(),
        image: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () => showLoginPage(context),
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () => showStepBottomSheet(
                context: context,
                step: const PhoneNumberStep(),
                onNext: () => showStepBottomSheet(
                  context: context,
                  step: const PasswordStep(),
                  onNext: () => showStepBottomSheet(
                    context: context,
                    step: const NameStep(),
                    onNext: () => showStepBottomSheet(
                      context: context,
                      step: const GenderStep(),
                      onNext: () => showStepBottomSheet(
                        context: context,
                        step: const BirthDayStep(),
                        onNext: () => showStepBottomSheet(
                          context: context,
                          step: const CategoriesStep(),
                          onNext: () => null,
                          stepIndex: 6,
                        ),
                        stepIndex: 5,
                      ),
                      stepIndex: 4,
                    ),
                    stepIndex: 3,
                  ),
                  stepIndex: 2,
                ),
                stepIndex: 1,
              ),
              child: const Text('Create Account'),
            ),
          ],
        ),
        decoration: const PageDecoration(
          bodyTextStyle: TextStyle(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black),
        ),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        showNextButton: false,
        done: const Text(
          "Skip",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        onDone: () {
          context.go('/');
        },
      ),
    );
  }
}