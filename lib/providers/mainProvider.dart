import 'package:mypage/models/bioModel.dart';
import 'package:mypage/models/socialNetworkModel.dart';

final class MainProvider {
  static final List<BioNodel> bios = [
    BioNodel(
        title: "Carreira",
        body:
            "Trabalho com desenvolvimento de software desde 2021, atualmente minha stack é iOS (Swift/Obj-C). Sou formado em Análise e Desenvolvimento de Sistemas e tento me manter alinhado com o mercado. Estou sempre procurando comunidades de iOS e profissionais que me inspiram na área. Planejo num futuro próximo começar a escrever artigos e publicar projetos pessoais."),
    BioNodel(
        title: "Mini bio [iOS]",
        body:
            "Trabalhando com iOS desde 2022, já atuei em um projeto interno da CI&T, onde usamos as tecnologias mais em alta do mercado. Atualmente atuo no maior banco da América Latina, onde tive a oportunidade de contribuir no produto mais esperado de 2023 pelos stakeholders. Tive também a chance de trabalhar no time de integração, fazendo Code Reviews e mantendo a qualidade do produto principal.")
  ];

  static final SocialNetworkModel myLinks = SocialNetworkModel(socialNetwork: [
    SocialNetwork(
        link: "https://github.com/lemarinhofernandes", svg: "github.svg"),
    SocialNetwork(
        link:
            "https://www.linkedin.com/in/lu%C3%ADs-eduardo-marinho-fernandes-3966341b0/",
        svg: "linkedin.svg"),
    SocialNetwork(
        link: "https://leetcode.com/lmarinhofernandez/",
        placeHolder: "LeetCode"),
  ]);
}
