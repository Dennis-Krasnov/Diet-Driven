import 'package:bloc/bloc.dart';
import 'package:diet_driven/blocs/authentication/authentication.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState => null;

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationState currentState, AuthenticationEvent event) async* {
//    if (event is LoadFoodRecords) {
//      yield* _mapLoadFoodDiaryToState();
//    }
//    else if (event is AddFoodRecord) {
//      yield* _mapAddFoodRecordToState(currentState, event);
//    }
//    else {
      print("AUTHENTICATION EVENT NOT DEFINED: $event");
//    }
  }


}