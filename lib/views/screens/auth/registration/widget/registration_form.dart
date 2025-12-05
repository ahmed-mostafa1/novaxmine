import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mine_lab/core/route/route.dart';
import 'package:mine_lab/core/utils/dimensions.dart';
import 'package:mine_lab/core/utils/my_color.dart';
import 'package:mine_lab/core/utils/styles.dart';
import 'package:mine_lab/data/controller/auth/registration/registration_controller.dart';
import 'package:mine_lab/l10n/app_localizations.dart';
import 'package:mine_lab/views/components/buttons/rounded_button.dart';
import 'package:mine_lab/views/components/text-field/custom_text_field.dart';
import 'package:mine_lab/views/screens/auth/login/widget/social_login_section.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool isChecked = false;
  bool loading = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Get localized strings
    final localizations = AppLocalizations.of(context)!;
    
    return GetBuilder<RegistrationController>(
      builder: (controller) => Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              needLabel: false,
              needOutlineBorder: true,
              labelText: localizations.firstName,
              hintText: localizations.enterFirstName,
              controller: controller.firstNameController,
              focusNode: controller.firstNameFocusNode,
              onChanged: (value) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return localizations.enterFirstName;
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: Dimensions.space20),
            CustomTextField(
              needLabel: false,
              needOutlineBorder: true,
              labelText: localizations.lastName,
              hintText: localizations.enterLastName,
              controller: controller.lastNameController,
              focusNode: controller.lastNameFocusNode,
              onChanged: (value) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return localizations.enterLastName;
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: Dimensions.space20),
            CustomTextField(
              needLabel: false,
              needOutlineBorder: true,
              labelText: localizations.emailAddress,
              hintText: localizations.emailAddressHint,
              controller: controller.emailController,
              focusNode: controller.emailFocusNode,
              textInputType: TextInputType.emailAddress,
              onChanged: (value) {},
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return localizations.emailAddressHint;
                } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value ?? '')) {
                  return localizations.enterValidEmail;
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: Dimensions.space20),
            CustomTextField(
                needLabel: false,
                needOutlineBorder: true,
                labelText: localizations.password,
                hintText: localizations.passwordHint,
                isPassword: true,
                isShowSuffixIcon: true,
                controller: controller.passwordController,
                focusNode: controller.passwordFocusNode,
                validator: (value) {
                  if (controller.passwordController.text.toLowerCase() !=
                      controller.confirmPasswordController.text.toLowerCase()) {
                    return localizations.kMatchPassError;
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {}),
            const SizedBox(height: Dimensions.space20),
            CustomTextField(
                needLabel: false,
                needOutlineBorder: true,
                labelText: localizations.confirmPassword,
                hintText: localizations.confirmPasswordHint,
                isPassword: true,
                isShowSuffixIcon: true,
                controller: controller.confirmPasswordController,
                focusNode: controller.confirmPasswordFocusNode,
                validator: (value) {
                  if (controller.passwordController.text.toLowerCase() !=
                      controller.confirmPasswordController.text.toLowerCase()) {
                    return localizations.kMatchPassError;
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {}),
            const SizedBox(height: Dimensions.space20),
            CustomTextField(
              needLabel: false,
              needOutlineBorder: true,
              labelText: localizations.referralCode,
              hintText: localizations.enterReferralCode,
              isShowSuffixIcon: true,
              controller: controller.referralCodeController,
              validator: (value) {
                return null;
              },
              onChanged: (value) {},
            ),
            const SizedBox(height: Dimensions.space20),
            if (controller.needAgree && !controller.isLoading) ...[
              Row(
                children: [
                  SizedBox(
                      height: 20,
                      width: 20,
                      child: Checkbox(
                          activeColor: MyColor.primaryColor,
                          value: controller.agreeTC,
                          side: WidgetStateBorderSide.resolveWith(
                            (states) => BorderSide(
                                width: 1.0,
                                color: controller.agreeTC
                                    ? MyColor.transparentColor
                                    : MyColor.colorGrey),
                          ),
                          onChanged: (value) {
                            controller.updateAgreeTC();
                          })),
                  const SizedBox(width: Dimensions.space10),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.updateAgreeTC();
                        },
                        child: Text("${localizations.iAgree} ",
                            style: interRegularDefault.copyWith(
                                color: MyColor.colorBlack)),
                      ),
                      GestureDetector(
                        onTap: () =>
                            Get.toNamed(RouteHelper.privacyPolicyScreen),
                        child: Text("${localizations.privacyPolicy.toLowerCase()} ",
                            style: interRegularDefault.copyWith(
                                color: MyColor.primaryColor)),
                      ),
                    ],
                  ),
                ],
              )
            ],
            const SizedBox(height: Dimensions.space20),
            RoundedButton(
              isLoading: controller.submitLoading,
              press: () {
                if (formKey.currentState!.validate()) {
                  controller.registerUser();
                }
              },
              width: MediaQuery.of(context).size.width,
              color: MyColor.primaryColor,
              text: localizations.createAccount,
              textColor: MyColor.colorWithe,
            ),
            const SizedBox(height: Dimensions.space15),
            const SocialLoginSection(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(localizations.haveAccount,
                    style: interRegularDefault.copyWith(
                        color: MyColor.accountEnsureTextColor)),
                TextButton(
                  onPressed: () {
                    Get.toNamed(RouteHelper.loginScreen);
                  },
                  child: Text(localizations.loginNow,
                      style: interRegularDefault.copyWith(
                          color: MyColor.primaryColor)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}