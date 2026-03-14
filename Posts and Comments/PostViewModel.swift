//
//  PostViewModel.swift
//  Posts and Comments
//
//  Created by kalyan on 3/14/26.
//

import Foundation
import Observation

@Observable
class PostViewModel{
    var posts: [Post] = []
    var isLoading = false
    var errorMessage: String? = nil
    
    func fetchPosts() async{
        isLoading = true
        errorMessage = nil
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else  {
            isLoading = false
            errorMessage = "Invalid Url"
            return
        }
        
        let request = URLRequest(url: url)
        
        do{
            let(data, _) = try await URLSession.shared.data(for: request)
            
            if let jsonString = String(data: data, encoding: .utf8){
                print("Raw Json: \(jsonString)")
            }
            
            posts = try JSONDecoder().decode([Post].self, from: data)
        }catch{
            print("Error: \(error)")
            isLoading = false
            errorMessage = nil
        }
        isLoading = false
    }
}
