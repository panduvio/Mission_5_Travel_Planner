import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mission_5_wanderly/core/constants/app_radius.dart';
import 'package:mission_5_wanderly/core/constants/app_spacing.dart';
import 'package:mission_5_wanderly/core/extensions/alignment_extension.dart';
import 'package:mission_5_wanderly/core/extensions/padding_extension.dart';
import 'package:mission_5_wanderly/core/themes/app_colors.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';
import 'package:mission_5_wanderly/domain/entities/trip_entity.dart';
import 'package:mission_5_wanderly/presentation/providers/trip_provider.dart';
import 'package:mission_5_wanderly/presentation/widgets/app_button.dart';

class TripDetailScreen extends ConsumerStatefulWidget {
  final int tripId;
  const TripDetailScreen({super.key, required this.tripId});

  @override
  ConsumerState<TripDetailScreen> createState() =>
      _TripDetailScreenState(tripId);
}

class _TripDetailScreenState extends ConsumerState<TripDetailScreen> {
  final int _tripId;

  _TripDetailScreenState(this._tripId);

  @override
  Widget build(BuildContext context) {
    final trip = ref.read(tripListProvider)[_tripId];
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 💎 Header dengan detail destinasi dan tombol back yang elegan.
            // Penggunaan `HeroIcon` menambah kesan modern pada UI! 🚀🌟
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  SizedBox(
                    width: screen.width,
                    child: Image.asset(trip.image, fit: BoxFit.fitWidth),
                  ),
                  Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    color: const Color.fromARGB(51, 0, 0, 0),
                  ),
                  SizedBox(
                    width: screen.width * 0.7,
                    child: Text(
                      trip.tripName,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.h1.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ).withAlignment(Alignment.center),
                  SafeArea(
                    child: GestureDetector(
                      onTap: () => context.goNamed('home'),
                      child: HeroIcon(
                        HeroIcons.arrowLeftCircle,
                        color: AppColors.white,
                        size: 40,
                      ).paddingAll(AppSpacing.m),
                    ),
                  ),
                ],
              ),
            ),
            _detailContent(trip),
            Container(
              padding: EdgeInsets.all(AppSpacing.xl),
              color: theme.colorScheme.tertiary,
              child: Column(
                children: [
                  SizedBox(
                    width: screen.width * 0.4,
                    child: Image.asset(
                      'assets/wanderly_icon.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ).withAlignment(Alignment.centerLeft),
                  SizedBox(height: AppSpacing.m),
                  Text(
                    'Enjoy your trip with glorious serve from harijumat.co!',
                    style: AppTextStyles.h3.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  SizedBox(height: AppSpacing.s),
                  Text(
                    'Jl. Raya Pajajaran No.88, Kel. Tanah Sareal, Kec. Bogor Tengah, Kota Bogor, Jawa Barat, 16127, Indonesia',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  SizedBox(height: AppSpacing.s),
                  Text(
                    '+62-891827-23293',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ).withAlignment(Alignment.centerLeft),
                  SizedBox(height: AppSpacing.s),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Perusahaan',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: theme.colorScheme.secondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      HeroIcon(
                        HeroIcons.arrowRight,
                        color: theme.colorScheme.secondary,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.s),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Perusahaan',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: theme.colorScheme.secondary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      HeroIcon(
                        HeroIcons.arrowRight,
                        color: theme.colorScheme.secondary,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.m),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Komunitas',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: theme.colorScheme.secondary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      HeroIcon(HeroIcons.arrowRight),
                    ],
                  ),
                  Divider(color: theme.colorScheme.secondary),
                  SizedBox(height: AppSpacing.s),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(4, (index) {
                      final socials = <String>[
                        "assets/linkedin.png",
                        "assets/instagram.png",
                        "assets/twitter.png",
                        "assets/facebook.png",
                      ];
                      return SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          socials[index],
                          fit: BoxFit.fitHeight,
                        ),
                      ).paddingSymmetrical(AppSpacing.xs, 0);
                    }),
                  ),
                  SizedBox(height: AppSpacing.s),
                  Text(
                    '@2026 Kwetiau Siram All Rights \nReserved',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ).withAlignment(Alignment.centerLeft),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailContent(TripEntity trip) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(AppSpacing.xl),
      child: Column(
        children: [
          SizedBox(height: AppSpacing.m),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.card),
                  color: AppColors.lunarRock,
                ),
                child: HeroIcon(
                  HeroIcons.mapPin,
                  color: AppColors.yankeesBlue,
                ).paddingAll(AppSpacing.xs),
              ),
              Text('${trip.city}, ${trip.country}'),

              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.card),
                  color: AppColors.lunarRock,
                ),
                child: HeroIcon(
                  HeroIcons.user,
                  color: AppColors.yankeesBlue,
                ).paddingAll(AppSpacing.xs),
              ),
              Column(
                children: [Text('Visitor'), Text(trip.visitor.toString())],
              ),

              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.card),
                  color: AppColors.lunarRock,
                ),
                child: HeroIcon(
                  HeroIcons.star,
                  color: AppColors.yankeesBlue,
                ).paddingAll(AppSpacing.xs),
              ),
              Column(children: [Text('Rating'), Text('${trip.rating}/10')]),
            ],
          ),
          SizedBox(height: AppSpacing.xxl),
          Text(
            'Detail',
            style: AppTextStyles.h3,
          ).withAlignment(Alignment.centerLeft),
          SizedBox(height: AppSpacing.xl),
          Text(
            trip.detail,
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: AppSpacing.xl),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Trip Price', style: AppTextStyles.bodyLarge),
                  Text('Rp ${trip.price}', style: AppTextStyles.h2),
                ],
              ),
              AppButton(
                content: 'Book Now!',
                buttonColor: AppColors.tooBlueToBeTrue,
                contentColor: AppColors.white,
                onTap: () {
                  context.goNamed(
                    'itinerary',
                    pathParameters: {
                      'is_view': false.toString(),
                      'id': _tripId.toString(),
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(height: AppSpacing.m),
          Container(
            padding: EdgeInsets.all(AppSpacing.s),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.card),
              color: theme.colorScheme.primary,
            ),
            child: Text(
              'Nearby Hotels',
              style: AppTextStyles.h2,
            ).withAlignment(Alignment.center),
          ),
          SizedBox(height: AppSpacing.m),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(AppSpacing.s),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.card),
                    color: theme.colorScheme.primary,
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppRadius.card),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(
                          'assets/south_korea.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        'Urban Hotel Kyoto Nijo Premium',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.labelLarge.copyWith(fontSize: 14),
                      ),
                      Row(
                        children: [
                          HeroIcon(
                            HeroIcons.star,
                            style: HeroIconStyle.solid,
                            color: AppColors.chosGardenMarigold,
                          ),
                          SizedBox(width: AppSpacing.xs),
                          Text(
                            '4.1/5',
                            style: AppTextStyles.labelMedium.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          Text('Rp 500000', style: AppTextStyles.bodyLarge),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: AppSpacing.m),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(AppSpacing.s),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.card),
                    color: theme.colorScheme.primary,
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppRadius.card),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(
                          'assets/south_korea.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        'Urban Hotel Kyoto Nijo Premium',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.labelLarge.copyWith(fontSize: 14),
                      ),
                      Row(
                        children: [
                          HeroIcon(
                            HeroIcons.star,
                            style: HeroIconStyle.solid,
                            color: AppColors.chosGardenMarigold,
                          ),
                          SizedBox(width: AppSpacing.xs),
                          Text(
                            '4.1/5',
                            style: AppTextStyles.labelMedium.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          Text('Rp 500000', style: AppTextStyles.bodyLarge),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
