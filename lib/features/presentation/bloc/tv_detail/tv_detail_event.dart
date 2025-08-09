import 'package:equatable/equatable.dart';

class TvDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchTvDetail extends TvDetailEvent {
  final int tvId;

   FetchTvDetail(this.tvId);

  @override
  List<Object?> get props => [tvId];
}
