//
//  DiceButton.swift
//  dice
//
//  Created by Mac on 2/22/23.
//

import SwiftUI

struct DiceButton: View {
    let n: Int
    let imgArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    var body: some View {
        
            Image(imgArray[n])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100, alignment: .center)
    }
}


struct DiceButton_Previews: PreviewProvider{
    static var previews: some View{
        DiceButton(n: 1)
    }
}
