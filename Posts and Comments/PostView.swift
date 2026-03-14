//
//  PostView.swift
//  Posts and Comments
//
//  Created by kalyan on 3/14/26.
//

import SwiftUI

struct PostView: View {
    var post: Post
    @State private var commentViewModel = CommentViewModel()
    var body: some View {
        ScrollView{
            VStack(alignment: .leading,spacing: 16){
                Section("Post Details"){
                    Divider()
                    Text(post.title)
                        .font(.title).bold()
                    Text(post.body)
                        .font(.subheadline)
                    Divider()
                }
                Text("Comments")
                    .font(.headline)
                
                
                if commentViewModel.isLoading{
                    ProgressView("Loading")
                } else if commentViewModel.comments.isEmpty{
                    ContentUnavailableView("No comments", systemImage: "bubble.left.and.bubble.right",description: Text("be the first one to add comments"))
                }else{
                    ForEach(commentViewModel.comments){comment in
                        Text(comment.name)
                            .font(.headline).bold()
                        Text(comment.email)
                            .font(.subheadline)
                        Text(comment.body)
                            .font(.caption)
                    }
                }
            }.padding()
    }.navigationTitle("Post").navigationBarTitleDisplayMode(.inline)
            .onAppear{
                Task{
                    await commentViewModel.fetchComments(for: post.id)
                }
            }
    }
}

#Preview {
    PostView(post: Post(id: 1, userId: 1, title: "sai", body: "RAVVA"))
}
