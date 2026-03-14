//
//  ContentView.swift
//  Posts and Comments
//
//  Created by kalyan on 3/14/26.
//

import SwiftUI


struct ContentView: View {
    @State private var postViewModel = PostViewModel()
    var body: some View {
        NavigationStack{
            Group{
                if postViewModel.isLoading{
                    ProgressView("Loading")
                }else if let error = postViewModel.errorMessage{
                    VStack(spacing: 12){
                        Image(systemName: "wifi.slash")
                            .font(.largeTitle)
                            .foregroundStyle(.red)
                        Text(error)
                        
                        Button("retry"){
                            Task{await postViewModel.fetchPosts()}
                        }.buttonStyle(.automatic)
                    }
                }else if postViewModel.posts.isEmpty{
                    ContentUnavailableView(
                        "No Posts", systemImage: "person.slash"
                    )
                } else{
                    List{
                        ForEach(postViewModel.posts){post in
                            NavigationLink(value:post){
                                Text(post.title)
                                    .font(.headline)
                                
                            }
                        }
                    }.navigationDestination(for: Post.self){post in
                        PostView(post: post)
                    }
                }
            }.navigationTitle("Posts")
        }.onAppear{
            Task{await postViewModel.fetchPosts()}
        }
    }
}

#Preview{
    ContentView()
}
