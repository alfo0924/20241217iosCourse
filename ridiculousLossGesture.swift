//
//  ContentView.swift
//  SwiftUIGesture2022
//
//  Created by Vikash on 2022/6/25.
//

import SwiftUI

struct ContentView: View {
    // 宣告狀態變數
    @State private var isPressed = false
    @State private var currentColorIndex = 0
    @State private var rotation: Double = 0
    @State private var scale: CGFloat = 1.0
    
    // 定義顏色陣列
    let colors: [Color] = [.green, .blue, .red, .purple, .orange, .pink]
    
    var body: some View {
        ZStack {
            // 背景顏色
            colors[currentColorIndex]
                .ignoresSafeArea()
                .animation(.easeInOut, value: currentColorIndex)
            
            // 建立一個系統圖示（星星圓圈）
            Image(systemName: "star.circle.fill")
                .font(.system(size: 200))
                // 組合多個動畫效果
                .scaleEffect(isPressed ? 0.5 : scale)
                .rotationEffect(.degrees(rotation))
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                // 添加點擊手勢
                .gesture(
                    TapGesture()
                        .onEnded({
                            // 使用動畫效果
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0.5)) {
                                self.isPressed.toggle()
                                // 旋轉 360 度
                                self.rotation += 360
                                // 切換顏色索引
                                self.currentColorIndex = (self.currentColorIndex + 1) % self.colors.count
                                // 彈跳效果
                                self.scale = 1.5
                            }
                            
                            // 延遲後恢復原始大小
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0.5)) {
                                    self.scale = 1.0
                                }
                            }
                        })
                )
                // 添加懸浮效果
                .overlay(
                    Circle()
                        .stroke(Color.white.opacity(0.5), lineWidth: 2)
                        .scaleEffect(isPressed ? 1.5 : 1.0)
                        .opacity(isPressed ? 0 : 1)
                        .animation(.easeOut(duration: 0.5), value: isPressed)
                )
        }
    }
}

// 預覽用的結構體
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
