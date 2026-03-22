import 'package:bookia_app/features/home/data/models/books_model.dart';
import 'package:bookia_app/features/search/data/repo/search_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial()) {
    _searchSubject
        .debounceTime(Duration(milliseconds: 500))
        .distinct()
        .listen(_search);
  }
  
  void seaarchAction(String text) {
    _searchSubject.add(text);
  }
  final _searchSubject = PublishSubject<String>();

   Future<void>_search(String text) async {
    emit(SearchLoading());
    final response = await SearchRepo.productSearch(text);
    if (response is BooksModel) {
      emit(SearchSuccess(books: response.data?.products));
    } else {
      emit(SearcheErorr(errorMessage: response));
    }
  }

  @override
  Future<void> close() {
    _searchSubject.close();
    return super.close();
  }
}
