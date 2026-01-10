# TrendingMovies - iOS App

An iOS application that displays trending movies and TV shows using The Movie Database (TMDb) API. The app follows the MVVM (Model-View-ViewModel) architecture pattern and demonstrates modern iOS development practices.

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
![Platform](https://img.shields.io/badge/Platform-iOS%2015.0+-lightgrey.svg)
![SwiftUI](https://img.shields.io/badge/UI-SwiftUI-blue.svg)
[![GitHub - shameem17](https://img.shields.io/badge/GitHub-shameem17-black?logo=github)](https://github.com/shameem17)

## 📱 Features

- Browse trending movies and TV shows of the day
- View detailed information about each movie/show
- Beautiful UI with movie posters and backdrop images
- Loading indicators for smooth user experience
- Star ratings display

- Navigation between list and detail views

## 🏗 Architecture

The project implements the **MVVM (Model-View-ViewModel)** architecture pattern, which provides clear separation of concerns and makes the codebase maintainable and testable.

### Architecture Components

```
┌─────────────┐
│    View     │ ←→ Binds to ViewModel through Observer pattern
└─────────────┘
      ↑
      │
┌─────────────┐
│  ViewModel  │ ←→ Contains business logic & data transformation
└─────────────┘
      ↑
      │
┌─────────────┐
│    Model    │ ←→ Data structures and API models
└─────────────┘
```

### Directory Structure

```
TrendingMovies/
├── App/
│   └── AppDelegate.swift           # App entry point
├── Classes/
│   └── Observer.swift              # Custom observer pattern implementation
├── Constants/
│   └── Constants.swift             # API endpoints and app constants
├── DataModel/
│   └── TrendingMovies.swift        # API response models
├── ErrorModel/
│   └── APIDataError.swift          # Error handling enums
├── Extensions/
│   ├── UIImageViewExtension.swift  # Image loading with Kingfisher
│   └── UIViewExtension.swift       # View styling utilities
├── Networking/
│   └── APIManager.swift            # Network layer using Alamofire
├── Resources/
│   └── Assets.xcassets/            # Images and colors
└── Screens/
    ├── Home/
    │   ├── Controllers/
    │   │   ├── HomeViewController.swift
    │   │   └── HomeTableViewExtension.swift
    │   ├── Model/
    │   │   └── HomeTableViewMovie.swift
    │   ├── View/
    │   │   ├── HomeTableViewCell.swift
    │   │   └── HomeTableViewCell.xib
    │   └── ViewModel/
    │       └── HomeViewModel.swift
    └── Description/
        ├── Controllers/
        │   └── DetailsViewController.swift
        ├── Model/
        │   └── DetailsMovieModel.swift
        └── ViewModel/
```

## 🔧 Technical Implementation

### 1. Observer Pattern (Data Binding)

The app implements a custom **Observer** class for reactive data binding between ViewModels and Views:

```swift
class Observer<T> {
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }

    func binding(_ listener: @escaping ((T?) -> Void)) {
        listener(value)
        self.listener = listener
    }
}
```

**Benefits:**

- Automatic UI updates when data changes
- Decouples View from ViewModel
- Thread-safe updates on main queue

### 2. Networking Layer

**APIManager** singleton handles all network requests:

- Uses **Alamofire** for HTTP networking
- Type-safe response handling with Codable
- Centralized error handling
- Completion handlers with Result type

**Implementation:**

```swift
APIManager.shared.getMovies { result in
    switch result {
    case .success(let movies):
        // Handle success
    case .failure(let error):
        // Handle error
    }
}
```

### 3. MVVM Components

#### Model Layer

- **TrendingMovies**: API response structure
- **Movie**: Individual movie/TV show data
- **HomeTableViewMovie**: Presentation model for table cells
- **DetailsMovieModel**: Presentation model for detail screen

#### ViewModel Layer

- **HomeViewModel**:
  - Manages movie list state
  - Provides data for table view
  - Handles API calls
  - Transforms API models to presentation models
  - Observable properties: `isLoading`, `trendingMovies`

#### View Layer

- **HomeViewController**: Displays trending movies list
- **HomeTableViewCell**: Custom table view cell with movie info
- **DetailsViewController**: Shows detailed movie information
- Uses XIB files for custom UI layouts

### 4. Image Loading

Utilizes **Kingfisher** library for efficient image loading:

```swift
extension UIImageView {
    func setImage(with urlString: String) {
        kf.indicatorType = .activity
        self.kf.setImage(with: url)
    }
}
```

**Features:**

- Automatic caching
- Loading indicators
- Asynchronous downloads
- Memory management

### 5. Error Handling

Enum-based error handling for type safety:

```swift
enum APIDataError: Error {
    case invalidUrl
    case invalidData
    case parsingError
    case invalidResponse
    case error(_ error: Error?)
}
```

## 📦 Dependencies

The project uses **CocoaPods** for dependency management:

### Installed Pods

1. **Alamofire**

   - Purpose: HTTP networking
   - Features: Request/response handling, JSON parsing
   - Version: Latest

2. **Kingfisher**
   - Purpose: Image downloading and caching
   - Features: Async image loading, caching, placeholders
   - Version: Latest

## 🚀 Getting Started

### Prerequisites

- Xcode 12.0 or later
- iOS 13.0 or later
- CocoaPods installed

### Installation

1. Clone the repository:

```bash
git clone <repository-url>
cd TrendingMovies
```

2. Install dependencies:

```bash
pod install
```

3. Open the workspace:

```bash
open TrendingMovies.xcworkspace
```

4. Build and run the project (⌘ + R)

## 🔑 API Configuration

The app uses **The Movie Database (TMDb) API**:

- **Base URL**: `https://api.themoviedb.org/3`
- **Endpoint**: `/trending/all/day`
- **Image Base URL**: `https://images.tmdb.org/t/p/w500`

**Note**: The API key is currently hardcoded in `Constants.swift`. For production, consider using:

- Environment variables
- Configuration files (not tracked in git)
- Secure key storage solutions

## 🎯 Key Features Implementation

### Data Binding Example

```swift
viewModel.isLoading.binding { [weak self] isLoading in
    guard let isLoading = isLoading, let self = self else { return }
    DispatchQueue.main.async {
        if isLoading {
            self.activityIndicator.startAnimating()
        } else {
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
    }
}
```

## 🧪 Testing

The project includes test targets:

- **TrendingMoviesTests**: Unit tests
- **TrendingMoviesUITests**: UI automation tests

## 📱 UI Components

### Home Screen

- UITableView with custom cells
- Activity indicator for loading states
- Navigation bar with title

### Custom Table Cell

- Movie poster/backdrop image
- Movie/show title
- Release date
- Rating displayed as stars (⭐)
- Language information
- Rounded corners and borders

### Details Screen

- Detailed movie information
- Programmatic UI with XIB

## 🔄 Data Flow

1. **User opens app** → HomeViewController loads
2. **ViewModel initiates API call** → `getMovieList()`
3. **APIManager fetches data** → Uses Alamofire
4. **Data parsed** → Codable models
5. **ViewModel updates observables** → Triggers binding
6. **View updates** → UI refreshes automatically

## 🎨 Customization

The app uses extensions for reusable UI styling:

- **UIViewExtension**: Border, corner radius, shadows
- **UIImageViewExtension**: Image loading from URLs

## 📝 Code Quality

### Best Practices Implemented

- ✅ MVVM architecture
- ✅ Separation of concerns
- ✅ Dependency injection
- ✅ Memory management (weak self references)
- ✅ Type-safe enums
- ✅ Protocol-oriented programming
- ✅ Reusable components
- ✅ Constants management
- ✅ Error handling

## 🤝 Contributing

1. Fork the project
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Open a pull request

## 📄 License

This project is created for educational purposes.

## 👤 Author

**Shameem**

- Created: January 25, 2024

## 🙏 Acknowledgments

- [The Movie Database (TMDb)](https://www.themoviedb.org/) for providing the API
- [Alamofire](https://github.com/Alamofire/Alamofire) for networking
- [Kingfisher](https://github.com/onevcat/Kingfisher) for image loading

## 📞 Support

For questions or support, please open an issue in the repository.

---

**Note**: This is a sample project demonstrating MVVM architecture in iOS development. The API key should be secured before production deployment.
