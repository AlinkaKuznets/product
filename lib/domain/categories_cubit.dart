import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesCubitState> {
  CategoriesCubit()
      : super(
          CategoriesCubitState(
            selectedCategories: [],
          ),
        );

  void chooseCategories(String id) {
    final selectedIds = [...state.selectedCategories];

    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }

    emit(
      CategoriesCubitState(
        selectedCategories: selectedIds,
      ),
    );
  }
}

class CategoriesCubitState {
  final List<String> selectedCategories;

  CategoriesCubitState({
    required this.selectedCategories,
  });
}
