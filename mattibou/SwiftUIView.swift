//
//  SwiftUIView.swift
//  mattibou
//
//  Created by 西澤 耕平 on 2021/12/05.
//

import SwiftUI

struct SwiftUIView: View {
    @ObservedObject var viewModel = ContentViewModel()
    var body: some View {
       
        VStack{
            Spacer()
            HStack{
                Spacer()
                Button(action: {
                    
                }) {
                    Text("A")
                        .font(.largeTitle)
                        
                }
                    Spacer()
                Button(action: {
                    
                }) {
                        Text("B")
                            .font(.largeTitle)
                    }
                    Spacer()
                
            }
            Spacer()
            HStack{
                Spacer()
                Button(action: {
                    
                }) {
                    Text("C")
                        .font(.largeTitle)
                }
                    Spacer()
                Button(action: {
                    
                }) {
                        Text("D")
                            .font(.largeTitle)
                    }
                    Spacer()
            }
            Spacer()
        }
    }
}



class ContentViewModel: ObservableObject {
    @Published var Anum = 1
    @Published var Bnum = 1
    @Published var Cnum = 1
    @Published var Dnum = 1
    
    
    
    func selectMn(){
        
    }
    
    func selecting(){
        
    }
    
    func selectAt(){
        
    }
    
    
}





struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
