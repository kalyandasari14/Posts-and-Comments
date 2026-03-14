//
//  CommentView.swift
//  Posts and Comments
//
//  Created by kalyan on 3/14/26.
//

import SwiftUI

struct CommentView: View {
    var comment: Comments
    var body: some View {
        VStack(spacing: 12){
            Form{
                Section("Comment Details"){
                    Text(comment.name)
                        .bold().font(.title)
                    Text(comment.email)
                        .font(.title2)
                    Text(comment.body)
                        .font(.title3)
                }
            }
        }.navigationTitle("Comment")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CommentView(comment: Comments(postId: 1, id: 1, name: "sidhui", email: "HSJShhah", body: "raju"))
}
