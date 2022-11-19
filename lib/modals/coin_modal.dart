import 'dart:convert';

List<CoinModal> coinModalFromJson(String str) =>
    List<CoinModal>.from(json.decode(str).map((x) => CoinModal.fromJson(x)));

class CoinModal {
  CoinModal({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.priceChangePercentage24H,
  });

  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final double priceChangePercentage24H;

  factory CoinModal.fromJson(Map<String, dynamic> json) => CoinModal(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"].toDouble(),
        priceChangePercentage24H:
            json["price_change_percentage_24h"].toDouble(),
      );
}
