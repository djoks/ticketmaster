import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ticketmaster/models/event.dart';
import 'package:ticketmaster/repositories/event_repository.dart';
import 'package:ticketmaster/ui/layouts/app_layout.dart';
import 'package:ticketmaster/ui/widgets/button.dart';
import 'package:ticketmaster/utils/logger.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ticketmaster/utils/locator.dart';

/// Displays detailed information about an event by fetching its data
/// using a FutureBuilder.
class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  /// Launches the given URL using the system browser.
  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  /// Fetches the event details using the repository.
  Future<Event> _fetchEventDetail(String eventId) {
    final repository = locator<EventRepository>();
    return repository.fetchEventDetail(eventId);
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the event id from the route parameters.
    final String eventId = GoRouterState.of(context).pathParameters['id'] ?? '';

    return FutureBuilder<Event>(
      future: _fetchEventDetail(eventId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData) {
          return const Center(child: Text('No event details available.'));
        }

        final Event event = snapshot.data!;

        final String imageUrl = event.hdImage ?? event.banner;
        final DateTime? dateTime =
            DateTime.tryParse('${event.date}T${event.time}');
        final String formattedDateTime = dateTime != null
            ? DateFormat("MMM d, yyyy, h:mm a").format(dateTime)
            : '${event.date} ${event.time}';

        return AppLayout(
          title: context.tr('details.title'),
          showBackButton: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner image.
                if (imageUrl.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(height: 16),
                // Event name.
                Text(
                  event.name,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 8),
                // Formatted date & time.
                Text(
                  'Date & Time: $formattedDateTime',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                // Location.
                Text(
                  'Location: ${event.location}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                // Price range if available.
                if (event.priceRange != null)
                  Text(
                    'Price: \$${event.priceRange!.min.toStringAsFixed(2)} - \$${event.priceRange!.max.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                const SizedBox(height: 16),
                // Event description.
                if (event.description != null)
                  Text(
                    event.description!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                const SizedBox(height: 24),
                // Ticket purchase button.
                if (event.purchaseUrl != null && event.purchaseUrl!.isNotEmpty)
                  Center(
                    child: Button(
                      size: ButtonSize.large,
                      onPressed: () => _launchUrl(event.purchaseUrl!),
                      child: const Text('Buy Tickets'),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
