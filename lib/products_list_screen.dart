import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/category_item.dart';
import 'package:product/domain/categories_cubit.dart';
import 'package:product/domain/produjcts_cujbit.dart';
import 'package:product/domain/sub_categories_cubit.dart';
import 'package:product/product_card.dart';
import 'package:product/domain/model/category_product.dart';

final _categories = [
  const CategoryProduct(title: 'Type of product 1', id: 'c1'),
  const CategoryProduct(title: 'Type of product 2', id: 'c2'),
  const CategoryProduct(title: 'Type of product 3', id: 'c3'),
  const CategoryProduct(title: 'Type of product 4', id: 'c4'),
  const CategoryProduct(title: 'Type of product 5', id: 'c5'),
];

final _subCategoriesData = [
  const CategoryProduct(title: 'SubCategory 1', id: 'a1'),
  const CategoryProduct(title: 'SubCategory 2', id: 'a2'),
  const CategoryProduct(title: 'SubCategory 3', id: 'a3')
];

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoriesCubit(),
        ),
        BlocProvider(
          create: (context) => SubCategoriesCubit(),
        ),
        BlocProvider(
          create: (context) => ProductsCubit(),
        ),
      ],
      child: BlocListener<CategoriesCubit, CategoriesCubitState>(
        listener: (context, state) {
          final ids = state.selectedCategories;
          final subIds =
              context.read<SubCategoriesCubit>().state.selectedSubCategories;
          context.read<ProductsCubit>().loadData(
                cat: ids,
                subCat: subIds,
              );
        },
        child: BlocListener<SubCategoriesCubit, StateSubCategoriesCubit>(
          listener: (context, state) {
            final ids = state.selectedSubCategories;
            final subIds =
                context.read<CategoriesCubit>().state.selectedCategories;
            context.read<ProductsCubit>().loadData(
                  cat: subIds,
                  subCat: ids,
                );
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Title',
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.info_outline),
                )
              ],
            ),
            body: Container(
              decoration: const BoxDecoration(color: Colors.black),
              child: Column(
                children: [
                  BlocBuilder<CategoriesCubit, CategoriesCubitState>(
                    builder: (context, state) => Container(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = _categories[index];
                          return CategoryItem(
                            isSelected:
                                state.selectedCategories.contains(item.id),
                            title: item,
                            onTap: () => context
                                .read<CategoriesCubit>()
                                .chooseCategories(item.id),
                          );
                        },
                      ),
                    ),
                  ),
                  BlocBuilder<SubCategoriesCubit, StateSubCategoriesCubit>(
                      builder: (context, state) => SizedBox(
                          height: 40,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _subCategoriesData.length,
                            itemBuilder: (BuildContext context, int index) {
                              final item = _subCategoriesData[index];
                              return CategoryItem(
                                isSelected: state.selectedSubCategories
                                    .contains(item.id),
                                title: item,
                                onTap: () => context
                                    .read<SubCategoriesCubit>()
                                    .chooseSubCategory(item.id),
                              );
                            },
                          ))),
                  Expanded(
                    child: BlocBuilder<ProductsCubit, ProductsState>(
                      builder: (context, state) => GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 2 / 3,
                        ),
                        itemCount: state.data.length,
                        itemBuilder: (context, index) => ProductCard(
                          product: state.data[index],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
