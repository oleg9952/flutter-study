import 'package:flutter/material.dart';
import 'package:project_6/components/home/category_grid.dart';
import 'package:project_6/components/home/section_header.dart';
// models not used directly here; state provides categories
import 'package:project_6/app/router.dart';
import 'package:project_6/components/home/add_category_sheet.dart';
import 'package:project_6/components/home/empty_placeholder.dart';
import 'package:provider/provider.dart';
import 'package:project_6/state/category_store.dart';
import 'package:project_6/screens/category/category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _onAddCategory() async {
    final created = await showAddCategorySheet(context);
    if (created != null) {
      if (!mounted) return;
      context.read<CategoryStore>().addCategory(created);
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<CategoryStore>().categories;
    final inProgress = categories.where((c) => !c.isCompleted).toList();
    final completed = categories.where((c) => c.isCompleted).toList();

    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerLowest,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          margin: const EdgeInsets.all(12),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Categories',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
              ),
              if (categories.isEmpty)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: EmptyPlaceholder(),
                )
              else if (inProgress.isNotEmpty)
                CategoryGrid(
                  categories: inProgress,
                  onTap: (c) => Navigator.of(context).pushNamed(
                    AppRoutes.category,
                    arguments: CategoryScreenArgs(
                      categoryId: c.id,
                      categoryName: c.name,
                    ),
                  ),
                  onLongPress: (c) {},
                ),
              if (completed.isNotEmpty) ...[
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                const SliverToBoxAdapter(
                  child: SectionHeader(title: 'Completed'),
                ),
                CategoryGrid(
                  categories: completed,
                  onTap: (c) => Navigator.of(context).pushNamed(
                    AppRoutes.category,
                    arguments: CategoryScreenArgs(
                      categoryId: c.id,
                      categoryName: c.name,
                    ),
                  ),
                  onLongPress: (c) {},
                ),
              ],
              const SliverToBoxAdapter(child: SizedBox(height: 96)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAddCategory,
        child: const Icon(Icons.add),
      ),
    );
  }
}
