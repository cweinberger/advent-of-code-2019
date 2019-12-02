import Foundation

func readMassesFromInputPath(_ inputPath: String) -> [Int] {
    guard
        let inputPath = Bundle.main.path(forResource: inputPath, ofType: "txt")
    else {
        print("File not found")
        return []
    }

    let inputURL = URL(fileURLWithPath: inputPath)

    guard let content = try? String(contentsOf: inputURL) else {
        print("Could not load content")
        return []
    }

    return content
        .split(separator: "\n")
        .compactMap { Int(String($0)) }
}

func calculateFuelRequirement(_ mass: Int) -> Int {
    return Int(floor(Double(mass)/3)) - 2
}

func calculateFuelRequirements(_ masses: [Int]) -> Int {
    return masses.reduce(into: 0) { result, requirement in
        result += calculateFuelRequirement(requirement)
    }
}

// test
let fuelRequirement = calculateFuelRequirement(100756)
if fuelRequirement != 33583 {
    print("Error! Incorrect result: \(fuelRequirement)")
}

let masses = readMassesFromInputPath("input")
print(calculateFuelRequirements(masses))
