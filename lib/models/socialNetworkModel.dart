class SocialNetworkModel {
  final List<SocialNetwork> socialNetwork;

  SocialNetworkModel({
    required this.socialNetwork,
  });
}

class SocialNetwork {
  final String link;
  final String? svg;
  final String? placeHolder;

  SocialNetwork({required this.link, this.svg, this.placeHolder});
}
