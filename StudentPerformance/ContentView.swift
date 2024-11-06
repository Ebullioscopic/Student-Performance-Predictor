//
//  ContentView.swift
//  StudentPerformance
//
//  Created by hariharan on 06/11/24.
//


import SwiftUI

struct ContentView: View {
    @State private var hoursStudied: Int64 = 0
    @State private var previousScores: Int64 = 50
    @State private var extracurricularActivities: Bool = false
    @State private var sleepHours: Int64 = 8
    @State private var questionPapersPracticed: Int64 = 0
    
    // Computed performance index
    private var performanceIndex: Double {
        let student = StudentPerformance(
            hoursStudied: hoursStudied,
            previousScores: previousScores,
            extracurricularActivities: extracurricularActivities,
            sleepHours: sleepHours,
            questionPapersPracticed: questionPapersPracticed
        )
        return student.calculatePerformanceIndex()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Study Habits").font(.headline)) {
                    // Hours Studied Stepper
                    HStack {
                        Text("Hours Studied")
                        Spacer()
                        Stepper("\(hoursStudied)", value: $hoursStudied, in: 0...12)
                            .frame(maxWidth: 150)
                    }
                    
                    // Previous Scores Text Field
                    HStack {
                        Text("Previous Scores")
                        Spacer()
                        TextField("Previous Scores", value: $previousScores, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                    }
                }
                
                Section(header: Text("Health and Activities").font(.headline)) {
                    // Sleep Hours Slider
                    VStack(alignment: .leading) {
                        Text("Sleep Hours: \(sleepHours) hours")
                        Slider(value: Binding(
                            get: { Double(sleepHours) },
                            set: { sleepHours = Int64($0) }
                        ), in: 4.0...12.0, step: 1.0)
                    }
                    
                    // Extracurricular Activities Toggle
                    Toggle(isOn: $extracurricularActivities) {
                        Text("Participates in Extracurricular Activities")
                    }
                }
                
                Section(header: Text("Preparation").font(.headline)) {
                    // Question Papers Practiced Stepper
                    HStack {
                        Text("Question Papers Practiced")
                        Spacer()
                        Stepper("\(questionPapersPracticed)", value: $questionPapersPracticed, in: 0...20)
                            .frame(maxWidth: 150)
                    }
                }
                
                Section(header: Text("Predicted Performance").font(.headline)) {
                    // Performance Index Display
                    HStack {
                        Text("Performance Index")
                        Spacer()
                        Text(String(format: "%.2f", performanceIndex))
                            .font(.title3)
                            .bold()
                    }
                }
            }
            .navigationTitle("Student Performance")
        }
    }
}

#Preview {
    ContentView()
}
