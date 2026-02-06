
enum ConnectionsEnum {
  following,
  followers;

  static ConnectionsEnum fromString(String value) {
    switch (value) {
      case 'following':
        return following;
      case 'followers':
        return followers;
      default:
        return following;
    }
  }
}