//
//  CommentViewModel.swift
//  Posts and Comments
//
//  Created by kalyan on 3/14/26.
//

import Foundation
import Observation

@Observable
class CommentViewModel{
    var comments: [Comments] = []
    var isLoading = false
    var errorMessage: String? = nil
    
    func fetchComments(for postId: Int) async{
        isLoading = true
        errorMessage = nil
       guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(postId)/comments")else {
            isLoading = false
            errorMessage = "Invalid url"
            return
        }
        
        let request = URLRequest(url: url)
        
        do{
            let(data,_) = try await URLSession.shared.data(for: request)
            
            comments = try JSONDecoder().decode([Comments].self, from: data)
        }catch{
            print("Error: \(error)")
            errorMessage = "Failed to Load Comments"
        }
        isLoading = false
    }
}
