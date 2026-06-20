# AI-Based Fault Detection in Power Electronic Converters

## Overview

This project implements an Artificial Intelligence-based fault detection system for power electronic converters using MATLAB and Simulink. The system monitors voltage and current signals from DC-DC and DC-AC converters and automatically identifies fault conditions using machine learning techniques.

## Objectives

- Detect faults in power electronic converters.
- Perform condition monitoring using voltage and current measurements.
- Train machine learning models for automated fault classification.
- Improve reliability and maintenance planning.
- 
## Technologies Used

- MATLAB
- Simulink
- Google Colab
- Python
- Scikit-learn
- NumPy
- Pandas
- Matplotlib


## System Architecture

1. Converter simulation in Simulink.
2. Voltage and current signal acquisition.
3. Feature extraction and preprocessing.
4. Machine learning model training.
5. Fault classification and prediction.

## Dataset

The dataset contains:

- Output voltage measurements
- Output current measurements
- Normal operating conditions
- Fault conditions

## Machine Learning Models

Models evaluated:

- Decision Tree
- Support Vector Machine (SVM)
- Random Forest

## Results

| Metric | Value |
|----------|----------|
| Accuracy | 93.7 % |
| Precision | 89.2% |
| Recall | 87.43 % |

## Project Workflow

```text
Simulink Model
      ↓
Data Collection
      ↓
Feature Extraction
      ↓
Model Training
      ↓
Fault Detection
```

## Future Improvements

- Deep Learning-based fault diagnosis
- Real-time deployment on embedded systems
- Predictive maintenance integration

## Author

 A HARSHITH YADAV
