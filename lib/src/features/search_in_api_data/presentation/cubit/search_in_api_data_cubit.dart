import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_in_api_data_state.dart';

class SearchInApiDataCubit extends Cubit<SearchInApiDataState> {
  SearchInApiDataCubit() : super(SearchInApiDataInitial());
}
