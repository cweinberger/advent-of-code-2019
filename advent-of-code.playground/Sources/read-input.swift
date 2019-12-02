import Foundation

public func readStringFromInputPath(_ inputPath: String) -> String? {
    guard
        let inputPath = Bundle.main.path(forResource: inputPath, ofType: "txt")
    else {
        print("File not found")
        return nil
    }

    let inputURL = URL(fileURLWithPath: inputPath)

    guard let content = try? String(contentsOf: inputURL) else {
        print("Could not load content")
        return nil
    }
    return content
}
