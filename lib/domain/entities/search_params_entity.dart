import 'package:equatable/equatable.dart';


class SearchParams extends Equatable{
  final String searchParam;

  const SearchParams(this.searchParam);
  
  @override
  List<Object?> get props => [searchParam];
}