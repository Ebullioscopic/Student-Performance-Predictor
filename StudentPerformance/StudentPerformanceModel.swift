//
//  StudentPerformance.swift
//  StudentPerformance
//
//  Created by admin63 on 06/11/24.
//


import SwiftUI

// MARK: - Student Model with Prediction Function

struct StudentPerformance {
    var hoursStudied: Int
    var previousScores: Int
    var extracurricularActivities: Bool
    var sleepHours: Int
    var questionPapersPracticed: Int
    
    // Function to calculate performance index based on provided inputs
    func calculatePerformanceIndex() -> Double {
        var performanceIndex = Double(previousScores)
        
        // Weight factors for each input (customizable for a simple model)
        let studyFactor = 0.4
        let sleepFactor = 0.2
        let activityFactor = extracurricularActivities ? 1.05 : 0.95
        let practiceFactor = 0.3
        
        performanceIndex += studyFactor * Double(hoursStudied)
        performanceIndex += sleepFactor * Double(sleepHours)
        performanceIndex += practiceFactor * Double(questionPapersPracticed)
        performanceIndex *= activityFactor
        
        // Constrain performance index within realistic bounds
        return min(100.0, max(0.0, performanceIndex))
    }
}