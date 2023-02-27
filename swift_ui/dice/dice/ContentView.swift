//
//  ContentView.swift
//  dice
//
//  Created by Mac on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    @State var leftDiceNumber: Int
    @State var rightDiceNumber: Int
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        VStack {
            Image("diceeLogo" )
            Spacer()
            HStack(alignment: .center, spacing: 50) {
                DiceButton(n: leftDiceNumber)
                DiceButton(n:rightDiceNumber)
            }
            .padding(.horizontal)
            Spacer()
            Button(action: {
                leftDiceNumber = Int.random(in: 0...5)
                rightDiceNumber = Int.random(in: 0...5)
            }){
                Text("Roll")
                    .font(.system(size:50))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.all)
            }
            .background(Color.red)
            .padding(.all)
        }.padding(.all
        )
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(leftDiceNumber: 1, rightDiceNumber: 1)
    }
}


