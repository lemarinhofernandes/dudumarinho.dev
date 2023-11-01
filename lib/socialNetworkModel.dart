class SocialNetworkModel {
  final List<SocialNetwork> socialNetwork;

  SocialNetworkModel({
    required this.socialNetwork,
  });
}

class SocialNetwork {
  final String link;
  final String svg;

  SocialNetwork({
    required this.link,
    required this.svg,
  });
}
