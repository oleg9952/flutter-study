import 'package:flutter/material.dart';
import 'package:project_6/components/home/category_grid.dart';
import 'package:project_6/components/home/section_header.dart';
import 'package:project_6/models/category.dart';
import 'package:project_6/models/task.dart';
import 'package:project_6/app/router.dart';
import 'package:project_6/components/home/add_category_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Category> _categories;

  List<Category> _mockCategories() {
    // temporary static data for UI preview
    return const [
      Category(
        id: '1',
        name: 'Personal',
        tasks: [
          Task(id: '1', title: 'Task 1', isCompleted: true),
          Task(id: '2', title: 'Task 2', isCompleted: true),
          Task(id: '3', title: 'Task 3', isCompleted: false),
          Task(id: '4', title: 'Task 4', isCompleted: false),
          Task(id: '5', title: 'Task 5', isCompleted: false),
        ],
      ),
      Category(
        id: '2',
        name: 'Work',
        tasks: [
          Task(id: '1', title: 'Task 1', isCompleted: true),
        ],
      ),
      Category(
        id: '3',
        name: 'Shopping',
        tasks: [
          Task(id: '1', title: 'Task 1', isCompleted: true),
          Task(id: '2', title: 'Task 2', isCompleted: true),
          Task(id: '3', title: 'Task 3', isCompleted: true),
          Task(id: '4', title: 'Task 4', isCompleted: true),
          Task(id: '5', title: 'Task 5', isCompleted: true),
          Task(id: '6', title: 'Task 6', isCompleted: true),
          Task(id: '7', title: 'Task 7', isCompleted: true),
        ],
      ),
      Category(
        id: '4',
        name: 'Travel',
        tasks: [
          Task(id: '1', title: 'Task 1', isCompleted: true),
          Task(id: '2', title: 'Task 2', isCompleted: false),
          Task(id: '3', title: 'Task 3', isCompleted: false),
          Task(id: '4', title: 'Task 4', isCompleted: false),
        ],
      ),
      Category(
        id: '5',
        name: 'Fitness',
        tasks: [
          Task(id: '1', title: 'Task 1', isCompleted: true),
          Task(id: '2', title: 'Task 2', isCompleted: true),
          Task(id: '3', title: 'Task 3', isCompleted: true),
          Task(id: '4', title: 'Task 4', isCompleted: true),
          Task(id: '5', title: 'Task 5', isCompleted: true),
        ],
      ),
      Category(
        id: '6',
        name: 'Reading',
        tasks: [
          Task(id: '1', title: 'Task 1', isCompleted: true),
          Task(id: '2', title: 'Task 2', isCompleted: true),
          Task(id: '3', title: 'Task 3', isCompleted: true),
          Task(id: '4', title: 'Task 4', isCompleted: true),
          Task(id: '5', title: 'Task 5', isCompleted: true),
          Task(id: '6', title: 'Task 6', isCompleted: true),
          Task(id: '7', title: 'Task 7', isCompleted: true),
          Task(id: '8', title: 'Task 8', isCompleted: true),
          Task(id: '9', title: 'Task 9', isCompleted: true),
          Task(id: '10', title: 'Task 10', isCompleted: true),
        ],
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _categories = _mockCategories();
  }

  Future<void> _onAddCategory() async {
    final created = await showAddCategorySheet(context);
    if (created != null) {
      setState(() {
        _categories = List<Category>.from(_categories)..insert(0, created);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final inProgress = _categories.where((c) => !c.isCompleted).toList();
    final completed = _categories.where((c) => c.isCompleted).toList();

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
              if (inProgress.isNotEmpty)
                CategoryGrid(
                  categories: inProgress,
                  onTap: (c) => Navigator.of(context)
                      .pushNamed(AppRoutes.category, arguments: null),
                  onLongPress: (c) {},
                ),
              if (completed.isNotEmpty) ...[
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                const SliverToBoxAdapter(
                  child: SectionHeader(title: 'Completed'),
                ),
                CategoryGrid(
                  categories: completed,
                  onTap: (c) => Navigator.of(context)
                      .pushNamed(AppRoutes.category, arguments: null),
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
