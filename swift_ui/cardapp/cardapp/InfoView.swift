//
//  InfoView.swift
//  cardapp
//
//  Created by Mac on 2/22/23.
//

import SwiftUI

struct InfoView: View {
    let txt: String
    let systemName: String
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .frame(height: 50)
            .foregroundColor(.white)
            .overlay(HStack {
                Image(systemName: systemName).foregroundColor(.green)
                Text(txt)
            })
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider{
    static var previews: some View{
        InfoView(txt: "+44 123 456 789", systemName: "phone.fill")
    }
}
