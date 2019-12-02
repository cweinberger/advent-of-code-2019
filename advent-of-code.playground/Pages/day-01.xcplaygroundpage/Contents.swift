//: [Previous](@previous)

import Foundation

func readMassesFromString(_ input: String) -> [Int] {
    return input
        .split(separator: "\n")
        .compactMap { Int(String($0)) }
}

func calculateFuelRequirement(_ mass: Int) -> Int {
    return Int(floor(Double(mass)/3)) - 2
}

func calculateFuelRequirements(_ masses: [Int]) -> Int {
    return masses.reduce(into: 0) { result, mass in
        result += calculateFuelRequirement(mass)
    }
}

func calculateFuelRequirementPartTwo(_ mass: Int) -> Int {
    let fuelRequirement = max(0, calculateFuelRequirement(mass))
    if fuelRequirement > 0 {
        return fuelRequirement + calculateFuelRequirementPartTwo(fuelRequirement)
    } else {
        return fuelRequirement
    }
}

func calculateFuelRequirementsPartTwo(_ masses: [Int]) -> Int {
    return masses.reduce(into: 0) { result, mass in
        result += calculateFuelRequirementPartTwo(mass)
    }
}

// Part 1

// test
let test1Input = 100756
let test1ExpectedResult = 33583
let test1Result = calculateFuelRequirement(test1Input)
if test1Result != test1ExpectedResult {
    print("Error! Incorrect result: \(test1Result)")
}

if let input = readStringFromInputPath("input") {
    let masses = readMassesFromString(input)
    print("Part 1: ", calculateFuelRequirements(masses))
} else {
    print("could not read/calculate masses")
}

// Part 2
// test
let test2Input = 100756
let test2ExpectedResult = 50346
let test2Result = calculateFuelRequirementPartTwo(test2Input)
if test2Result != test2ExpectedResult {
    print("Error! Incorrect result: \(test2Result)")
}

if let input = readStringFromInputPath("input") {
    let masses = readMassesFromString(input)
    print("Part 2: ", calculateFuelRequirementsPartTwo(masses))
} else {
    print("could not read/calculate masses")
}


//: [Next](@next)
