import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mission_5_wanderly/core/constants/app_spacing.dart';
import 'package:mission_5_wanderly/core/extensions/padding_extension.dart';
import 'package:mission_5_wanderly/core/extensions/positioned_extension.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';
import 'package:mission_5_wanderly/presentation/providers/trip_provider.dart';
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
          // Use Consumer to get ref inside builder
          builder: (context, ref, child) {
            final isAsc = ref.watch(tripSortAscendingProvider);

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: AppSpacing.m),
                Text('Sort Options', style: AppTextStyles.h3),
                const Divider(),
                ListTile(
                  leading: const HeroIcon(HeroIcons.barsArrowUp),
                  title: const Text('Name: A to Z'),
                  trailing: isAsc
                      ? const HeroIcon(HeroIcons.check, color: Colors.blue)
                      : null,
                  onTap: () {
                    ref.read(tripSortAscendingProvider.notifier).state = true;
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const HeroIcon(HeroIcons.barsArrowDown),
                  title: const Text('Name: Z to A'),
                  trailing: !isAsc
                      ? const HeroIcon(HeroIcons.check, color: Colors.blue)
                      : null,
                  onTap: () {
                    ref.read(tripSortAscendingProvider.notifier).state = false;
                    Navigator.pop(context);
                  },
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
    // Watch the filtered results
    final filteredTrips = ref.watch(filteredTripsProvider);
    final isAsc = ref.watch(tripSortAscendingProvider);

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
