# cheffresh [![Actions Status](https://github.com/FreshOver/cheffresh/workflows/Build%20and%20Test/badge.svg)](https://github.com/FreshOver/cheffresh/actions) <img src="https://img.shields.io/badge/made%20with-dart-blue.svg" alt="made with dart">

This project created as a part of #Hack20 - Online International Flutter Hackathon 2020

## Folder Structure

```bash
.
├── constants
│   └── enum
├── core
│   ├── models
│   ├── providers
│   ├── routing
│   └── services
└── ui
    ├── shared
    ├── views
    └── widgets
```

## Database structure
### User
```
Name: string
Picture: file
Phone: string
Address: string
Lat: double
Lng: double
added_food: array[food]
current_orders: array[orders]
prev_orders: array[orders]
```

### Food
```
Name: string
Picture: array[file]
Details: string
date_created: datetime
price: double
category: category
tags: array[tags]
```

### Order
```
date_created: datetime
food_item: food
seller: user
buyer: user
```

### Reviews
```
date_created: datetime
review_text: string
rating: 1-5
reviewer: user
reviewee: user
```

## Folder Structure explanation
 The lib folder is divided into three folders. Core, constants and ui. Constants just holds constants and enums. Core contains all the files associated with the logic. ui contains all the files associated with the ui. 

- Core is divided into four folders:
1. Models: Contains all the plain data models
2. Providers: Contains the classes that extend ChangeProvider that will handle actual business logic.
3. Services: Contains the classes that will handle actual business logic.
4. Routing: Contains the files that are related to routing including route observer that could be used in case of using a tracking service like Mixpanel.

- UI is divided into three folders:
1. Shared: Contains files used in multiple other UI files. Usually contains global functions that return widgets.
2. Views: Contains the files for the app views and view models
3. Widgets: Contains widget files that are too big to keep in the view files. Usually shared widgets that are classes extending stateless/stateful widgets.

## High Level Architecture Overview
**Please read before adding any code**
- Each view will have its own model that extends the ChangeNotifier.
- Notify listeners for a view will only be called when the View's state changes.
- Each view only has 2 states. Idle and Busy. Any other piece of UI contained in a view, that requires logic and state / UI updates will have its own model associated with it. This way the main view only paints when the main view state changes.
- Providers will NOT be passed in through app level global provider, unless it's required by more than 1 view in the app architecture (Users information).
- Models will ONLY request data from providers and reduce state from that data.
Providers will perform all the actual work. Api class will request and serialize data. The model will just call the function to do that. Authentication provider will use the Api to get the user details and track it. The model just calls the function and passes values to it.
- All our Models will work the same. We have a state property that tells us what UI layout to show in the view and when it's updated we want to call notifyListeners so we moved that into a BaseModel. It contains all the state related code.
Most of the views require their own model, they need to have a root widget Provider and a child Consumer that takes a build method. We added a BaseView that is generic that will do all this for us. 
- We want the architecture setup to easily support calling functions when a new view is shown without having to convert everything to a stateful widget. To achieve this we converted our BaseView into a stateful widget to use the onInit to pass our model back to use in a callback function that we can execute on. We'll store the model locally in the state and in the initState call we'll check if we have a callback.

## Adding another model

### Simple model

- Create a `<YOUR_MODEL>.dart` under `core/models/<YOUR_MODEL>/<YOUR_MODEL>.dart`
- Add your own custom getter values.
- Add a part file. Ex: `<YOUR_MODEL>.g.dart` above the class

### Serializable model

- Create a `<YOUR_MODEL>.dart` under `core/models/<YOUR_MODEL>/<YOUR_MODEL>.dart`
- Add your own custom getter values.
- Add a part file. Ex: `<YOUR_MODEL>.g.dart` above the class *(no need for this step if you will use the model as a serializer only)*
- Add `<YOUR_MODEL>` to the list in `@SerializersFor` class constructor found under `core/models/serializers.dart`

### After adding the model
- Run `flutter packages pub run build_runner build --delete-conflicting-outputs` to build your new model
- Run `dartdoc --exclude 'dart:async,dart:collection,dart:convert,dart:core,dart:developer,dart:ffi,dart:html,dart:io,dart:isolate,dart:js,dart:js_util,dart:math,dart:typed_data,dart:ui'` to generate new source code documentation for the project at <root>/doc/api

### Testing
- Add a unit test at `test/models/<YOUR_MODEL>/<YOUR_MODEL>.dart`

## Building ##
  - Run `flutter packages get` first to download the dependencies.
  - Run `flutter test` to execute tests.
  - Run `flutter run` to try it live on running emulator or usb connected device.
  - Run `flutter build apk` to generate APK file.
  - Run `flutter build ios` to package iOS app.
