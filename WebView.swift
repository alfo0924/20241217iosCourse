//
//  ContentView.swift
//  WebView
//
//  Created by Vikash on 2021/11/23.
//

import SwiftUI

struct ContentView: View {
    // 宣告一個狀態變數，用來控制 WebView 的顯示與隱藏
    @State private var showWebView = false
    
    var body: some View {
        // 創建一個按鈕
        Button(action: {
            // 切換 showWebView 的狀態（true/false）
            showWebView.toggle()
        }) {
            // 按鈕的文字標籤
            Text("My First Web View")
        }
        // 當 showWebView 為 true 時，以 sheet 形式呈現 WebView
        .sheet(isPresented: $showWebView){
            // 載入逢甲大學網站
            WebView(url: URL(string: "https://www.fcu.edu.tw")!)
            // 下面這行是載入 S3 儲存桶中圖片的備選方案（目前被註解）
            //WebView(url: URL(string: "https://module-7-s3-vikash.s3.amazonaws.com/2021-11-19.png")!)
        }
    }
}

// 用於 Xcode 預覽的結構體
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
