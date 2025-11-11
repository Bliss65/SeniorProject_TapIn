import SwiftUI

struct TipScreenView: View {
    @State private var selectedTip: String? = nil
    
    var body: some View {
        ZStack {
            // Background color
            Color(red: 9/255, green: 34/255, blue: 58/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                // Back button
                HStack {
                    Button(action: {}) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                // Title and total
                VStack(spacing: 10) {
                    Text("Would you like to leave a tip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("Total: $65.00")
                        .font(.title3)
                        .foregroundColor(.white)
                }
                
                // Tip buttons
                VStack(spacing: 20) {
                    HStack(spacing: 20) {
                        TipOptionButton(label: "15%", amount: "$9.75", isSelected: selectedTip == "15%") {
                            selectedTip = "15%"
                        }
                        TipOptionButton(label: "18%", amount: "$11.70", isSelected: selectedTip == "18%") {
                            selectedTip = "18%"
                        }
                        TipOptionButton(label: "20%", amount: "$13.00", isSelected: selectedTip == "20%") {
                            selectedTip = "20%"
                        }
                    }
                    
                    HStack(spacing: 20) {
                        TipOptionButton(label: "Custom tip", amount: "", isSelected: selectedTip == "Custom tip") {
                            selectedTip = "Custom tip"
                        }
                        TipOptionButton(label: "No tip", amount: "", isSelected: selectedTip == "No tip") {
                            selectedTip = "No tip"
                        }
                    }
                }
                
                // Signature area
                VStack(spacing: 20) {
                    Text("Sign here")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.white.opacity(0.2))
                            .frame(height: 2)
                            .padding(.horizontal, 40)
                        
                        HStack {
                            Spacer()
                            Button(action: {}) {
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                            }
                            .padding(.trailing, 40)
                        }
                    }
                }
                .padding(.top, 40)
                
                // Legal text
                Text("I agree to pay the above amount according to my card agreement. Card ending in 0444. Reference code PcCqfTknsNmq. I understand my information will be processed pursuant to TapIn Privacy Statement and direct TapIn to share my information with the merchant.")
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 60)
                    .padding(.top, 10)
                
                Spacer()
                
                // Continue button
                Button(action: {}) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(12)
                        .padding(.horizontal, 80)
                }
                .padding(.bottom, 60)
            }
        }
    }
}

struct TipOptionButton: View {
    let label: String
    let amount: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 5) {
                Text(label)
                    .font(.title3)
                    .bold()
                if !amount.isEmpty {
                    Text(amount)
                        .font(.subheadline)
                }
            }
            .foregroundColor(.white)
            .frame(width: 180, height: 80)
            .background(isSelected ? Color.white.opacity(0.3) : Color.white.opacity(0.2))
            .cornerRadius(12)
        }
    }
}

#Preview {
    TipScreenView()
        .previewDevice("iPad Pro (13-inch) (M4)")
}
