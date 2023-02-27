//
//  DetailView.swift
//  hacker news api
//
//  Created by Mac on 2/23/23.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    
    var body: some View{
        WebView(urlString: url)
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}


