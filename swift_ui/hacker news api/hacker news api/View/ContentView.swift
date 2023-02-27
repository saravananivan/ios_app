//
//  ContentView.swift
//  hacker news api
//
//  Created by Mac on 2/23/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManger = NetworkManager()
    
    var body: some View {
        NavigationView{
            ///Posts must be an identifiable protocol
            List(networkManger.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)){
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("Hacker News")
        }
        .onAppear(perform: {
            networkManger.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
