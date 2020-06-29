# cheffresh [![Actions Status](https://github.com/FreshOver/cheffresh/workflows/Build%20and%20Test/badge.svg)](https://github.com/FreshOver/cheffresh/actions) <img src="https://img.shields.io/badge/made%20with-dart-blue.svg" alt="made with dart">
This project was created as a part of #Hack20 - Online International Flutter Hackathon 2020

## [YouTube video](https://www.youtube.com/watch?v=zl8voaFNOcE)
[![Cheffresh video](https://img.youtube.com/vi/zl8voaFNOcE/0.jpg)](https://www.youtube.com/watch?v=zl8voaFNOcE)

Figma UI designs can be found [here](https://www.figma.com/file/zVom2lCrhgUfTJTTANT8f9/Cheffresh-for-Flutter-Hack-2020?node-id=0%3A1)

## Summary - 140 character limit
Home cooks can get back in business, safely and efficiently. They cook food in bulk, fresh for a collection time. Neighbours reserve food.

## Additional information (e.g. technologies used, motivation) - 500 character limit
Ever since we were plagued by Covid-19, we’ve seen some businesses and restaurants permanently close down while people lost their jobs. They're inefficient because they cook food on demand, are located in non-residential areas, and have idle staff most of the day. With Cheffresh, chefs can get back in business today, safely and efficiently from the comfort of their homes. We used Flutter and Firebase, and many plugins and packages available on pub.

## Motivation
During Covid, we’ve seen smaller businesses face a tougher time getting customers and are getting drowned by their bills. You might not see some of these restaurants after restrictions are eased. That’s a sad thing. There are economical reasons why these businesses are struggling:

- they cook food on demand instead of catering,
- they are located in non-residential areas and people are living at home, and
- they have idle staff waiting for customers during most of the day, having peak times only 2 or 3 times a day.

With Cheffresh, home cooks can run a business safely and efficiently. They cook food in bulk, fresh for a collection time. Neighbours reserve food. Cooks can measure demand for this meal, and cook only what is necessary, preventing food waste. They save time by cooking multiple meals at once. Finally, Covid is not transmittable through food and packaging, according to NCSU Professor of Food Safety Benjamin Chapman. Cheffresh helps customers stay within their neighbourhood instead of visiting high streets for food, but also get a little walking exercise. It also allows these smaller restaurant owners that have closed because of demand reasons to gradually get their business back up and running without unfurloughing staff or re-opening their high street stores.

## Folder Structure

Finally, Covid is not transmittable through food and packaging, according to NCSU Professor of Food Safety Benjamin Chapman. Cheffresh helps customers stay within their neighbourhood instead of visiting high streets for food, but also get a little walking exercise. It also allows these smaller restaurant owners that have closed because of demand reasons to gradually get their business back up and running without unfurloughing staff or re-opening their high street stores. 

## Folder Structure
```bash
.
├── core
│   ├── constants
│   ├── models
│   ├── providers
│   ├── routing
│   └── services
└── ui
    ├── shared
    ├── views
    └── widgets
```

## Folder Structure explanation
The lib folder is divided into two folders. Core and ui. Core contains all the files associated with the logic. ui contains all the files associated with the ui. 

- Core is divided into five folders:
1. models: Contains all the plain data models
2. providers: Contains the classes that extend ChangeProvider that will handle actual business logic
3. services: Contains the classes that will handle actual business logic
4. view_models: contains each a view model for each view
5. constants: holds constants and enums.

- UI is divided into three folders:
1. Shared: Contains files used in multiple other UI files. Usually contains global functions that return widgets.
2. Views: Contains the files for the app views
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

## Database Structure
### User
```
date_created: datetime
name: string
picture: file
phone: string
address: string
lat: double
lng: double
reservations: array{Reservation_ids}
reservations_created: array{Reservation_ids}
```

### Reservations
```
date_created: datetime
isFull: bool
totalCount: int
reservedCount: int
name: string
details: string
picture: array{images}
price: double
category: category_id => saved locally
tags: array{tag_id} => saved locally
created_by: {user}
review_snippets: array[4]{reviews}
```

### Review
```
date_created: datetime
created_by: {user}
created_for: {user}
review_text: string
rating: double (0-5)
```

## Adding another model

### Simple model

- Create a `<YOUR_MODEL>.dart` under `core/models/<YOUR_MODEL>/<YOUR_MODEL>.dart`
- Add your own custom getter values.
- Add a part file. Ex: `<YOUR_MODEL>.g.dart` above the class
- If it's a serializable model, add `<YOUR_MODEL>` to the list in `@SerializersFor` class constructor found under `core/models/serializers.dart`
- Run `flutter packages pub run build_runner build --delete-conflicting-outputs` to build your new model

### Testing
- Add a unit test at `test/models/<YOUR_MODEL>/<YOUR_MODEL>.dart`

## Building ##
  - Run `flutter packages get` first to download the dependencies.
  - Run `flutter test` to execute tests.
  - Run `flutter run` to try it live on running emulator or usb connected device.
  - Run `flutter build apk` to generate APK file.
  - Run `flutter build ios` to package iOS app.
