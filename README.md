# 🚀 API Response Wrapper (Flutter)

A clean, reusable, and production-ready API Response Wrapper for Flutter that helps manage Loading, Success, Error, and Initial states in a structured way.

This project includes a complete demo screen, repository pattern, and generic API client, making it perfect for real-world apps, interviews, and Flutter library creation.

---

## ✨ Features

✅ Generic API response handling

⏳ Loading state management

✅ Success state with typed data

❌ Error handling with message & status code

🔁 Retry support

📦 Clean architecture (API → Repository → UI)

🧩 Easy to integrate with Provider / Bloc / Riverpod

🛠 Production-ready & interview-friendly

---

## ✨ Preview






https://github.com/user-attachments/assets/aa19bf68-5bb3-4be8-8ff1-fdb6749b4bd1




---

## ✨ Installation
Add this to your package's pubspec.yaml file:
```
dependencies:
  api_response_wrapper:
    path: ../api_response_wrapper

```
▶️ From GitHub
```
dependencies:
  api_response_wrapper:
    git:
      url: https://github.com/yourusername/api_response_wrapper.git
```
## Add package in yaml file 
```
dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.0

```
Then Run:
```
flutter pub get
```
## 📁 Folder Structure
```
lib/
 ├── api/
 │   ├── api_status.dart
 │   ├── api_response.dart
 │   └── api_client.dart
 ├── model/
 │   └── post_model.dart
 ├── repository/
 │   └── post_repository.dart
 ├── ui/
 │   └── post_demo_screen.dart
 └── main.dart

  ```
## 🚀 Usage (Demo App)

This example shows how an app developer can use API Response Wrapper to handle
Loading, Success, and Error states cleanly in UI.



1️⃣ Create Repository
```
final PostRepository repository = PostRepository();
```
2️⃣ Call API using Wrapper
```
ApiResponse<List<PostModel>> response =
    ApiResponse.initial();

Future<void> loadPosts() async {
  response = ApiResponse.loading();

  final result = await repository.fetchPosts();

  response = result;
}
```
3️⃣ Use in UI (Recommended Pattern)
```
Widget build(BuildContext context) {
  switch (response.status) {
    case ApiStatus.loading:
      return const Center(
        child: CircularProgressIndicator(),
      );

    case ApiStatus.error:
      return Center(
        child: Text(response.message ?? 'Error occurred'),
      );

    case ApiStatus.success:
      return ListView.builder(
        itemCount: response.data!.length,
        itemBuilder: (context, index) {
          final post = response.data![index];
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.body),
          );
        },
      );

    default:
      return const SizedBox();
  }
}
```
4️⃣ With Retry Button (Optional)
```
ElevatedButton(
  onPressed: loadPosts,
  child: const Text('Retry'),
);
```
## 📜 License
MIT License
```
Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
``` 
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
```
