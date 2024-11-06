//
//  StudentPerformance.swift
//  StudentPerformance
//
//  Created by hariharan on 06/11/24.
//

import Foundation
import CoreML

struct StudentPerformance {
    let hoursStudied: Int64
    let previousScores: Int64
    let extracurricularActivities: Bool
    let sleepHours: Int64
    let questionPapersPracticed: Int64
    
    func calculatePerformanceIndex() -> Double {
        do {
            let model = try StudentPerformancePredictor(configuration: MLModelConfiguration())
            
            // Convert `Bool` to "Yes"/"No" String for model input
            let activitiesString = extracurricularActivities ? "Yes" : "No"
            
            let input = StudentPerformancePredictorInput(
                Hours_Studied: hoursStudied,
                Previous_Scores: previousScores,
                Extracurricular_Activities: activitiesString,
                Sleep_Hours: sleepHours,
                Sample_Question_Papers_Practiced: questionPapersPracticed
            )
            
            let prediction = try model.prediction(input: input)
            return prediction.Performance_Index
        } catch {
            print("Error in prediction: \(error)")
            return 0.0
        }
    }
}
