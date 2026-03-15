# Posts & Comments 📝

A SwiftUI app that fetches posts and their comments 
from a REST API, demonstrating real-world iOS networking patterns.

## Screenshots

￼
￼
## Features

- Browse a list of posts fetched from a live API
- Tap any post to see its full content
- Comments load dynamically per post
- Loading and error states on every screen
- Empty state handling

## Tech Stack
- SwiftUI
- async/await networking
- URLSession
- JSONDecoder with Decodable structs
- MVVM architecture
- Observable macro

## Architecture
```
PostViewModel    → fetches all posts
CommentViewModel → fetches comments for a specific post
ContentView      → displays post list
PostView         → displays post detail + comments
```

## API
Built using the free JSONPlaceholder API:
```
GET https://jsonplaceholder.typicode.com/posts
GET https://jsonplaceholder.typicode.com/posts/{id}/comments
```
No API key required.

## Requirements
- iOS 17+
- Xcode 15+

## How to Run
1. Clone the repo
2. Open the `.xcodeproj` file in Xcode
3. Hit Run — no setup needed
```

