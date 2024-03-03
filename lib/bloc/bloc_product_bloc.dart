import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_product_event.dart';
part 'bloc_product_state.dart';

class BlocProductBloc extends Bloc<BlocProductEvent, BlocProductState> {
  BlocProductBloc() : super(BlocProductInitial()) {
    on<BlocProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
