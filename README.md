#Giveaway App

## Overview

The SwiftUI Giveaway App is an iOS application built using SwiftUI and Combine. It showcases a collection of game giveaways from various platforms. The app features a horizontal scroll view for Epic Games giveaways and a vertical scroll view for other platform giveaways. Users can filter giveaways by platform, view giveaway details, and mark giveaways as liked.

## Features

- Display Epic Games giveaways in a horizontal scroll view with a 3D rotation effect.
- Display giveaways from other platforms in a vertical scroll view.
- Filter giveaways by platform.
- View detailed information about each giveaway.
- Mark giveaways as liked.

## Requirements

- iOS 16.0+
- Xcode 15.0+
- Swift 5.0+

## Installation

1. **Clone the repository:**
    ```bash
    git clone https://github.com/husseinkishk/GamerPower.git
    ```

2. **Open the project in Xcode:**
    ```bash
    open GiveawayApp.xcodeproj
    ```

3. **Install dependencies:**
    The project uses Swift Package Manager (SPM) to manage dependencies. Open the project in Xcode and go to `File > Swift Packages > Update to Latest Package Versions`.

4. **Build and run the project:**
    Select the target device and click on the `Run` button or use the shortcut `Cmd+R`.

## Usage

- Launch the app to see the main view displaying the giveaways.
- Scroll horizontally to see Epic Games giveaways.
- Scroll vertically to see giveaways from other platforms.
- Tap on platform names in the filter bar to filter giveaways.
- Tap on a giveaway card to view its details.
- In the detail view, mark a giveaway as liked by tapping the heart icon.

## Project Structure

- **Models:** Contains the `Giveaway` model and any other data models.
- **Views:** Contains SwiftUI views such as `HomeView`, `GiveawayCard`, and `GiveawayDetailView`.
- **ViewModels:** Contains the `HomeViewModel` for managing the state and data of the views.
- **Network:** Contains the `ApiClient` and `GamerPowerService` for network requests.
- **Helpers:** Contains utility files such as extensions and helper functions.

## Unit and UI Tests

The project includes unit and UI tests to ensure functionality and user experience.

- **Unit Tests:** Located in the `GiveawayAppTests` target.
    - Test the network layer with mock data.
    - Test the view models for proper data handling and state changes.

- **UI Tests:** Located in the `GiveawayAppUITests` target.
    - Test the user interface interactions, including navigation and element visibility.
    - Ensure the presence and behavior of elements in both the horizontal and vertical sections.

