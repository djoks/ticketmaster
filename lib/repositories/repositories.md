# repositories/

Contains repository classes that handle data retrieval and manipulation, including from multiple data sources:

```yaml
example_repository/
│-- example_repository_interface.dart
│-- example_repository.dart
└-- sources/
│-- │-- local_example_repository.dart
└-- └-- remote_example_repository.dart
```

The main `example_repository.dart` decides which source to use (local or remote) based on your app logic.
