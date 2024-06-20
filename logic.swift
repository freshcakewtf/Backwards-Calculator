func generateSolution(for number: Int) -> String {
    let operations = ["+", "-", "*", "/"]
    let a = Int.random(in: 1..<number)
    let b = number - a
    let randomOperation = operations.randomElement()!
    
    switch randomOperation {
    case "+":
        return "\(a) + \(b)"
    case "-":
        return "\(a + b) - \(b)"
    case "*":
        if number % a == 0 {
            return "\(a) * \(number / a)"
        }
    case "/":
        if a % number == 0 {
            return "\(a) / \(a / number)"
        }
    default:
        break
    }
    
    return "\(number) + 0"
}
