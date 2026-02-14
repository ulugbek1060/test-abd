import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

class UserFollowEvent {
  final int userId;
  final bool isFollowing;
  UserFollowEvent(this.userId, this.isFollowing);
}

abstract class ConnectionFollowEventListener {
  Stream<UserFollowEvent> get followStream;
  void publish(UserFollowEvent event);
  void dispose();
}

@named
@LazySingleton(as: ConnectionFollowEventListener, dispose: disposeMethod)
class ConnectionFollowListener implements ConnectionFollowEventListener {
  final PublishSubject<UserFollowEvent> _followSubject = PublishSubject<UserFollowEvent>();

  @override
  Stream<UserFollowEvent> get followStream => _followSubject.stream;

  @override
  void publish(UserFollowEvent event) {
    _followSubject.add(event);
  }

  @override
  void dispose() {
    _followSubject.close();
  }
}

@named
@LazySingleton(as: ConnectionFollowEventListener, dispose: disposeMethod)
class ProfileFollowListener implements ConnectionFollowEventListener {
  final PublishSubject<UserFollowEvent> _followSubject =
  PublishSubject<UserFollowEvent>();

  @override
  Stream<UserFollowEvent> get followStream => _followSubject.stream;

  @override
  void publish(UserFollowEvent event) {
    _followSubject.add(event);
  }

  @override
  void dispose() {
    _followSubject.close();
  }
}

@named
@LazySingleton(as: ConnectionFollowEventListener, dispose: disposeMethod)
class UserFollowListener implements ConnectionFollowEventListener {
  final PublishSubject<UserFollowEvent> _followSubject =
      PublishSubject<UserFollowEvent>();

  @override
  Stream<UserFollowEvent> get followStream => _followSubject.stream;

  @override
  void publish(UserFollowEvent event) {
    _followSubject.add(event);
  }

  @override
  void dispose() {
    _followSubject.close();
  }
}

@named
@LazySingleton(as: ConnectionFollowEventListener, dispose: disposeMethod)
class LeaderboardFollowListener implements ConnectionFollowEventListener {
  final PublishSubject<UserFollowEvent> _followSubject =
      PublishSubject<UserFollowEvent>();

  @override
  Stream<UserFollowEvent> get followStream => _followSubject.stream;

  @override
  void publish(UserFollowEvent event) {
    _followSubject.add(event);
  }

  @override
  void dispose() {
    _followSubject.close();
  }
}

// dispose 
void disposeMethod(ConnectionFollowEventListener listener) {
  listener.dispose();
}
