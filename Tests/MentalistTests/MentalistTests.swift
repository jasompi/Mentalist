import XCTest
import SwiftUI

@testable import Mentalist

final class MentalistTests: XCTestCase {
    func testCGImageAnalyze() throws {
        try Emotion.allCases.forEach { emotion in
            let image = try XCTUnwrap(UIImage(named: emotion.rawValue, in: .module, with: nil))
            let cgImage = try XCTUnwrap(image.cgImage)
            
            let result = try XCTUnwrap(Mentalist.analyze(cgImage: cgImage).first)
            XCTAssertEqual(result.dominantEmotion, emotion)
        }
    }
    
    func testUIImageAnalyze() throws {
        try Emotion.allCases.forEach { emotion in
            let uiImage = try XCTUnwrap(UIImage(named: emotion.rawValue, in: .module, with: nil))
            
            let result = try XCTUnwrap(Mentalist.analyze(uiImage: uiImage).first)
            XCTAssertEqual(result.dominantEmotion, emotion)
        }
    }
}