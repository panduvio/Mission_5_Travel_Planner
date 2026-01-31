import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mission_5_wanderly/core/constants/app_radius.dart';
import 'package:mission_5_wanderly/core/constants/app_spacing.dart';
import 'package:mission_5_wanderly/core/extensions/alignment_extension.dart';
import 'package:mission_5_wanderly/core/extensions/padding_extension.dart';
import 'package:mission_5_wanderly/core/themes/app_colors.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';
import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';
import 'package:mission_5_wanderly/presentation/providers/trip_provider.dart';
import 'package:mission_5_wanderly/presentation/widgets/app_button.dart';
import 'package:mission_5_wanderly/presentation/widgets/custom_text_field.dart';
import 'package:mission_5_wanderly/presentation/widgets/grid_card.dart';
import 'package:provider/provider.dart';

class ItineraryScreen extends StatefulWidget {
  final bool isView;
  const ItineraryScreen({super.key, required this.isView});

  @override
  State<ItineraryScreen> createState() => _ItineraryScreenState(isView);
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  final bool isView;
  _ItineraryScreenState(this.isView);
  TextEditingController activityController = TextEditingController();
  late List<ItineraryEntity> itineraries;
  DateTime? selectedDate;
  int? expandedIndex;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2027),
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  void initState() {
    itineraries = context.read<TripProvider>().itineraries;
    if (itineraries.isNotEmpty && isView == true) {
      selectedDate = itineraries[0].date;
    }
    super.initState();
  }

  @override
  void dispose() {
    activityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Map<String, dynamic>> gridItems = [
      {'icon': HeroIcons.camera, 'label': 'Sightseeing'},
      {'icon': HeroIcons.buildingOffice, 'label': 'Staycation'},
      {'icon': HeroIcons.cake, 'label': 'Party'},
      {'icon': HeroIcons.buildingStorefront, 'label': 'Coffee'},
      {'icon': HeroIcons.film, 'label': 'Movie'},
      {'icon': HeroIcons.shoppingCart, 'label': 'Shopping'},
      {'icon': HeroIcons.bookOpen, 'label': 'Learning'},
      {'icon': HeroIcons.paintBrush, 'label': 'Art'},
      {'icon': HeroIcons.rectangleGroup, 'label': 'Other'},
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => context.goNamed('home'),
                child: HeroIcon(
                  HeroIcons.arrowLeftCircle,
                  color: AppColors.white,
                  size: 40,
                ).paddingAll(AppSpacing.m),
              ).withAlignment(Alignment.centerLeft),
              Text('Add to Itinerary!', style: AppTextStyles.h1),
              SizedBox(height: AppSpacing.m),
              isView
                  ? SizedBox()
                  : Text('Pick a Date', style: AppTextStyles.labelLarge),
              SizedBox(height: AppSpacing.xs),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      isView ? null : _selectDate();
                    },

                    child: Row(
                      children: [
                        Text(
                          selectedDate != null
                              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                              : 'No date selected',
                          style: AppTextStyles.labelLarge.copyWith(
                            color: theme.colorScheme.tertiary,
                          ),
                        ),
                        SizedBox(width: AppSpacing.s),
                        HeroIcon(
                          HeroIcons.calendarDays,
                          size: 24,
                          color: theme.colorScheme.tertiary,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: AppSpacing.m),
                  AppButton(
                    content: isView ? 'Save' : 'Book Now!',
                    onTap: () {
                      itineraries = List.from(
                        context.read<TripProvider>().itineraries,
                      );
                      context.goNamed('home');
                    },
                  ),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: gridItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: AppSpacing.m,
                  crossAxisSpacing: AppSpacing.m,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return GridCard(
                    icon: gridItems[index]['icon'],
                    label: gridItems[index]['label'],
                    onTap: () {
                      setState(() {
                        itineraries.add(
                          ItineraryEntity(
                            title: gridItems[index]['label'],
                            icon: gridItems[index]['icon'],
                            date: selectedDate ?? DateTime.now(),
                          ),
                        );
                      });
                    },
                  );
                },
              ).paddingAll(AppSpacing.s),
              SizedBox(height: AppSpacing.m),
              itineraries.isEmpty
                  ? SizedBox()
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: itineraries.length,
                      itemBuilder: (context, index) {
                        return _activityTiles(
                          theme,
                          itineraries[index].icon,
                          itineraries[index].title,
                          index,
                        );
                      },
                    ),
            ],
          ).paddingAll(AppSpacing.xl),
        ),
      ),
    );
  }

  Widget _activityTiles(
    ThemeData theme,
    HeroIcons icon,
    String label,
    int index,
  ) {
    return ExpansionTile(
      key: ValueKey('$index-$expandedIndex'),
      onExpansionChanged: (value) => setState(() {
        expandedIndex = value ? index : null;
        activityController.clear();
      }),
      initiallyExpanded: expandedIndex == index,
      backgroundColor: theme.colorScheme.primary,
      collapsedBackgroundColor: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: theme.colorScheme.tertiary),
        borderRadius: BorderRadiusGeometry.circular(AppRadius.card),
      ),
      collapsedShape: RoundedRectangleBorder(
        side: BorderSide(color: theme.colorScheme.tertiary),
        borderRadius: BorderRadiusGeometry.circular(AppRadius.card),
      ),
      leading: HeroIcon(icon),
      title: Text(label, style: AppTextStyles.bodyLarge),
      subtitle: Text('${itineraries[index].note ?? ''}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                itineraries.removeAt(index);
              });
            },
            child: HeroIcon(HeroIcons.trash),
          ),
        ],
      ),
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: activityController,
                prefixIcon: HeroIcons.clipboardDocumentList,
                label: 'Note',
                hint: 'Add a note',
              ),
            ),
            SizedBox(width: AppSpacing.s),
            GestureDetector(
              onTap: () {
                setState(() {
                  itineraries[index].note = activityController.text;
                  activityController.clear();
                });
              },
              child: HeroIcon(
                HeroIcons.checkCircle,
                size: 40,
                color: AppColors.secretGarden,
              ),
            ),
          ],
        ).paddingAll(AppSpacing.m),
      ],
    ).paddingAll(AppSpacing.s);
  }
}
