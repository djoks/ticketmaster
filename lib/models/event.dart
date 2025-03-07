import 'package:ticketmaster/models/price_range.dart';

/// Model representing an event.
class Event {
  /// Unique identifier for the event.
  final String id;

  /// Name of the event.
  final String name;

  /// URL for a small (thumbnail) image.
  final String thumbnail;

  /// URL for the default banner image.
  final String banner;

  /// Date of the event (formatted as a string).
  final String date;

  /// Time of the event (formatted as a string).
  final String time;

  /// Optional price range information.
  final PriceRange? priceRange;

  /// Location of the event.
  final String location;

  /// A full description of the event.
  final String? description;

  /// Additional information for the event.
  final String? additionalInfo;

  /// URL for a high-definition image, if available.
  final String? hdImage;

  /// URL to purchase tickets on Ticketmaster.
  final String? purchaseUrl;

  Event({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.banner,
    required this.date,
    required this.time,
    this.priceRange,
    required this.location,
    this.description,
    this.additionalInfo,
    this.hdImage,
    this.purchaseUrl,
  });

  /// Creates an instance of [Event] from a JSON map.
  factory Event.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String? ?? '';
    final name = json['name'] as String? ?? '';

    // Process images.
    final List images = json['images'] as List? ?? [];
    String thumbnail = '';
    String banner = '';
    String? hdImage;
    if (images.isNotEmpty) {
      thumbnail = images[0]['url'] as String? ?? '';
      final bannerImage = images.firstWhere(
        (img) => img['ratio'] == '16_9',
        orElse: () => null,
      );
      banner = bannerImage != null
          ? bannerImage['url'] as String? ?? thumbnail
          : thumbnail;
      // Optionally, choose a high-def image (e.g., one with width > 1000).
      final hd = images.firstWhere((img) {
        final width = img['width'] as num? ?? 0;
        return width > 1000;
      }, orElse: () => null);
      hdImage = hd != null ? hd['url'] as String? : null;
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

    // Optional fields.
    final description = json['description'] as String?;
    final additionalInfo = json['additionalInfo'] as String?;
    final purchaseUrl = json['url'] as String?;

    return Event(
      id: id,
      name: name,
      thumbnail: thumbnail,
      banner: banner,
      date: date,
      time: time,
      priceRange: priceRange,
      location: location,
      description: description,
      additionalInfo: additionalInfo,
      hdImage: hdImage,
      purchaseUrl: purchaseUrl,
    );
  }
}
