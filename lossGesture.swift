//
//  ContentView.swift
//  SwiftUIGesture2022
//
//  Created by Vikash on 2022/6/25.
//

import SwiftUI

struct ContentView: View {
    // 宣告一個布林值狀態變數，用來追蹤圖示是否被按下
    @State private var isPressed = false
    
    var body: some View {
        // 建立一個系統圖示（星星圓圈）
        Image(systemName: "star.circle.fill")
            // 設定圖示大小為 200
            .font(.system(size: 200))
            // 根據 isPressed 狀態設定縮放效果：按下時縮小到 0.5，未按下時保持原大小 1.0
            .scaleEffect(isPressed ? 0.5 : 1.0)
            // 設定圖示顏色為綠色
            .foregroundColor(.green)
            // 添加點擊手勢
            .gesture(
                TapGesture()
                    // 當點擊結束時執行的動作
                    .onEnded({ 
                        // 使用動畫效果切換 isPressed 狀態
                        withAnimation(.easeInOut){
                            self.isPressed.toggle()
                        }
                    }))
    }
}

// 預覽用的結構體
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
