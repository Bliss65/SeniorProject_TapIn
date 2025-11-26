//
//  OrderMenuScreen.swift
//  TapIn
//
//  Created by Bliss Jungo on 11/19/25.
//


import SwiftUI

struct OrderMenuScreen: View {
    
    // MARK: - Colors used across all your screens
    let navy = Color(red: 10/255, green: 40/255, blue: 65/255)
    let lightGray = Color(red: 190/255, green: 198/255, blue: 207/255)
    let mediumGray = Color(red: 150/255, green: 160/255, blue: 170/255)
    let accentBlue = Color(red: 0/255, green: 122/255, blue: 255/255)
    let accentGreen = Color(red: 18/255, green: 168/255, blue: 57/255)
    let accentOrange = Color(red: 245/255, green: 138/255, blue: 43/255)

    var body: some View {
        ZStack {
            navy.ignoresSafeArea()
            
            VStack {
                header
                content
            }
        }
    }
    
    // MARK: - HEADER
    private var header: some View {
        HStack {
            Image(systemName: "arrow.left")
                .foregroundColor(.white)
                .font(.system(size: 28, weight: .regular))
                .padding(.leading, 40)
            
            Spacer()
            
            // Top-right orange blob
            RoundedRectangle(cornerRadius: 84)
                .fill(Color(red: 0.984, green:0.522, blue:0.000))
                .frame(width: 446.88, height: 460.5)
                .rotationEffect(.degrees(16.5))
                .offset(x: 150, y: -150)
        }
        .frame(height: 200)
    }
    
    
    // MARK: - MAIN CONTENT LAYOUT
    private var content: some View {
        HStack(spacing: 40) {
            leftPanel
            rightPanel
        }
        .padding(.horizontal, 40)
        .padding(.bottom, 40)
    }
    
    // MARK: - LEFT ORDER SUMMARY PANEL
    private var leftPanel: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            // Table header
            VStack(alignment: .leading, spacing: 4) {
                Text("Table 5")
                    .font(.system(size: 34, weight: .semibold))
                    .foregroundColor(.white)
                
                HStack(spacing: 10) {
                    Image(systemName: "person.fill")
                    Text("James Uzumaki")
                    Image(systemName: "person.2.fill")
                    Text("2 guests")
                }
                .font(.system(size: 18))
                .foregroundColor(.white.opacity(0.8))
            }
            .padding(.bottom, 10)
            
            Divider().background(Color.white.opacity(0.3))
            
            ScrollView {
                VStack(spacing: 25) {
                    orderItem(number: "1", name: "Diet Coke", price: "3.70")
                    orderItem(number: "2", name: "Cheese Burguer",
                              price: "30.50",
                              details: [
                                "Beef patty, Mozzarella, Lettuce, Tomatoes",
                                "2x Extra Mozzarella",
                                "1x Bacon",
                                "1x Caramelized Onions",
                                "2x eggs"
                              ])
                    orderItem(number: "5", name: "Fish Tacos",
                              price: "22.40",
                              details: [
                                "Flour tortilla, Cat Fish, Pico",
                                "1x Extra Guacamole"
                              ])
                }
            }
            
            
            // --- STATUS BUTTONS (right aligned, matches Pay bar layout) ---
                        HStack {
                            Spacer() // pushes buttons to the right
                            
                            // Each StatusButton has fixed width and height — no conflicting .infinity
                            StatusButton(title: "Hold", systemIcon: "pause.circle.fill", background: Color.red)
                            StatusButton(title: "Stay", systemIcon: "clock.fill", background: Color.yellow)
                            StatusButton(title: "Send", systemIcon: "paperplane.fill", background: Color.green)
                        }
                        .padding(.top, 10)
            
            

            // Bottom pricing + buttons
            VStack(alignment: .leading, spacing: 10) {
                lineItem("Subtotal", "$56.60")
                lineItem("Tax", "$8.40")
                lineItem("Discount", "-")
                
                HStack {
                    Spacer()
                    
                    // DISCOUNT BUTTON
                            Text("Discount")
                                .font(.system(size: 22, weight: .semibold))
                                .frame(width: 160, height: 60)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                    Text("Pay: $65.00")
                        .font(.system(size: 26, weight: .semibold))
                        .frame(width: 220, height: 60)
                        .background(accentBlue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.top, 10)
            }
        }
        .padding()
        .background(lightGray.opacity(0.18))
        .cornerRadius(20)
        .frame(width: 380)
    }

    // MARK: - ORDER ITEM COMPONENT
    private func orderItem(number: String, name: String, price: String, details: [String] = []) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Circle()
                    .fill(mediumGray)
                    .frame(width: 36, height: 36)
                    .overlay(Text(number).bold().foregroundColor(.white))
                
                Text(name)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("$\(price)")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.white)
            }
            
            if !details.isEmpty {
                VStack(alignment: .leading, spacing: 2) {
                    ForEach(details, id: \.self) { line in
                        Text(line)
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.7))
                    }
                }
                .padding(.leading, 50)
            }
        }
    }

    private func lineItem(_ label: String, _ value: String) -> some View {
        HStack {
            Text(label)
                .foregroundColor(.white)
            Spacer()
            Text(value)
                .foregroundColor(.white)
        }
        .font(.system(size: 20))
    }
    
    // MARK: - RIGHT PANEL → FOOD GRID
    private var rightPanel: some View {
        VStack(spacing: 30) {
            
            // Search bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                Text("Search")
                    .foregroundColor(.white.opacity(0.7))
                Spacer()
            }
            .padding()
            .background(lightGray.opacity(0.25))
            .cornerRadius(20)
            
            // Large category buttons
            HStack(spacing: 30) {
                categoryButton("FOOD")
                categoryButton("DRINKS")
                categoryButton("DESSERT")
            }
            
            // Grid
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 24), count: 3), spacing: 24) {
                categoryButton("Appetizers")
                categoryButton("Salads")
                categoryButton("Entrees")
                categoryButton("Sides")
                categoryButton("Desserts")
                categoryButton("Add Ons")
                
                // Remaining empty tiles
                ForEach(0..<6) { _ in
                    emptyTile
                }
            }
            
            Spacer()
        }
        .padding()
        .background(lightGray.opacity(0.18))
        .cornerRadius(20)
    }
    
    // MARK: - COMPONENTS
    private func categoryButton(_ title: String) -> some View {
        Text(title)
            .font(.system(size: 22, weight: .semibold))
            .foregroundColor(.black)
            .frame(height: 80)
            .frame(maxWidth: .infinity)
            .background(lightGray)
            .cornerRadius(16)
    }
    
    private var emptyTile: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(lightGray)
            .frame(height: 80)
    }
}
// MARK: — StatusButton view (explicit, fixed-size, error-free)
struct StatusButton: View {
    let title: String
    let systemIcon: String
    let background: Color
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: systemIcon)
                .font(.system(size: 20, weight: .semibold))
            
            Text(title)
                .font(.system(size: 18, weight: .semibold))
        }
        .foregroundColor(.white)
        .frame(width: 120, height: 60)     // fixed size to match Pay bar height
        .background(background)
        .cornerRadius(12)
    }
}
// MARK: - PREVIEW
#Preview {
    OrderMenuScreen()

}
