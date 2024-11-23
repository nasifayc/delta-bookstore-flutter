import 'package:delta_ebookstore_app/controllers/search/search_cubit.dart';
import 'package:delta_ebookstore_app/controllers/search/search_state.dart';
import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFilterSheet extends StatelessWidget {
  const AddFilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            String date = state is SearchWithFilter ? state.date : '';
            List<String> categories = state is SearchWithFilter
                ? List<String>.from(state.category)
                : [];
            List<String> location = state is SearchWithFilter
                ? List<String>.from(state.location)
                : [];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Filters',
                  style: theme.typography.headlineMedium,
                ),
                const SizedBox(height: 10),
                Text(
                  'Works only for books',
                  style: theme.typography.titleSmall,
                ),
                const SizedBox(height: 30),
                Text(
                  'Date range',
                  style: theme.typography.headlineSmall,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection:
                        Axis.horizontal, // Set horizontal scrolling
                    itemCount: state.dateFilters.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Radio<String>(
                            fillColor: WidgetStateProperty.all(
                                theme.primary.withOpacity(0.6)),
                            value: state.dateFilters[index],
                            groupValue: date,
                            onChanged: (value) {
                              context.read<SearchCubit>().searchWithFilter(
                                  value!, categories, location);
                            },
                          ),
                          Text(
                            state.dateFilters[index],
                            style: theme.typography.titleSmall
                                .copyWith(fontWeight: FontWeight.normal),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Category (${categories.length})',
                  style: theme.typography.headlineSmall,
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 10.0,
                  children:
                      List.generate(state.categoryFilters.length, (index) {
                    final category = state.categoryFilters[index];
                    return GestureDetector(
                      onTap: () {
                        // log(state.toString());
                        if (categories.contains(category)) {
                          categories.remove(category);
                        } else {
                          categories.add(category);
                        }
                        context
                            .read<SearchCubit>()
                            .searchWithFilter(date, categories, location);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: theme.secondary,
                          border: categories.contains(category)
                              ? Border.all(
                                  color: theme.primary,
                                )
                              : Border.all(
                                  color: theme.primary.withOpacity(0.2),
                                  width: 1),
                        ),
                        child: Text(
                          category,
                          style: theme.typography.titleSmall.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 30),
                Text(
                  'Location (${location.length})',
                  style: theme.typography.headlineSmall,
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 10.0,
                  children:
                      List.generate(state.locationFilters.length, (index) {
                    final loc = state.locationFilters[index];
                    return GestureDetector(
                      onTap: () {
                        // log(state.toString());
                        if (location.contains(loc)) {
                          location.remove(loc);
                        } else {
                          location.add(loc);
                        }
                        context
                            .read<SearchCubit>()
                            .searchWithFilter(date, categories, location);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: theme.secondary,
                          border: location.contains(loc)
                              ? Border.all(
                                  color: theme.primary,
                                )
                              : Border.all(
                                  color: theme.primary.withOpacity(0.2),
                                  width: 1),
                        ),
                        child: Text(
                          loc,
                          style: theme.typography.titleSmall
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          date = '';
                          categories.clear();
                          location.clear();
                          context.read<SearchCubit>().removeAllFilters();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: theme.tertiary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 45,
                          child: Center(
                            child: Text(
                              'Reset',
                              style: theme.typography.titleMedium
                                  .copyWith(fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (state is SearchWithFilter) {
                            context
                                .read<SearchCubit>()
                                .searchWithFilter(date, categories, location);
                          }

                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: theme.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 45,
                          child: Center(
                            child: Text(
                              'Done',
                              style: theme.typography.labelMedium
                                  .copyWith(fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
