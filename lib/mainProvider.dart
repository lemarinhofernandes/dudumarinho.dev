import 'package:mypage/socialNetworkModel.dart';

class MainProvider {
  static SocialNetworkModel myLinks() {
    return SocialNetworkModel(socialNetwork: [
      SocialNetwork(
          link: "https://github.com/lemarinhofernandes", svg: "github.svg"),
      SocialNetwork(
          link:
              "https://www.linkedin.com/in/lu%C3%ADs-eduardo-marinho-fernandes-3966341b0/",
          svg: "linkedin.svg")
    ]);
  }
}
