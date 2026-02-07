import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mission_5_wanderly/core/constants/app_radius.dart';
import 'package:mission_5_wanderly/core/constants/app_spacing.dart';
import 'package:mission_5_wanderly/core/extensions/alignment_extension.dart';
import 'package:mission_5_wanderly/core/extensions/padding_extension.dart';
import 'package:mission_5_wanderly/core/helpers/validator_helper.dart';
import 'package:mission_5_wanderly/core/themes/app_colors.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';
import 'package:mission_5_wanderly/domain/entities/user_entity.dart';
import 'package:mission_5_wanderly/presentation/providers/user_notifier.dart';
import 'package:mission_5_wanderly/presentation/widgets/app_button.dart';
import 'package:mission_5_wanderly/presentation/widgets/custom_snackbar.dart';
import 'package:mission_5_wanderly/presentation/widgets/custom_text_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();

  bool isLogin = true;
  String phoneDropDownValue = '62';
  String genderDropDownValue = 'Male';
  bool isSignupPasswordSecure = true;
  bool isLoginPasswordSecure = true;
  bool isConfirmPasswordSecure = true;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void clearAllControllers() {
    setState(() {
      fullNameController.clear();
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      phoneController.clear();
    });
  }

  List<Widget> mainContent(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return [
      SizedBox(
        height: screen.width > 600 ? screen.width * 0.2 : screen.height * 0.2,
        child: Image.asset('assets/wanderly_icon.png'),
      ),
      SingleChildScrollView(
        child: Container(
          width: screen.width > 600 ? screen.width * 0.5 : screen.width,
          child: isLogin
              ? Form(key: loginFormKey, child: _loginField(screen, theme))
              : Form(key: signUpFormKey, child: _registerField(screen, theme)),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.landscape
                ? Row(
                    children: mainContent(
                      context,
                    ).map((e) => Expanded(child: e)).toList(),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: mainContent(context),
                  );
          },
        ),
      ),
    );
  }

  Widget _loginField(Size screen, ThemeData theme) {
    final provider = ref.read(userNotifierProvider.notifier);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: HeroIcons.user,
          validator: ValidatorHelper.email,
          label: 'E-mail',
          hint: 'Input your email',
        ),
        CustomTextField(
          controller: passwordController,
          validator: ValidatorHelper.password,
          obscure: isLoginPasswordSecure,
          prefixIcon: HeroIcons.key,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isLoginPasswordSecure = !isLoginPasswordSecure;
              });
            },
            child: HeroIcon(
              isLoginPasswordSecure ? HeroIcons.eyeSlash : HeroIcons.eye,
            ),
          ),
          label: 'Password',
          hint: 'Input your password',
        ),
        AppButton(
          content: 'Login',
          isLarge: true,
          onTap: () async {
            if (!loginFormKey.currentState!.validate()) return;

            final message = await provider.login(
              emailController.text,
              passwordController.text,
            );

            final isSuccess = message == 'Success';

            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackbar.show(
                message: message,
                icon: isSuccess ? HeroIcons.checkCircle : HeroIcons.xCircle,
                isError: !isSuccess,
              ),
            );

            if (isSuccess) {
              clearAllControllers();
              context.goNamed('home');
            }
          },
        ),
        SizedBox(height: AppSpacing.s),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Don\'t have an account?', style: AppTextStyles.bodyMedium),
            TextButton(
              onPressed: () => setState(() {
                clearAllControllers();
                isLogin = false;
              }),
              child: Text(
                'Sign up',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.tooBlueToBeTrue,
                ),
              ),
            ),
          ],
        ),
      ],
    ).paddingAll(AppSpacing.xl);
  }

  Widget _registerField(Size screen, ThemeData theme) {
    final provider = ref.read(userNotifierProvider.notifier);
    final List<DropdownMenuItem<String>> phoneCountryDrop = const [
      DropdownMenuItem(value: '62', child: Text('+62')),
      DropdownMenuItem(value: '60', child: Text('+60')),
    ];
    final List<DropdownMenuItem<String>> genderDrop = [
      DropdownMenuItem(
        value: 'Male',
        child: Text('Male').withAlignment(Alignment.center),
      ),
      DropdownMenuItem(
        value: 'Female',
        child: Text('Female').withAlignment(Alignment.center),
      ),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
          controller: fullNameController,
          validator: ValidatorHelper.fullName,
          prefixIcon: HeroIcons.user,
          label: 'Full Name',
          hint: 'Input your full name',
        ),
        CustomTextField(
          controller: emailController,
          validator: ValidatorHelper.email,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: HeroIcons.envelope,
          label: 'E-mail',
          hint: 'Input your email',
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.s),
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(color: theme.colorScheme.tertiary),
            borderRadius: BorderRadius.circular(AppRadius.utility),
          ),
          child: DropdownButton<String>(
            value: genderDropDownValue,
            isExpanded: true,
            alignment: Alignment.center,
            icon: HeroIcon(HeroIcons.chevronDown),
            items: genderDrop,
            underline: SizedBox(),
            onChanged: (value) {
              setState(() {
                genderDropDownValue = value!;
              });
            },
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton<String>(
              value: phoneDropDownValue,
              items: phoneCountryDrop,
              underline: SizedBox(),
              onChanged: (value) {
                setState(() {
                  phoneDropDownValue = value!;
                });
              },
            ),
            Expanded(
              child: CustomTextField(
                controller: phoneController,
                validator: ValidatorHelper.phone,
                keyboardType: TextInputType.numberWithOptions(),
                prefixIcon: HeroIcons.phone,
                label: 'phone number',
                hint: 'Input your phone number',
              ),
            ),
          ],
        ),
        CustomTextField(
          controller: passwordController,
          validator: ValidatorHelper.password,
          obscure: isSignupPasswordSecure,
          prefixIcon: HeroIcons.key,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isSignupPasswordSecure = !isSignupPasswordSecure;
              });
            },
            child: HeroIcon(
              isSignupPasswordSecure ? HeroIcons.eyeSlash : HeroIcons.eye,
            ),
          ),
          label: 'Password',
          hint: 'Input your password',
        ),
        CustomTextField(
          controller: confirmPasswordController,
          validator: ValidatorHelper.confirmPassword(passwordController.text),
          obscure: isConfirmPasswordSecure,
          prefixIcon: HeroIcons.key,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isConfirmPasswordSecure = !isConfirmPasswordSecure;
              });
            },
            child: HeroIcon(
              isConfirmPasswordSecure ? HeroIcons.eyeSlash : HeroIcons.eye,
            ),
          ),
          label: 'Password Confirmation',
          hint: 'Confirm your password',
        ),
        AppButton(
          content: 'Sign Up',
          isLarge: true,
          onTap: () async {
            if (!signUpFormKey.currentState!.validate()) return;

            final newUser = UserEntity(
              email: emailController.text,
              password: passwordController.text,
              fullName: fullNameController.text,
              gender: genderDropDownValue,
              phone: phoneDropDownValue + phoneController.text,
            );

            final message = await provider.signup(newUser);

            final isSuccess = message == 'Signup Success';

            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackbar.show(
                message: message,
                icon: isSuccess ? HeroIcons.checkCircle : HeroIcons.xCircle,
                isError: !isSuccess,
              ),
            );

            if (isSuccess) {
              clearAllControllers();
              setState(() => isLogin = true);
            }
          },
        ),
        SizedBox(height: AppSpacing.s),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Already have an account?', style: AppTextStyles.bodyMedium),
            TextButton(
              onPressed: () => setState(() {
                isLogin = true;
                clearAllControllers();
              }),
              child: Text(
                'Login',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.tooBlueToBeTrue,
                ),
              ),
            ),
          ],
        ),
      ],
    ).paddingAll(AppSpacing.xl);
  }
}
