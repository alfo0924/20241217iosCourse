
# lossGesture.swift 

## 狀態管理

**@State 變數**
- 程式使用 `@State private var isPressed = false` 來宣告一個狀態變數。
- `@State` 是 SwiftUI 的屬性包裝器，用於在視圖中管理可變狀態。
- 當 `isPressed` 的值改變時，SwiftUI 會自動重新渲染相關的視圖部分。

## 視圖結構

**Image 視圖**
- 使用 `Image(systemName: "star.circle.fill")` 創建一個系統提供的星星圖示。
- `.font(.system(size: 200))` 設定圖示的大小。
- `.foregroundColor(.green)` 將圖示顏色設為綠色。

**動態縮放效果**
- `.scaleEffect(isPressed ? 0.5 : 1.0)` 使用三元運算符根據 `isPressed` 的狀態動態設定縮放比例。
- 當 `isPressed` 為 true 時，縮放到 0.5 倍；為 false 時，保持原大小。

## 手勢識別

**TapGesture**
- `.gesture(TapGesture().onEnded({ ... }))` 為圖示添加點擊手勢識別器。
- `onEnded` 閉包定義了當點擊結束時要執行的動作。

## 動畫效果

**withAnimation**
- `withAnimation(.easeInOut){ ... }` 將狀態變更包裝在動畫中。
- `.easeInOut` 指定了動畫的時間曲線，使動畫在開始和結束時較慢，中間較快。

## 狀態切換

**toggle() 方法**
- `self.isPressed.toggle()` 用於切換 `isPressed` 的布林值。
- 每次點擊都會在 true 和 false 之間切換。

## 程式執行流程

1. 初始狀態：`isPressed` 為 false，圖示顯示原始大小。
2. 用戶點擊圖示：
   - 觸發 `TapGesture` 的 `onEnded` 事件。
   - `withAnimation` 開始執行動畫效果。
   - `isPressed` 切換為 true。
3. 狀態更新：
   - SwiftUI 檢測到 `isPressed` 狀態變化。
   - 重新評估 `scaleEffect` 修飾符。
   - 圖示縮小到 0.5 倍大小，同時應用 easeInOut 動畫。
4. 再次點擊：
   - 重複步驟 2-3，但 `isPressed` 切換回 false。
   - 圖示恢復到原始大小。
  



# ridiculousLossGesture.swift


1. **背景顏色切換**：
   - 定義了一個顏色陣列
   - 每次點擊時循環切換背景顏色

2. **動畫效果**：
   - 使用 spring 動畫提供彈跳效果
   - 加入 360 度旋轉動畫
   - 點擊時的縮放效果更加誇張
   - 添加了陰影效果

3. **視覺效果**：
   - 圖示顏色改為白色，更容易與背景區分
   - 加入懸浮光暈效果
   - 添加陰影增加立體感

4. **互動回饋**：
   - 點擊時的縮放效果更加動態
   - 使用 spring 動畫提供更有趣的彈跳效果
   - 加入延遲恢復效果，使動畫更流暢

每次點擊圖示時，它會同時：
- 旋轉 360 度
- 改變背景顏色
- 產生縮放動畫
- 顯示光暈效果


## 狀態管理

程式使用了多個 `@State` 變數來管理視圖的動態狀態：

1. `isPressed`: 追蹤圖示是否被按下。
2. `currentColorIndex`: 控制當前背景顏色。
3. `rotation`: 管理圖示的旋轉角度。
4. `scale`: 控制圖示的縮放比例。

這些狀態變數的變化會觸發 SwiftUI 重新渲染相關視圖。

## 視圖結構

程式使用 `ZStack` 來疊加背景和前景元素：

1. **背景層**：
   - 使用 `colors[currentColorIndex]` 動態設置背景顏色。
   - `.ignoresSafeArea()` 確保顏色填滿整個螢幕。
   - `.animation(.easeInOut, value: currentColorIndex)` 在顏色變化時應用平滑過渡動畫。

2. **前景層**：
   - 使用 `Image(systemName: "star.circle.fill")` 創建一個系統圖示。
   - 應用多個修飾符來控制圖示的外觀和行為。

## 動畫效果

程式運用了多種動畫技術：

1. **Spring 動畫**：
   - 使用 `.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0.5)` 創建彈性動畫效果。
   - `response` 控制動畫速度，`dampingFraction` 控制彈性程度，`blendDuration` 控制動畫混合時間。

2. **旋轉動畫**：
   - `.rotationEffect(.degrees(rotation))` 根據 `rotation` 狀態變數旋轉圖示。

3. **縮放動畫**：
   - `.scaleEffect(isPressed ? 0.5 : scale)` 根據 `isPressed` 和 `scale` 狀態變數縮放圖示。

4. **延遲動畫**：
   - 使用 `DispatchQueue.main.asyncAfter` 延遲執行縮放恢復動畫，創造更流暢的視覺效果。

## 互動邏輯

程式使用 `TapGesture` 來處理用戶交互：

1. 當用戶點擊圖示時，`onEnded` 閉包被觸發。
2. 在閉包內，程式更新多個狀態變數：
   - 切換 `isPressed` 狀態。
   - 增加 `rotation` 值實現旋轉。
   - 更新 `currentColorIndex` 切換背景顏色。
   - 設置 `scale` 值創造彈跳效果。

## 視覺增強

1. **陰影效果**：
   - `.shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)` 為圖示添加陰影，增加深度感。

2. **懸浮效果**：
   - 使用 `.overlay` 添加一個半透明的圓形邊框。
   - 這個邊框會根據 `isPressed` 狀態改變大小和透明度，創造懸浮效果。

## 程式執行流程

1. 初始狀態：顯示初始顏色背景和原始大小的圖示。
2. 用戶點擊圖示：
   - 觸發 `TapGesture` 的 `onEnded` 事件。
   - 啟動 spring 動畫。
   - 更新所有狀態變數。
3. 動畫執行：
   - 圖示旋轉、縮放、改變顏色。
   - 背景顏色變化。
   - 懸浮效果動畫。
4. 動畫完成：
   - 延遲後，圖示縮放回原始大小。
5. 重複：每次點擊都重複這個過程，但使用不同的顏色。

# accelerateLongPressGesture.swift

1. **長按加速旋轉**：
   - 使用 `DragGesture(minimumDistance: 0)` 來檢測長按。
   - 當長按開始時，調用 `startAccelerating()` 函數。
   - `rotationSpeed` 變數控制旋轉速度。

2. **放開後減速**：
   - 當手指離開屏幕時，調用 `startDecelerating()` 函數。
   - 旋轉速度慢慢降低到零。

3. **持續旋轉更新**：
   - 在 `onAppear` 中設置一個計時器，每 0.01 秒調用 `updateRotation()` 一次。
   - `updateRotation()` 函數根據當前的 `rotationSpeed` 更新旋轉角度。

4. **平滑的加速和減速動畫**：
   - 使用 `.easeIn` 和 `.easeOut` 動畫來實現平滑的加速和減速效果。
  

# WebView.swift


## 基本結構

**核心元件**
- 這是一個 SwiftUI 視圖，使用 `struct ContentView: View` 定義。
- 主要功能是創建一個可以打開網頁視圖的按鈕介面。

## 狀態管理

**@State 變數**
```swift
@State private var showWebView = false
```
- 使用 `@State` 屬性包裝器來管理視圖的狀態。
- `showWebView` 是一個布林值，控制網頁視圖的顯示和隱藏。
- 當值改變時，SwiftUI 會自動重新渲染相關視圖。

## 視圖結構

**按鈕元件**
```swift
Button(action: {
    showWebView.toggle()
}) {
    Text("My First Web View")
}
```
- 創建一個標準的 SwiftUI 按鈕。
- `action` 閉包定義按鈕被點擊時的行為。
- `toggle()` 方法用於切換 `showWebView` 的布林值。
- 按鈕文字使用 `Text` 視圖顯示。

## 模態展示

**Sheet 修飾符**
```swift
.sheet(isPresented: $showWebView){
    WebView(url: URL(string: "https://www.fcu.edu.tw")!)
}
```
- `.sheet` 修飾符用於模態展示網頁視圖。
- `isPresented` 參數使用 `$` 語法綁定 `showWebView` 狀態。
- 當 `showWebView` 變為 true 時，sheet 會從底部滑上來。
- 使用者可以通過下滑關閉 sheet。

## WebView 整合

**URL 處理**
```swift
WebView(url: URL(string: "https://www.fcu.edu.tw")!)
```
- 創建一個自定義的 `WebView` 結構體實例。
- 使用 `URL` 初始化器處理網址字串。
- `!` 表示強制解包，假設 URL 一定有效。

## 程式執行流程

1. **初始狀態**：
   - 視圖載入時，`showWebView` 為 false。
   - 畫面上只顯示按鈕。

2. **用戶互動**：
   - 用戶點擊按鈕。
   - 觸發 `action` 閉包。
   - `showWebView.toggle()` 執行。

3. **狀態變化**：
   - `showWebView` 變為 true。
   - SwiftUI 檢測到狀態改變。
   - 觸發視圖更新。

4. **視圖更新**：
   - `.sheet` 修飾符檢測到 `showWebView` 為 true。
   - 模態視圖從底部滑入。
   - WebView 載入指定 URL 的內容。

5. **關閉流程**：
   - 用戶下滑關閉 sheet。
   - `showWebView` 自動設回 false。
   - 視圖回到初始狀態。

## 預覽支援

```swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
- 提供 Xcode 預覽功能支援。
- 允許在開發時即時預覽視圖外觀。
- 不影響實際執行時的功能。

## 註解程式碼
```swift
//WebView(url: URL(string: "https://module-7-s3-vikash.s3.amazonaws.com/2021-11-19.png")!)
```
- 提供了一個替代的 URL 配置。
- 當前被註解掉，不會執行。
- 展示了如何載入其他類型的網路資源。

