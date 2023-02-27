//
//  NetworkManager.swift
//  hacker news api
//
//  Created by Mac on 2/23/23.
//

import Foundation

class NetworkManager: ObservableObject{
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, urlResponse, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do{
                            let json = try decoder.decode(Result.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = json.hits
                            }
                            
                        }
                        catch{
                            print(error)
                        }
                    }
                }else{
                    print(error!)
                }
            }
            
            task.resume()
        }
        
    }
}
