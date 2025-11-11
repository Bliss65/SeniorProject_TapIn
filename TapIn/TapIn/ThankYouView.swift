import SwiftUI

struct ThankYouView: View {
    var body: some View {
        ZStack {
            // Background color
            Color(red: 15/255, green: 44/255, blue: 70/255)
                .edgesIgnoringSafeArea(.all)
            
            // Orange corner shape
            GeometryReader { geo in
                Path { path in
                    let width = geo.size.width
                    let height = geo.size.height
                    
                    path.move(to: CGPoint(x: width, y: 0))
                    path.addLine(to: CGPoint(x: width - 160, y: 0))
                    path.addLine(to: CGPoint(x: width, y: 120))
                    path.closeSubpath()
                }
                .fill(Color(red: 244/255, green: 123/255, blue: 32/255))
            }
            .edgesIgnoringSafeArea(.top)
            
            VStack(spacing: 32) {
                Spacer()
                
                VStack(spacing: 20) {
                    Text("Thank you!")
                        .font(.system(size: 64, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Text("$65.00")
                        .font(.system(size: 48, weight: .regular))
                        .foregroundColor(.white)
                }
                
                ZStack {
                    Circle()
                        .stroke(Color.green, lineWidth: 8)
                        .frame(width: 150, height: 150)
                    
                    Image(systemName: "checkmark")
                        .font(.system(size: 80, weight: .bold))
                        .foregroundColor(.green)
                }
                
                Text("We have received your payment")
                    .foregroundColor(.white.opacity(0.8))
                    .font(.system(size: 22))
                
                Spacer()
            }
            .padding(.bottom, 60)
            
            // Top left back arrow
            VStack {
                HStack {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .medium))
                        .padding(.leading, 40)
                    Spacer()
                }
                .padding(.top, 40)
                Spacer()
            }
            
            // Top right logout icon
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .medium))
                        .padding(.trailing, 40)
                        .padding(.top, 30)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ThankYouView()
}
