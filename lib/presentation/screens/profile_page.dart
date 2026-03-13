import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mission_5_wanderly/core/constants/app_spacing.dart';
import 'package:mission_5_wanderly/core/extensions/padding_extension.dart';
import 'package:mission_5_wanderly/core/extensions/theme_extension.dart';
import 'package:mission_5_wanderly/core/helpers/validator_helper.dart';
import 'package:mission_5_wanderly/core/themes/app_colors.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';
import 'package:mission_5_wanderly/domain/entities/user_entity.dart';
import 'package:mission_5_wanderly/presentation/providers/page_provider.dart';
import 'package:mission_5_wanderly/presentation/providers/user_notifier.dart';
import 'package:mission_5_wanderly/presentation/widgets/app_button.dart';
import 'package:mission_5_wanderly/presentation/widgets/custom_popup.dart';
import 'package:mission_5_wanderly/presentation/widgets/custom_text_field.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  late UserEntity user;
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      user = ref.read(userNotifierProvider).loginUser!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeToggleProvider);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSpacing.s),
          Text(user.fullName, style: AppTextStyles.h2),
          Text(
            user.email,
            style: AppTextStyles.bodyLarge.copyWith(
              color: context.text.bodyLarge?.color?.withAlpha(150),
            ),
          ),
          SizedBox(height: AppSpacing.m),
          Divider(),
          SizedBox(height: AppSpacing.m),
          Text('Setting', style: AppTextStyles.h3),
          SizedBox(height: AppSpacing.m),
          Row(
            children: [
              const HeroIcon(
                HeroIcons.moon,
                size: 30,
                style: HeroIconStyle.solid,
              ),
              const SizedBox(width: AppSpacing.m),
              const Column(
                children: [
                  Text('Mode', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 4),
                  Text('Dark & Light'),
                ],
              ),
              const Spacer(),
              AnimatedToggleSwitch<int>.dual(
                spacing: 10,
                height: 40,
                padding: EdgeInsets.all(AppSpacing.xs),
                style: ToggleStyle(
                  indicatorColor: context.colors.primary,
                  borderColor: AppColors.yankeesBlue,
                ),
                current: currentTheme,
                first: 0,
                second: 1,
                onChanged: (value) {
                  ref.read(themeToggleProvider.notifier).state = value;
                },
                iconBuilder: (value) {
                  return value == 0
                      ? const HeroIcon(HeroIcons.moon)
                      : const HeroIcon(HeroIcons.sun, color: AppColors.white);
                },
              ),
            ],
          ),
          SizedBox(height: AppSpacing.m),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => CustomPopup(
                  content: Column(
                    children: [
                      HeroIcon(HeroIcons.users, size: 30),
                      CustomTextField(
                        controller: passwordController,
                        validator: ValidatorHelper.password,
                        prefixIcon: HeroIcons.key,
                        label: 'Password',
                        hint: 'Insert password',
                      ),
                      SizedBox(height: AppSpacing.xs),
                      AppButton(
                        content: 'Confirm',
                        onTap: () {
                          final uid = ref
                              .read(userNotifierProvider)
                              .loginUser!
                              .uid;
                          ref
                              .read(userNotifierProvider.notifier)
                              .deleteAccount(uid, passwordController.text);
                          context.goNamed('login');
                          ref.read(bottomNavIndexProvider.notifier).state = 0;
                        },
                      ),
                    ],
                  ),
                  message: '',
                ),
              );
            },
            child: Row(
              children: [
                HeroIcon(size: 30, HeroIcons.trash),
                SizedBox(width: AppSpacing.s),
                Text('Delete Account'),
              ],
            ),
          ),
          SizedBox(height: AppSpacing.m),
          AppButton(
            onTap: () {
              ref.read(userNotifierProvider.notifier).userLogout();
              context.goNamed('login');
              ref.read(bottomNavIndexProvider.notifier).state = 0;
            },
            content: 'Sign Out',
            buttonColor: AppColors.glowingBrakeDisc,
            contentColor: AppColors.white,
          ),
        ],
      ).paddingAll(AppSpacing.xl),
    );
  }
}
