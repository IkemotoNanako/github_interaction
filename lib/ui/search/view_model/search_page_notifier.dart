import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_interaction/model/search/search_state.dart';
import 'package:github_interaction/repository/search/search_repository_impl.dart';

final searchNotifierProvider =
    StateNotifierProvider<SearchNotifier, SearchState>(
  (ref) => SearchNotifier(ref),
);

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier(this.ref) : super(const SearchState());
  Ref ref;

  void searchAccount(String query) async {
    final accounts = await ref.read(searchRepositoryProvider).fetch(query);
    state = state.copyWith(accounts: accounts);
  }
}
