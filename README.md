### Restaurant Roulette App

### 📌 Project Overview

**Restaurant Roulette** is a fun and interactive mobile application built with Flutter that helps users decide where to eat. Tired of endless debates about what to have for dinner? Simply open the app, spin the wheel, and let fate choose your next dining destination from a list of nearby restaurants.

The app leverages the **Yelp Fusion API** to fetch a list of restaurants based on the user's location, which are then displayed on a beautiful, animated spinning wheel.

### ✨ Features

  * **Location-Based Search:** Automatically fetches a list of restaurants near your current location.
  * **Interactive Roulette Wheel:** A visually appealing spinning wheel populated with local restaurant choices.
  * **Randomized Selection:** Spin the wheel to get a random, unbiased restaurant suggestion.
  * **Winning Restaurant Display:** Clearly shows the winning restaurant's name and image after the spin.
  * **Responsive UI:** Optimized for various screen sizes using `flutter_screenutil`.
  * **Robust State Management:** Manages data fetching, loading, and error states using `flutter_riverpod`.

### 🚀 Technologies Used

  * **Flutter:** The primary framework for building the cross-platform mobile application.
  * **Yelp Fusion API:** Used to retrieve comprehensive restaurant data.
  * `flutter_riverpod`: A powerful and modern state management solution for Flutter.
  * `flutter_fortune_wheel`: A community-driven package for creating the spinning wheel animation.
  * `flutter_screenutil`: A utility package for creating a responsive UI design.
  * `dio`: For making API calls to the Yelp API.

### ⚙️ Getting Started

Follow these steps to get the project up and running on your local machine.

#### 1\. Clone the Repository

```bash
git clone https://github.com/teederx/restaurant-roulette.git
cd restaurant-roulette
```

#### 2\. Get API Keys

This project relies on the **Yelp Fusion API**. You'll need to sign up for an account and obtain a free API key.

  * Go to the [Yelp Developers website](https://www.yelp.com/developers).
  * Sign in and create an app to get your **API Key (Bearer Token)**.

#### 3\. Configure API Key

For security, it's a best practice not to hardcode API keys. Create a configuration file to store your key.

  * Create a file named `.env` in the root of the project.
  * Add your API key to this file like so:
    ```
    YELP_API_KEY=YOUR_API_KEY_HERE
    ```
  * Update your project to read this key (you might need a package like `flutter_dotenv`).

Alternatively, you could create a file (e.g., `lib/constants/keys.dart`) and store your key there, but make sure to add this file to your `.gitignore`.

#### 4\. Install Dependencies

Once your API key is configured, install the necessary dependencies by running:

```bash
flutter pub get
```

#### 5\. Run the App

Connect a device or start an emulator and run the app from your terminal:

```bash
flutter run
```

### 🤝 Contributing

Contributions are always welcome\! If you find a bug or have a feature suggestion, please open an issue or submit a pull request.

### 📄 License
This project is licensed under the MIT License - see the LICENSE.md file for details.

### ✍️ Author

[teederx](https://www.google.com/search?q=https://github.com/teederx)
