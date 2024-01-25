import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_interaction/core/account.dart';
import 'package:github_interaction/model/search/search_state.dart';

final mainNotifierProvider = StateNotifierProvider<MainNotifer, SearchState>(
  (ref) => MainNotifer(),
);

class MainNotifer extends StateNotifier<SearchState> {
  MainNotifer() : super(const SearchState());

  void addAccount(Account account) {
    state = state.copyWith(
      accounts: [...state.accounts, account],
    );
  }
}
