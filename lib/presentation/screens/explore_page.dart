import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mission_5_wanderly/core/constants/app_spacing.dart';
import 'package:mission_5_wanderly/core/extensions/padding_extension.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';
import 'package:mission_5_wanderly/presentation/providers/page_provider.dart';
import 'package:mission_5_wanderly/presentation/widgets/custom_search_bar.dart';
import 'package:mission_5_wanderly/presentation/widgets/trip_card.dart';

class ExplorePage extends ConsumerStatefulWidget {
  const ExplorePage({super.key});

  @override
  ConsumerState<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends ConsumerState<ExplorePage> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _showSortBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            final sortType = ref.watch(tripSortTypeProvider);
            final isAsc = ref.watch(tripSortAscendingProvider);

            Widget buildTile({
              required HeroIcons icon,
              required String title,
              required TripSortType type,
              required bool ascending,
            }) {
              final selected = sortType == type && isAsc == ascending;

              return ListTile(
                leading: HeroIcon(icon),
                title: Text(title),
                trailing: selected
                    ? const HeroIcon(HeroIcons.check, color: Colors.blue)
                    : null,
                onTap: () {
                  ref.read(tripSortTypeProvider.notifier).state = type;
                  ref.read(tripSortAscendingProvider.notifier).state =
                      ascending;
                  Navigator.pop(context);
                },
              );
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: AppSpacing.m),
                Text('Sort Options', style: AppTextStyles.h3),
                const Divider(),

                buildTile(
                  icon: HeroIcons.barsArrowUp,
                  title: 'Name: A → Z',
                  type: TripSortType.name,
                  ascending: true,
                ),
                buildTile(
                  icon: HeroIcons.barsArrowDown,
                  title: 'Name: Z → A',
                  type: TripSortType.name,
                  ascending: false,
                ),

                /// RATING
                buildTile(
                  icon: HeroIcons.star,
                  title: 'Rating: Low → High',
                  type: TripSortType.rating,
                  ascending: true,
                ),
                buildTile(
                  icon: HeroIcons.star,
                  title: 'Rating: High → Low',
                  type: TripSortType.rating,
                  ascending: false,
                ),

                /// VISITORS
                buildTile(
                  icon: HeroIcons.userGroup,
                  title: 'Visitors: Low → High',
                  type: TripSortType.visitors,
                  ascending: true,
                ),
                buildTile(
                  icon: HeroIcons.userGroup,
                  title: 'Visitors: High → Low',
                  type: TripSortType.visitors,
                  ascending: false,
                ),

                const SizedBox(height: AppSpacing.xl),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredTrips = ref.watch(filteredTripsProvider);

    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 80),
            Expanded(
              child: ListView.builder(
                itemCount: filteredTrips.length,
                itemBuilder: (context, index) {
                  final trip = filteredTrips[index];
                  return GestureDetector(
                    onTap: () => context.goNamed(
                      'trip_detail',
                      pathParameters: {'id': index.toString()},
                    ),
                    child: TripCard(
                      tripName: trip.tripName,
                      image: trip.image,
                      country: trip.country,
                      city: trip.city,
                    ),
                  ).paddingAll(AppSpacing.xs);
                },
              ),
            ),
          ],
        ),
        CustomSearchBar(
          controller: searchController,
          onChanged: (value) =>
              ref.read(tripSearchProvider.notifier).state = value,
          onLeadingPressed: _showSortBottomSheet,
        ).paddingTBRL(AppSpacing.xl, 0, 0, 0),
      ],
    ).paddingAll(AppSpacing.xl);
  }
}
