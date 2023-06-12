# Flutter Mars Photo Viewer

This project is a simple Flutter app that fetches data from the NASA Mars Photos API and Firebase, and displays the images on the screen.

## Features

The application consists of three main screens:

1. **Login Screen**: The app uses Firebase's anonymous sign-in feature. As a user, when you launch the app, you will be automatically signed in anonymously. After successful sign-in, the app will navigate to the Home screen.

2. **Home Screen**: This screen displays a list of photos fetched from the NASA Mars Photos API. Each list item is a thumbnail of a photo taken by the Mars Curiosity Rover. Tapping on an item in the list navigates to a Details screen where you can view the full-sized image.

3. **Details Screen**: This screen displays the full-sized image.

## API

The app uses the following NASA Mars Photos API endpoint to fetch the data:

`https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY`

**Note:** The `DEMO_KEY` in the API endpoint is a placeholder and should be replaced with your actual API key.

## Running the Project

Before running the project, make sure you have Flutter installed and setup in your system. If you haven't, follow the instructions [here](https://flutter.dev/docs/get-started/install).

1. Clone this repository.
2. Navigate into the cloned directory.
3. Run `flutter pub get` to fetch the dependencies.
4. Make sure you have a device (physical or virtual) running.
5. Place a `config.json` file in the root of the project.
6. Run `flutter run --dart-define-from-file=config.json`.

Enjoy browsing photos from Mars!
