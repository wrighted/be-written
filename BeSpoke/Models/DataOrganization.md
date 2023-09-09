## Data Organization Ideas

### Resources
[Firebase Cloud Firestone](https://firebase.google.com/docs/firestore)
- [Reference for using swift-firebase data store](https://firebase.google.com/docs/firestore/solutions/swift-codable-data-mapping#mapping_data)

### Models

#### User
```swift
struct User: Codable {
    var id: Int64
    var firstName: String
    var lastName: String
    var email: String
    var profileImage: URL
    var username: String
    var lastLogin: Double
    var accountCreated: Double
}
```

#### Note
```swift
struct Note: Codable, Identifiable {
    var id: Int64?
    var userId: Int64?
    var timestamp: Double
    var latitude: Double
    var longitude: Double
    var content: String
}
```
