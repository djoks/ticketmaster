# `assets` Folder

This folder contains all the static files and resources for the application. Here’s a breakdown of the main sub-folders:

1. **fonts/**  
   Store custom font files (e.g., `.ttf`, `.otf`) here. To use them in the application, reference them in `pubspec.yaml` file under the `fonts:` section.

2. **images/**  
   Holds image resources such as `.png`, `.jpg`, and `.svg` files. These files might be icons, illustrations, or other graphics. Reference them in code using widgets like `Image.asset()` or `AssetImage`.

3. **translations/**  
   Contains language-specific files for **easy_localization**. For example; `en.json` for English, `es.json` for Spanish, and so on. Configure these translation files in app, typically at the initialization or root level of Flutter project.

---

## Adding or Updating Assets

1. **Place files** in the appropriate sub-folder (`fonts/`, `images/`, or `translations/`).
2. **Update `pubspec.yaml`** to make Flutter aware of assets. A sample structure might look like this:

   ```yaml
   flutter:
     assets:
       - assets/images/
       - assets/translations/
     fonts:
       - family: MyCustomFont
         fonts:
           - asset: assets/fonts/MyCustomFont-Regular.ttf
   ```
