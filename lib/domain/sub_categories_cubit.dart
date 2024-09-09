import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoriesCubit extends Cubit<StateSubCategoriesCubit> {
  SubCategoriesCubit()
      : super(
          StateSubCategoriesCubit(
            selectedSubCategories: [],
          ),
        );

  void chooseSubCategory(String id) {
    final subCategoriesIds = [...state.selectedSubCategories];

    if (subCategoriesIds.contains(id)) {
      subCategoriesIds.remove(id);
    } else {
      subCategoriesIds.add(id);
    }

    emit(
      StateSubCategoriesCubit(selectedSubCategories: subCategoriesIds),
    );
  }
}

class StateSubCategoriesCubit {
  final List<String> selectedSubCategories;
  StateSubCategoriesCubit({required this.selectedSubCategories});
}
