# Student Performance Predictor

**Student Performance Predictor** is a SwiftUI app designed to predict a student's performance index based on several input factors. The app utilizes a CoreML model for making predictions, taking into account study habits, health factors, and exam preparation efforts. This project is a comprehensive guide to cloning, setting up, and running the app locally.

## Screenshot

<p align="center">
  <img src="https://github.com/Ebullioscopic/Student-Performance-Predictor/blob/main/images/image.png" alt="Screenshot" width="500"/>
</p>

## Table of Contents

1. [Overview](#overview)
2. [Features](#features)
3. [Tech Stack](#tech-stack)
4. [Installation and Setup](#installation-and-setup)
   - [1. Clone the Repository](#1-clone-the-repository)
   - [2. Open Project in Xcode](#2-open-project-in-xcode)
   - [3. Integrate the ML Model](#3-integrate-the-ml-model)
   - [4. Run the Project on Simulator or Device](#4-run-the-project-on-simulator-or-device)
5. [Detailed Code Structure](#detailed-code-structure)
   - [1. StudentPerformance Model](#1-studentperformance-model)
   - [2. CoreML Model Integration](#2-coreml-model-integration)
   - [3. ContentView](#3-contentview)
6. [Usage Guide](#usage-guide)
   - [Input Sections](#input-sections)
   - [Viewing Predicted Performance](#viewing-predicted-performance)
7. [Troubleshooting](#troubleshooting)
8. [License](#license)

---

## Overview

**Student Performance Predictor** is an intuitive iOS app that allows users to input various data points about a student, including study habits, health information, and preparation efforts, to predict their academic performance. The app’s prediction engine is powered by a machine learning model, utilizing CoreML to deliver real-time predictions based on custom inputs.

## Features

- **User-Friendly Input Forms**: Use sliders, steppers, and toggles for entering data.
- **Real-Time Performance Prediction**: Calculates a student's performance index based on user inputs.
- **CoreML Integration**: Seamlessly integrates with a CoreML model to enhance prediction accuracy.

## Tech Stack

- **SwiftUI**: For building a modern, responsive, and intuitive user interface.
- **CoreML**: To integrate and utilize a machine learning model for performance predictions.
- **Xcode**: Version 13.0 or later (required for SwiftUI and CoreML compatibility).

---

## Installation and Setup

Follow these steps to set up the **Student Performance Predictor** project locally.

### 1. Clone the Repository

First, clone the project repository to your local machine.

```bash
git clone https://github.com/Ebullioscopic/Student-Performance-Predictor.git
cd StudentPerformancePredictor
```

### 2. Open Project in Xcode

1. Open Xcode (13.0 or later).
2. Navigate to `File > Open`.
3. Select the `StudentPerformance.xcodeproj` file inside the cloned repository folder.

### 3. Integrate the ML Model

To use the CoreML model:
1. Add the `.mlmodel` file to the project by dragging it into the Xcode project navigator under the folder `Models`.
2. Ensure the model class is accessible within Swift by checking the "Create Class" option when importing.

### 4. Run the Project on Simulator or Device

1. Select a target device or simulator from the Xcode toolbar.
2. Click on the **Run** button or use the keyboard shortcut `Cmd + R` to build and launch the app.

---

## Detailed Code Structure

Here’s a breakdown of each component in the project:

### 1. `StudentPerformance` Model

The `StudentPerformance` struct captures all the relevant attributes (like hours studied, previous scores, extracurricular activities) and processes them through the CoreML model to generate the performance index prediction.

```swift
struct StudentPerformance {
    let hoursStudied: Int64
    let previousScores: Int64
    let extracurricularActivities: Bool
    let sleepHours: Int64
    let questionPapersPracticed: Int64
    
    func calculatePerformanceIndex() -> Double {
        // CoreML prediction logic here
    }
}
```

### 2. CoreML Model Integration

The CoreML model (`StudentPerformancePredictor.mlmodel`) predicts the performance index based on the input parameters. When adding this model to Xcode, the Swift class auto-generates to `StudentPerformancePredictor` (or similar, depending on the model name). In `StudentPerformance`, this model is initialized and used to generate predictions.

### 3. `ContentView`

The main interface of the app, `ContentView`, presents an organized form for input. It includes sliders, toggles, and steppers to allow intuitive input collection. The form has three main sections:

- **Study Habits**
- **Health and Activities**
- **Preparation**

Each section lets users specify details about study routines, sleep habits, and extracurricular activities, while a separate section displays the performance index prediction.

---

## Usage Guide

### Input Sections

The app interface is divided into clear sections for input collection.

1. **Study Habits**:
   - `Hours Studied`: Use a stepper to input the hours spent studying.
   - `Previous Scores`: Enter previous academic scores in an easy-to-use text field.
  
2. **Health and Activities**:
   - `Sleep Hours`: Use a slider to select the number of hours slept on average.
   - `Extracurricular Activities`: Toggle participation in extracurricular activities on or off.

3. **Preparation**:
   - `Question Papers Practiced`: Use a stepper to select the number of practice question papers completed.

### Viewing Predicted Performance

- Once all inputs are provided, the app displays the predicted performance index in real-time, showing the expected performance in an accessible format. The prediction appears at the bottom of the form, updated whenever the user adjusts input values.

---

## Troubleshooting

1. **Model Integration Errors**:
   - If the `.mlmodel` file isn’t recognized, ensure the file is in the project directory and listed under "Copy Bundle Resources" in the Xcode build phases.
   
2. **Xcode Compatibility**:
   - Ensure that Xcode is updated to version 13.0 or later to support SwiftUI and CoreML integration.

3. **Simulator Performance**:
   - For an optimized experience, use a recent iOS device or simulator. Certain iOS models may experience latency in CoreML-based predictions.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contributor

<table>
  <tr>
    <td align="center"><a href="https://github.com/Ebullioscopic"><img src="https://github.com/Ebullioscopic.png" width="100px;" alt=""/><br /><sub><b>Ebullioscopic</b></sub></a><br />Creator</td>
  </tr>
</table>