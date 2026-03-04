import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:lottie/lottie.dart';
import 'package:mission_5_wanderly/core/constants/app_radius.dart';
import 'package:mission_5_wanderly/core/constants/app_spacing.dart';
import 'package:mission_5_wanderly/core/extensions/alignment_extension.dart';
import 'package:mission_5_wanderly/core/extensions/padding_extension.dart';
import 'package:mission_5_wanderly/core/themes/app_colors.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';
import 'package:mission_5_wanderly/presentation/providers/trip_provider.dart';
import 'package:mission_5_wanderly/presentation/providers/user_notifier.dart';
import 'package:mission_5_wanderly/presentation/widgets/app_button.dart';
import 'package:mission_5_wanderly/presentation/widgets/custom_popup.dart';
import 'package:mission_5_wanderly/presentation/widgets/custom_search_bar.dart';
import 'package:mission_5_wanderly/presentation/widgets/trip_card.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context).size;
    final trips = ref.read(tripListProvider);
    final _userState = ref.watch(userNotifierProvider);
    return SingleChildScrollView(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: screen.width * 0.5,
                child: Image.asset('assets/wanderly_icon.png'),
              ),
              Row(
                children: [
                  CircleAvatar(child: HeroIcon(HeroIcons.user)),
                  SizedBox(width: AppSpacing.s),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, ${_userState.loginUser!.fullName}!',
                        style: AppTextStyles.bodyMedium,
                      ),
                      Text(
                        'Welcome to Wanderly',
                        style: AppTextStyles.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.m),
              Container(
                height: 126,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.card),
                ),
                clipBehavior: Clip.hardEdge,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Image.asset(
                        'assets/destination_discovery_card.jpg',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      color: const Color.fromARGB(51, 0, 0, 0),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Discover Your Destination',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: AppColors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppButton(content: 'Book Now', onTap: () {}),
                            AppButton(
                              content: 'Discover More',
                              isOutline: true,
                              borderColor: AppColors.white,
                              contentColor: AppColors.white,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ).paddingAll(AppSpacing.s),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.m),
              Text(
                'Resume Your Plan Trip',
                style: AppTextStyles.h2,
              ).withAlignment(Alignment.centerLeft),
              SizedBox(height: AppSpacing.m),

              Row(
                children: [
                  Container(
                    height: 70,
                    width: screen.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppRadius.card),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      'assets/explore_card.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(width: AppSpacing.s),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(AppRadius.card),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Kyoto Exploration', style: AppTextStyles.h3),
                            Stack(
                              children: [
                                Container(
                                  height: 8,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      AppRadius.round,
                                    ),
                                    color: AppColors.lunarRock,
                                  ),
                                ),
                                Container(
                                  height: 8,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      AppRadius.round,
                                    ),
                                    color: AppColors.tooBlueToBeTrue,
                                  ),
                                ),
                              ],
                            ).paddingSymmetrical(8, 0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.m),
              Text(
                'Today Top Rate',
                style: AppTextStyles.h2,
              ).withAlignment(Alignment.centerLeft),
              SizedBox(height: AppSpacing.m),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 154,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadius.card),
                        color: theme.colorScheme.primary,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppRadius.card,
                              ),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              'assets/south_korea.jpg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: AppSpacing.xs),
                          Text(
                            'Busan, South Korea',
                            style: AppTextStyles.labelLarge,
                          ),
                        ],
                      ).paddingAll(AppSpacing.xs),
                    ),
                  ),
                  SizedBox(width: AppSpacing.s),
                  Expanded(
                    child: Container(
                      height: 154,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadius.card),
                        color: theme.colorScheme.primary,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppRadius.card,
                              ),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              'assets/south_korea.jpg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: AppSpacing.xs),
                          Text(
                            'Busan, South Korea',
                            style: AppTextStyles.labelLarge,
                          ),
                        ],
                      ).paddingAll(AppSpacing.xs),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.m),
              Container(
                padding: EdgeInsets.all(AppSpacing.s),
                height: 150,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.card),
                  color: theme.colorScheme.primary,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Popular', style: AppTextStyles.h3),
                        AppButton(
                          content: 'Show All',
                          isOutline: true,
                          onTap: () {},
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(5, (_) {
                        return Column(
                          children: [
                            CircleAvatar(
                              radius: 29,
                              backgroundImage: AssetImage(
                                'assets/explore_card.jpg',
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text('Kyoto'),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.m),
              Text(
                'Curated Trip',
                style: AppTextStyles.h2,
              ).withAlignment(Alignment.centerLeft),
              SizedBox(height: AppSpacing.m),
              SizedBox(
                // height: 500,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  itemCount: trips.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => context.goNamed(
                        'trip_detail',
                        pathParameters: {'id': index.toString()},
                      ),
                      child: TripCard(
                        tripName: trips[index].tripName,
                        image: trips[index].image,
                        country: trips[index].country,
                        city: trips[index].city,
                      ),
                    ).paddingAll(AppSpacing.xs);
                  },
                ),
              ),
            ],
          ).paddingAll(AppSpacing.xl),
        ),
      ),
    );
  }
}
