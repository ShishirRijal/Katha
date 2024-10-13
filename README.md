# Katha: A Medium-like App in SwiftUI

**Katha** is a SwiftUI-based learning project inspired by [Medium.com](https://medium.com). This app will implement key features like registration, login, writing and formatting articles, role-based access for readers and authors, and the ability to mark favorite articles, all while using the **MVVM (Model-View-ViewModel)** architecture.

## Features

### 🌟 Core Features (MVP)
- 🔐 **Registration**: Users can create an account using their email and password.
- 🔑 **Login**: Registered users can log in to access the platform.
- ✍️ **Write Articles**: Authors can write articles, with full-featured markup, formatting, and previews.
- 📖 **Read Articles**: Users can browse and read published articles.
- 📝 **Roles (Author vs. Reader)**: Define roles to differentiate between article authors and readers.
- ⭐ **Mark as Favorite**: Allow users to mark their favorite articles.
- 💾 **Save Favorites to Local Storage**: Store users' favorite articles locally using CoreData.

### 🌐 Networking and Persistence
- 🔗 **Networking Layer**: Implement a robust networking layer to fetch and post data using **URLSession** or **Alamofire**.
- 🚫 **Offline Support**: Handle exceptions and show friendly error messages when the user is offline.
- 🗃️ **Persistence (Core Data)**: Save data locally to enable offline support and favorite articles storage.

## Architecture: MVVM
The project will follow the **MVVM** architecture, ensuring separation of concerns and maintainable code. Here's how each layer will function:

- **Model**: Data representation (Article, User, etc.).
- **View**: SwiftUI views that display data.
- **ViewModel**: The logic and data-binding layer that communicates between the view and the model.

<!---
## Best Coding Practices
- Use **Dependency Injection** for better code testability and maintainability.
- **Error Handling**: Gracefully handle networking and CoreData errors.
- **Local Storage**: Save user preferences and favorite articles using **CoreData**.
- **EnvironmentObject**: Manage global state for logged-in users, articles, etc., with SwiftUI's `@EnvironmentObject`.
- **Async Operations**: Perform async network operations and handle loading states.
-->

## Project Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/katha.git
   ```

2. **Install dependencies** (if using any package manager like **Cocoapods** or **SPM**):
   ```bash
   pod install
   ```

3. **Run the project**:
   Open `Katha.xcodeproj` in Xcode and hit **Cmd+R** to build and run the app.

## Milestones and Progress

### 1️⃣ User Authentication
- [x] **Auth Screen**: Design and build the UI for inital auth screen showing all forms of authentications.
- [x] **Registration Screen**: Design and build the UI for user registration.
- [x] **Login Screen**: Design and build the UI for login.

### 2️⃣ Article Management
- [ ] **Write Article Screen**: Create a markdown editor for articles.
- [ ] **Article Formatting**: Implement bold, italic, headings, lists, links, and other markdown-based formatting.
- [ ] **Read Article Screen**: Build the UI to read and display articles beautifully.

### 3️⃣ Roles and Access Control
- [ ] **Author Role**: Restrict the ability to write articles to users with an author role.
- [ ] **Reader Role**: Readers should only be able to read and mark articles as favorites.

### 4️⃣ Favorites and Persistence
- [ ] **Mark as Favorite**: Implement functionality to allow users to mark articles as favorite.
- [ ] **CoreData Integration**: Save favorite articles in local storage using CoreData.

### 5️⃣ Networking and Offline Support
- [ ] **Networking Layer**: Set up a networking layer to fetch, post, and update articles.
- [ ] **Offline Handling**: Display cached articles and handle no-internet conditions.

## Contributing
Feel free to fork the project, submit a pull request, or raise an issue to improve the app.

### Future Enhancements
- [ ] Implement **push notifications** to alert users about new articles or updates.
- [ ] Add **commenting and social features** for readers to interact with articles.
- [ ] Introduce **user profiles** and **author bios**.

  
### Technologies Used
- 🖼 **SwiftUI**: For building beautiful UIs.
- 💾 **CoreData**: For local persistence.
- 🌐 **URLSession** or 🛠 **Alamofire**: For networking.
- 🏗 **MVVM**: As the architecture pattern.

## Screenshots
<img width="749" alt="Screenshot 2024-10-04 at 10 41 23 AM" src="https://github.com/user-attachments/assets/9169d658-c302-4f0a-ad4f-cffa1b797646">
<img width="630" alt="Screenshot 2024-10-04 at 3 30 39 PM" src="https://github.com/user-attachments/assets/ded08b27-03f3-4bbf-848e-d0883153c0db">
<img width="629" alt="Screenshot 2024-10-04 at 3 31 42 PM" src="https://github.com/user-attachments/assets/823e19bf-07a4-4027-abe3-90913abb554e">
<img width="664" alt="Screenshot 2024-10-14 at 12 05 28 AM" src="https://github.com/user-attachments/assets/432b090b-605f-4ca3-a542-1781533a3248">

<img width="663" alt="Screenshot 2024-10-14 at 12 07 24 AM" src="https://github.com/user-attachments/assets/a1958d86-9903-413a-994f-65228c112b02">

<img width="661" alt="Screenshot 2024-10-14 at 12 08 20 AM" src="https://github.com/user-attachments/assets/9594f8b1-9527-42e1-920c-b907cfc76ea6">

<img width="339" alt="Screenshot 2024-10-14 at 12 10 20 AM" src="https://github.com/user-attachments/assets/0e2d2f98-689e-46fc-b595-7c00425a2f37">



## License
This project is licensed under the MIT License.
