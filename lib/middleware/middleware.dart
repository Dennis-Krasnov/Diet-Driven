import 'package:built_redux/built_redux.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/page.dart';
import 'package:firebase_auth/firebase_auth.dart';

Middleware<AppState, AppStateBuilder, Actions> createMiddleware(FirebaseAuth auth) {
  return (MiddlewareBuilder<AppState, AppStateBuilder, Actions>()
      ..add(ActionsNames.initApp, initApp(auth))
      ..add(ActionsNames.logout, logout(auth))
  ).build();
}

// TODO: create a typedef for this, use => syntax!
//typedef MiddlewareHandler<AppState, AppStateBuilder, Actions, void> MWH(); // this is wrong

MiddlewareHandler<AppState, AppStateBuilder, Actions, void> initApp(FirebaseAuth auth) {
  return (MiddlewareApi<AppState, AppStateBuilder, Actions> api, ActionHandler next, Action action) async {
    if (api.state.user == null) {
      api.actions.setLoading(true);

      // TODO: if persisted exists, go on, otherwise go to menu!
      FirebaseUser user = await auth.signInWithEmailAndPassword(email: "dennis.krasnov@gmail.com", password: "bobobo")
          .catchError((e) {
            print(e);
            api.actions.setLoading(false);
          });

      api.actions.setUser(user);
      api.actions.setLoading(false);
    }

//    if (api.state.isLoading) {
//      repository.loadTodos().then((todos) {
//        return api.actions.loadTodosSuccess(todos);
//      }).catchError(api.actions.loadTodosFailure);
//    }

    next(action);
  };
}


MiddlewareHandler<AppState, AppStateBuilder, Actions, void> logout(FirebaseAuth auth) {
  return (MiddlewareApi<AppState, AppStateBuilder, Actions> api, ActionHandler next, Action action) async {
    await auth.signOut();
    api.actions.goTo(Page.loginScreen); // TODO: still throws errors!
    api.actions.setUser(null);
    next(action);
  };
}