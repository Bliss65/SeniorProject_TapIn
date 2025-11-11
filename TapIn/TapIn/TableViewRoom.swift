import SwiftUI

struct TableViewRoom: View {
    var body: some View {
        ZStack {
            Color(.systemBlue).edgesIgnoringSafeArea(.all)

            VStack {
                // Top Navigation Bar
                HStack {
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Text("Main Room")
                        .font(.title2).bold()
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "arrow.right")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                
                Text("Table View")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom, 8)
                
                // Room Area
                ZStack {
                    Color(.systemTeal)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(.systemBlue), lineWidth: 3))
                        .padding(.horizontal)

                    // Tables Layout
                    GeometryReader { geometry in
                        let width = geometry.size.width
                        let height = geometry.size.height
                        
                        // Tables
                        Group {
                            TableView(label: "T1", shape: .square)
                                .position(x: width * 0.15, y: height * 0.15)
                            TableView(label: "T2", shape: .circle)
                                .position(x: width * 0.35, y: height * 0.15)
                            TableView(label: "T3", shape: .circle)
                                .position(x: width * 0.55, y: height * 0.15)
                            TableView(label: "T4", shape: .rectangle)
                                .position(x: width * 0.75, y: height * 0.15)
                            TableView(label: "T5", shape: .circle, color: .yellow)
                                .position(x: width * 0.9, y: height * 0.25)
                            TableView(label: "T6", shape: .square)
                                .position(x: width * 0.85, y: height * 0.45)
                            TableView(label: "T7", shape: .diamond)
                                .position(x: width * 0.8, y: height * 0.7)
                            TableView(label: "T8", shape: .circle)
                                .position(x: width * 0.65, y: height * 0.85)
                            TableView(label: "T9", shape: .circle)
                                .position(x: width * 0.45, y: height * 0.85)
                            TableView(label: "T10", shape: .rectangle)
                                .position(x: width * 0.25, y: height * 0.8)
                            TableView(label: "T11", shape: .diamond)
                                .position(x: width * 0.2, y: height * 0.4)
                            TableView(label: "T12", shape: .diamond)
                                .position(x: width * 0.45, y: height * 0.4)
                            TableView(label: "T13", shape: .diamond, color: .yellow)
                                .position(x: width * 0.5, y: height * 0.55)
                            TableView(label: "T14", shape: .diamond)
                                .position(x: width * 0.45, y: height * 0.25)
                            TableView(label: "T15", shape: .diamond)
                                .position(x: width * 0.55, y: height * 0.4)
                            TableView(label: "T16", shape: .square)
                                .position(x: width * 0.75, y: height * 0.45)
                        }
                    }
                }
                .frame(height: 500)
                .padding()
            }
        }
    }
}

enum TableShape {
    case square, circle, rectangle, diamond
}

struct TableView: View {
    let label: String
    let shape: TableShape
    var color: Color = .gray
    
    var body: some View {
        ZStack {
            switch shape {
            case .square:
                Rectangle()
                    .fill(color)
                    .frame(width: 70, height: 70)
            case .circle:
                Circle()
                    .fill(color)
                    .frame(width: 70, height: 70)
            case .rectangle:
                Rectangle()
                    .fill(color)
                    .frame(width: 120, height: 50)
            case .diamond:
                Rectangle()
                    .fill(color)
                    .frame(width: 70, height: 70)
                    .rotationEffect(.degrees(45))
            }
            Text(label)
                .foregroundColor(.black)
                .bold()
        }
    }
}

struct TableViewRoom_Previews: PreviewProvider {
    static var previews: some View {
        TableViewRoom()
            .previewDevice("iPad Pro (11-inch) (4th generation)")
    }
}
