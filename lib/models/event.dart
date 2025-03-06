import 'package:ticketmaster/models/price_range.dart';

class Event {
  final String id;
  final String name;
  final String thumbnail;
  final String banner;
  final String date;
  final String time;
  final PriceRange? priceRange;
  final String location;
  final String? info;

  Event({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.banner,
    required this.date,
    required this.time,
    this.priceRange,
    required this.location,
    this.info,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String? ?? '';
    final name = json['name'] as String? ?? '';

    final List images = json['images'] as List? ?? [];
    String thumbnail = '';
    String banner = '';
    if (images.isNotEmpty) {
      thumbnail = images[0]['url'] as String? ?? '';
      final bannerImage = images.firstWhere(
        (img) => img['ratio'] == '16_9',
        orElse: () => null,
      );
      banner = bannerImage != null
          ? bannerImage['url'] as String? ?? thumbnail
          : thumbnail;
    }

    final dates = json['dates']?['start'] ?? {};
    final date = dates['localDate'] as String? ?? '';
    final time = dates['localTime'] as String? ?? '';

    PriceRange? priceRange;
    if (json['priceRanges'] is List &&
        (json['priceRanges'] as List).isNotEmpty) {
      priceRange = PriceRange.fromJson((json['priceRanges'] as List).first);
    }

    String location = '';
    if (json['_embedded'] != null &&
        json['_embedded']['venues'] is List &&
        (json['_embedded']['venues'] as List).isNotEmpty) {
      location = (json['_embedded']['venues'][0]['name'] as String?) ?? '';
    }

    final info = json['info'] as String?;

    return Event(
      id: id,
      name: name,
      thumbnail: thumbnail,
      banner: banner,
      date: date,
      time: time,
      priceRange: priceRange,
      location: location,
      info: info,
    );
  }
}
