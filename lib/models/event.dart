import 'dart:convert';

import 'package:collection/collection.dart';

import 'accessibility.dart';
import 'age_restrictions.dart';
import 'classification.dart';
import 'dates.dart';
import 'embedded.dart';
import 'image.dart';
import 'links.dart';
import 'outlet.dart';
import 'price_range.dart';
import 'product.dart';
import 'promoter.dart';
import 'sales.dart';
import 'seatmap.dart';
import 'ticket_limit.dart';
import 'ticketing.dart';

class Event {
  String? name;
  String? type;
  String? id;
  bool? test;
  String? url;
  String? locale;
  List<Image>? images;
  Sales? sales;
  Dates? dates;
  List<Classification>? classifications;
  Promoter? promoter;
  List<Promoter>? promoters;
  List<PriceRange>? priceRanges;
  List<Product>? products;
  Seatmap? seatmap;
  Accessibility? accessibility;
  TicketLimit? ticketLimit;
  AgeRestrictions? ageRestrictions;
  Ticketing? ticketing;
  Links? links;
  Embedded? embedded;
  String? info;
  String? pleaseNote;
  List<Outlet>? outlets;

  Event({
    this.name,
    this.type,
    this.id,
    this.test,
    this.url,
    this.locale,
    this.images,
    this.sales,
    this.dates,
    this.classifications,
    this.promoter,
    this.promoters,
    this.priceRanges,
    this.products,
    this.seatmap,
    this.accessibility,
    this.ticketLimit,
    this.ageRestrictions,
    this.ticketing,
    this.links,
    this.embedded,
    this.info,
    this.pleaseNote,
    this.outlets,
  });

  @override
  String toString() {
    return 'Event(name: $name, type: $type, id: $id, test: $test, url: $url, locale: $locale, images: $images, sales: $sales, dates: $dates, classifications: $classifications, promoter: $promoter, promoters: $promoters, priceRanges: $priceRanges, products: $products, seatmap: $seatmap, accessibility: $accessibility, ticketLimit: $ticketLimit, ageRestrictions: $ageRestrictions, ticketing: $ticketing, links: $links, embedded: $embedded, info: $info, pleaseNote: $pleaseNote, outlets: $outlets)';
  }

  factory Event.fromMap(Map<String, dynamic> data) => Event(
        name: data['name'] as String?,
        type: data['type'] as String?,
        id: data['id'] as String?,
        test: data['test'] as bool?,
        url: data['url'] as String?,
        locale: data['locale'] as String?,
        images: (data['images'] as List<dynamic>?)
            ?.map((e) => Image.fromMap(e as Map<String, dynamic>))
            .toList(),
        sales: data['sales'] == null
            ? null
            : Sales.fromMap(data['sales'] as Map<String, dynamic>),
        dates: data['dates'] == null
            ? null
            : Dates.fromMap(data['dates'] as Map<String, dynamic>),
        classifications: (data['classifications'] as List<dynamic>?)
            ?.map((e) => Classification.fromMap(e as Map<String, dynamic>))
            .toList(),
        promoter: data['promoter'] == null
            ? null
            : Promoter.fromMap(data['promoter'] as Map<String, dynamic>),
        promoters: (data['promoters'] as List<dynamic>?)
            ?.map((e) => Promoter.fromMap(e as Map<String, dynamic>))
            .toList(),
        priceRanges: (data['priceRanges'] as List<dynamic>?)
            ?.map((e) => PriceRange.fromMap(e as Map<String, dynamic>))
            .toList(),
        products: (data['products'] as List<dynamic>?)
            ?.map((e) => Product.fromMap(e as Map<String, dynamic>))
            .toList(),
        seatmap: data['seatmap'] == null
            ? null
            : Seatmap.fromMap(data['seatmap'] as Map<String, dynamic>),
        accessibility: data['accessibility'] == null
            ? null
            : Accessibility.fromMap(
                data['accessibility'] as Map<String, dynamic>),
        ticketLimit: data['ticketLimit'] == null
            ? null
            : TicketLimit.fromMap(data['ticketLimit'] as Map<String, dynamic>),
        ageRestrictions: data['ageRestrictions'] == null
            ? null
            : AgeRestrictions.fromMap(
                data['ageRestrictions'] as Map<String, dynamic>),
        ticketing: data['ticketing'] == null
            ? null
            : Ticketing.fromMap(data['ticketing'] as Map<String, dynamic>),
        links: data['_links'] == null
            ? null
            : Links.fromMap(data['_links'] as Map<String, dynamic>),
        embedded: data['_embedded'] == null
            ? null
            : Embedded.fromMap(data['_embedded'] as Map<String, dynamic>),
        info: data['info'] as String?,
        pleaseNote: data['pleaseNote'] as String?,
        outlets: (data['outlets'] as List<dynamic>?)
            ?.map((e) => Outlet.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'type': type,
        'id': id,
        'test': test,
        'url': url,
        'locale': locale,
        'images': images?.map((e) => e.toMap()).toList(),
        'sales': sales?.toMap(),
        'dates': dates?.toMap(),
        'classifications': classifications?.map((e) => e.toMap()).toList(),
        'promoter': promoter?.toMap(),
        'promoters': promoters?.map((e) => e.toMap()).toList(),
        'priceRanges': priceRanges?.map((e) => e.toMap()).toList(),
        'products': products?.map((e) => e.toMap()).toList(),
        'seatmap': seatmap?.toMap(),
        'accessibility': accessibility?.toMap(),
        'ticketLimit': ticketLimit?.toMap(),
        'ageRestrictions': ageRestrictions?.toMap(),
        'ticketing': ticketing?.toMap(),
        '_links': links?.toMap(),
        '_embedded': embedded?.toMap(),
        'info': info,
        'pleaseNote': pleaseNote,
        'outlets': outlets?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Event].
  factory Event.fromJson(String data) {
    return Event.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Event] to a JSON string.
  String toJson() => json.encode(toMap());

  Event copyWith({
    String? name,
    String? type,
    String? id,
    bool? test,
    String? url,
    String? locale,
    List<Image>? images,
    Sales? sales,
    Dates? dates,
    List<Classification>? classifications,
    Promoter? promoter,
    List<Promoter>? promoters,
    List<PriceRange>? priceRanges,
    List<Product>? products,
    Seatmap? seatmap,
    Accessibility? accessibility,
    TicketLimit? ticketLimit,
    AgeRestrictions? ageRestrictions,
    Ticketing? ticketing,
    Links? links,
    Embedded? embedded,
    String? info,
    String? pleaseNote,
    List<Outlet>? outlets,
  }) {
    return Event(
      name: name ?? this.name,
      type: type ?? this.type,
      id: id ?? this.id,
      test: test ?? this.test,
      url: url ?? this.url,
      locale: locale ?? this.locale,
      images: images ?? this.images,
      sales: sales ?? this.sales,
      dates: dates ?? this.dates,
      classifications: classifications ?? this.classifications,
      promoter: promoter ?? this.promoter,
      promoters: promoters ?? this.promoters,
      priceRanges: priceRanges ?? this.priceRanges,
      products: products ?? this.products,
      seatmap: seatmap ?? this.seatmap,
      accessibility: accessibility ?? this.accessibility,
      ticketLimit: ticketLimit ?? this.ticketLimit,
      ageRestrictions: ageRestrictions ?? this.ageRestrictions,
      ticketing: ticketing ?? this.ticketing,
      links: links ?? this.links,
      embedded: embedded ?? this.embedded,
      info: info ?? this.info,
      pleaseNote: pleaseNote ?? this.pleaseNote,
      outlets: outlets ?? this.outlets,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Event) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      name.hashCode ^
      type.hashCode ^
      id.hashCode ^
      test.hashCode ^
      url.hashCode ^
      locale.hashCode ^
      images.hashCode ^
      sales.hashCode ^
      dates.hashCode ^
      classifications.hashCode ^
      promoter.hashCode ^
      promoters.hashCode ^
      priceRanges.hashCode ^
      products.hashCode ^
      seatmap.hashCode ^
      accessibility.hashCode ^
      ticketLimit.hashCode ^
      ageRestrictions.hashCode ^
      ticketing.hashCode ^
      links.hashCode ^
      embedded.hashCode ^
      info.hashCode ^
      pleaseNote.hashCode ^
      outlets.hashCode;
}
