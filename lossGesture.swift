//
//  ContentView.swift
//  SwiftUIGesture2022
//
//  Created by Vikash on 2022/6/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPressed = false
    
    var body: some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 200))
            .scaleEffect(isPressed ? 0.5 : 1.0)
            .foregroundColor(.green)
            .gesture(
                TapGesture()
                .onEnded({ 
                    withAnimation(.easeInOut){
                        self.isPressed.toggle()
                    }
                }))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
