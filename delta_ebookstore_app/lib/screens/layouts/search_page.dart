import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/widgets/common/form_components.dart';
import 'package:delta_ebookstore_app/widgets/common/primary_button.dart';
import 'package:delta_ebookstore_app/widgets/search/add_filter_sheet.dart';
import 'package:delta_ebookstore_app/widgets/search/filter_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    FormComponents formComponents = FormComponents(context: context);
    TextEditingController searchController = TextEditingController();
    AppTheme theme = AppTheme.of(context);

    void showFilterPage() {
      showModalBottomSheet(
        backgroundColor: theme.secondary,
        context: context,
        isScrollControlled: true,
        builder: (context) => Container(
          padding: MediaQuery.of(context).viewInsets,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: theme.secondary),
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              child: const AddFilterSheet()),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  PrimaryButton(
                      width: 50,
                      onPressed: () => Navigator.of(context).pop(),
                      color: theme.primary,
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: theme.secondary,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: formComponents.buildSearchBar(
                        searchController, 'Search', false),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  PrimaryButton(
                    width: 50,
                    onPressed: showFilterPage,
                    color: theme.primary,
                    child: Icon(
                      Icons.filter_list,
                      color: theme.secondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Filters',
                style: theme.typography.headlineSmall,
              ),
              const SizedBox(
                height: 10,
              ),
              const FilterCard(),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Result',
                style: theme.typography.headlineSmall,
              ),
              const SizedBox(
                height: 60,
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/empty-box.png',
                      height: 100,
                      width: 100,
                    ),
                    Text(
                      'No Data',
                      style: theme.typography.bodySmall,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// AppBar(
//         elevation: 0,
//         centerTitle: true,
//         title: formComponents.buildSearchBar(searchController, 'Search', false),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
//             child: PrimaryButton(
//                 width: 50,
//                 onPressed: null,
//                 color: theme.primary.withOpacity(0.8),
//                 child: Icon(
//                   Icons.filter_list,
//                   color: theme.secondary,
//                 )),
//           )
//         ],
//       )
