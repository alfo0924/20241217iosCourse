
＃lossGesture.swift 

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
