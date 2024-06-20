import SwiftUI

struct ContentView: View {
    @State private var input: String = ""
    @State private var result: String = "0"
    
    let buttons: [[String]] = [
        ["C", "+/-", "%", "/"],
        ["7", "8", "9", "*"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
    ]
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(input)
                .font(.largeTitle)
                .padding()
            
            Text(result)
                .font(.largeTitle)
                .padding()
            
            ForEach(buttons, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            self.buttonTapped(button: button)
                        }) {
                            Text(button)
                                .font(.title)
                                .frame(width: self.buttonWidth(button: button), height: self.buttonHeight())
                                .background(button == "=" || button == "+" || button == "-" || button == "*" || button == "/" ? Color.green : Color.pink)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    func buttonTapped(button: String) {
        if button == "=" {
            if let num = Int(input) {
                result = generateSolution(for: num)
            }
        } else {
            input += button
        }
    }
    
    func buttonWidth(button: String) -> CGFloat {
        if button == "0" {
            return (UIScreen.main.bounds.width - 5 * 10) / 2
        }
        return (UIScreen.main.bounds.width - 5 * 10) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 10) / 4
    }
    
    func generateSolution(for number: Int) -> String {
        // Simple logic for demonstration; replace with more sophisticated logic as needed
        if number > 1 {
            return "\(number - 1) + 1"
        }
        return "\(number) + 0"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
