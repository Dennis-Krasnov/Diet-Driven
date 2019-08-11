import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';

class LoggingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Logging"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.cloud_upload),
            onPressed: () => LoggingBloc().dispatch(SendLogsToDeveloper((b) => b..message = "")),
          )
        ],
      ),
      body: BlocBuilder<LoggingBloc, LoggingState>(
        bloc: LoggingBloc(),
        builder: (BuildContext context, LoggingState loggingState) {
          return ListView.builder(
            itemCount: loggingState.logs.length,
            itemBuilder: (BuildContext context, int index) {
              final log = loggingState.logs[index];

              if (log is BlocTransitionLog) {
                return ExpansionTile(
                  key: PageStorageKey<Log>(log),
                  title: Text(
                    "${log.message} - ${log.event.runtimeType}",
                    style: TextStyle(
                        fontSize: 12
                    ),
//                    style: Theme.of(context).textTheme.subhead, // FIXME
                  ),
                  leading: log.event is NavigationEvent ? const Icon(Icons.navigation) : const Icon(Icons.arrow_forward),
                  children: [
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Column(
                          children: <Widget>[
                            Text(log.datetime.toString()),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 16, 8.0),
                              child: Text("Before", style: Theme.of(context).textTheme.headline),
                            ),
                            Text(log.currentState.toString()),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 16, 8.0),
                              child: Text("Event", style: Theme.of(context).textTheme.headline),
                            ),
                            Text(log.event.toString()),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 16, 8.0),
                              child: Text("After", style: Theme.of(context).textTheme.headline),
                            ),
                            Text(log.nextState.toString()),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    )
                  ],
                );
                // TODO: icon depends on bloc type, pass as argument!
              }

              if (log is MessageLog) {
                return ListTile(
                  title: Text(log.message),
                  subtitle: Text(log.datetime.toString()),
                  leading: const Icon(Icons.info),
                  // TODO: icon depends on level
                );
              }

              if (log is ErrorLog) {
                // TODO: error expansion tile - extends!!! or composes expansion tile
                return ExpansionTile(
                  key: PageStorageKey<Log>(log),
                  title: Text(
                    log.message,
                    style: TextStyle(
                        fontSize: 12
                    ),
//                    style: Theme.of(context).textTheme.subhead, // FIXME
                  ),
                  leading: log.level == ErrorLoggingLevel.expected ? const Icon(Icons.bug_report) : const Icon(Icons.bug_report), // FIXME
                  children: [
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Column(
                          children: <Widget>[
                            Text(log.datetime.toString()),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 16, 8.0),
                              child: Text("Error", style: Theme.of(context).textTheme.headline),
                            ),
                            Text(log.error.toString()),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 16, 8.0),
                              child: Text("Severity", style: Theme.of(context).textTheme.headline),
                            ),
                            Text(log.level.toString()),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 16, 8.0),
                              child: Text("Stack trace", style: Theme.of(context).textTheme.headline),
                            ),
                            Text(log?.stacktrace.toString() ?? ""),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    )
                  ],
                );
//                return ListTile(
//                  title: Text(log.error.toString()),
//                  subtitle: Text(log.datetime.toString()),
////                  log?.stacktrace
//                  // TODO: icon depends on level
//                );
              }

              return null; // FIXME
            },
          );
        }
      ),
    );
  }
}
