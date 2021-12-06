//
//  ContentView.swift
//  mattibou
//
//  Created by 西澤 耕平 on 2021/12/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            
            Image("")
            
            
            
            Text("マッチ棒")
                .font(.system(.largeTitle, design: .monospaced))
                .padding()
            
            
            Button(action: {
                
            }) {
                Text("タップしてスタート")
                    .font(.title)
                    
                }
            
        }
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
