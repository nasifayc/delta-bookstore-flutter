import 'package:delta_ebookstore_app/controllers/search/search_cubit.dart';
import 'package:delta_ebookstore_app/controllers/search/search_state.dart';
import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCard extends StatefulWidget {
  const FilterCard({super.key});

  @override
  State<FilterCard> createState() => _FilterCardState();
}

class _FilterCardState extends State<FilterCard> {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);

    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchWithFilter) {
          final List<String> allFilters = [
            ...state.category,
            ...state.location
          ];
          if (state.date.isNotEmpty || state.date != '') {
            allFilters.insert(0, state.date);
          }

          if (state.date.isEmpty &&
              state.category.isEmpty &&
              state.location.isEmpty) {
            return Center(
              child: Text(
                'Add Filters',
                style: theme.typography.titleSmall.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal,
                    fontSize: 14),
              ),
            );
          }

          return Wrap(
            spacing: 8.0,
            runSpacing: 10.0,
            children: List.generate(allFilters.length, (index) {
              final filter = allFilters[index];
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: theme.secondary,
                  border: Border.all(color: theme.primary.withOpacity(0.2)),
                ),
                child: Text(
                  filter,
                  style: theme.typography.titleSmall.copyWith(
                      color: theme.primary.withOpacity(0.7),
                      fontWeight: FontWeight.normal),
                ),
              );
            }),
          );
        }
        return Text(
          'Error',
          style: theme.typography.headlineMedium,
        );
      },
    );
  }
}
