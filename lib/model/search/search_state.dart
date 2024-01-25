import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_interaction/core/account.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default([]) List<Account> accounts,
  }) = _SearchState;
}
