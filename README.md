# ECG_GUI – MATLAB-Based ECG Signal Analyzer

This MATLAB GUI application processes ECG signals to detect QRS complexes and calculate heart rate in real time. It is designed to work with data acquired from an ECG circuit or from saved signal files. The tool offers a simple interface for biomedical signal analysis and visualization.

---

## 🩺 Features

- **Real-Time ECG Plotting:** Visualizes the ECG waveform dynamically.
- **QRS Complex Detection:** Identifies R-peaks using signal processing techniques.
- **Heart Rate Calculation:** Computes beats per minute (BPM) based on detected QRS intervals.
- **Interactive GUI:** Easy-to-use interface with buttons to start/stop analysis and load signals.

---

## 📦 Requirements

- MATLAB (R2021a or newer recommended)
- Signal Processing Toolbox (for filtering and analysis)
- ECG signal (from a data file or real-time acquisition setup)

---

## 📁 File Structure

ECG_GUI/
├── ECG_GUI.m % Main script to launch the GUI
├── ECG_GUI.fig % GUI layout file
├── sample_data.mat % Example ECG signal data
└── functions/ % Custom functions for QRS detection, filtering, etc.


---

## ▶️ How to Use

1. **Launch the GUI**:  
   Open MATLAB, navigate to the `ECG_GUI` folder, and run:
   ```matlab
   ECG_GUI
