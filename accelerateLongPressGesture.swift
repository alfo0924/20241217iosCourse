import SwiftUI

struct ContentView: View {
    @State private var isPressed = false
    @State private var currentColorIndex = 0
    @State private var rotation: Double = 0
    @State private var scale: CGFloat = 1.0
    @State private var rotationSpeed: Double = 0
    @State private var isLongPressing = false
    
    let colors: [Color] = [.green, .blue, .red, .purple, .orange, .pink]
    
    var body: some View {
        ZStack {
            colors[currentColorIndex]
                .ignoresSafeArea()
                .animation(.easeInOut, value: currentColorIndex)
            
            Image(systemName: "star.circle.fill")
                .font(.system(size: 200))
                .scaleEffect(isPressed ? 0.5 : scale)
                .rotationEffect(.degrees(rotation))
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { _ in
                            if !self.isLongPressing {
                                self.isLongPressing = true
                                self.startAccelerating()
                            }
                        }
                        .onEnded { _ in
                            self.isLongPressing = false
                            self.startDecelerating()
                        }
                )
                .gesture(
                    TapGesture()
                        .onEnded {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0.5)) {
                                self.isPressed.toggle()
                                self.rotation += 360
                                self.currentColorIndex = (self.currentColorIndex + 1) % self.colors.count
                                self.scale = 1.5
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0.5)) {
                                    self.scale = 1.0
                                }
                            }
                        }
                )
                .overlay(
                    Circle()
                        .stroke(Color.white.opacity(0.5), lineWidth: 2)
                        .scaleEffect(isPressed ? 1.5 : 1.0)
                        .opacity(isPressed ? 0 : 1)
                        .animation(.easeOut(duration: 0.5), value: isPressed)
                )
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                self.updateRotation()
            }
        }
    }
    
    private func startAccelerating() {
        withAnimation(.easeIn(duration: 2)) {
            rotationSpeed = 1000
        }
    }
    
    private func startDecelerating() {
        withAnimation(.easeOut(duration: 5)) {
            rotationSpeed = 0
        }
    }
    
    private func updateRotation() {
        rotation += rotationSpeed * 0.01
        if rotation > 360 {
            rotation -= 360
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
