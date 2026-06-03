# AI Image

A simple Flutter app with a login screen, home screen, and image generation screen.

## Features

- Login screen with email and password validation (email format + password at least 6 characters)
- Home screen with welcome message, search bar, AI style categories, recent creations, and a create button
- Image generation screen with prompt input, style selection, generate button, and image preview

## Setup Instructions

1. Make sure Flutter is installed. Check with:

   ```
   flutter --version
   ```

2. Get the dependencies:

   ```
   flutter pub get
   ```

3. Run the app:

   ```
   flutter run
   ```

## Folder Structure

```
lib/
  main.dart                          App entry point
  screens/
    login_screen.dart                Login with email and password validation
    home_screen.dart                 Welcome, search, styles, recent, create button
    image_generation_screen.dart     Prompt, style, generate, image preview
assets/
  images/
    treez_enterprise_logo.jpeg       Logo and placeholder image
```

## Login

- Email must contain `@` and `.`
- Password must be at least 6 characters
