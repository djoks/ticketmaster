import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticketmaster/models/event.dart';
import 'package:intl/intl.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final event = GoRouterState.of(context).extra as Event?;
    final String eventId =
        GoRouterState.of(context).pathParameters['id'] ?? 'Unknown';

    String formattedDateTime = '';
    if (event != null) {
      final dateTime = DateTime.tryParse('${event.date}T${event.time}');
      if (dateTime != null) {
        formattedDateTime = DateFormat("MMM d, yyyy, h:mm a").format(dateTime);
      } else {
        formattedDateTime = '${event.date} ${event.time}';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(event?.name ?? 'Event $eventId Details'),
      ),
      body: event != null
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Banner image
                    if (event.banner.isNotEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: event.banner,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    const SizedBox(height: 16),
                    // Event name
                    Text(
                      event.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    // Formatted Date & Time
                    Text(
                      'Date: $formattedDateTime',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    // Location
                    Text(
                      'Location: ${event.location}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    // Price range if available
                    if (event.priceRange != null)
                      Text(
                        'Price: \$${event.priceRange!.min.toStringAsFixed(2)} - \$${event.priceRange!.max.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    const SizedBox(height: 16),
                    // Event info
                    if (event.info != null)
                      Text(
                        event.info!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                  ],
                ),
              ),
            )
          : Center(
              child: Text(
                'No event details available.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
    );
  }
}
