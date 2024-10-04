
class Card_Model{
  final String cardTitle;
  final String cardDescription;
  final String cardIcon;
  final bool visible;
  const Card_Model({required this.cardIcon, required this.cardDescription, required this.cardTitle, this.visible = true});
}

