# SpinCirc: Advanced Spin Transport Circuit Framework

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![MATLAB](https://img.shields.io/badge/MATLAB-R2024b+-orange.svg)](https://www.mathworks.com/products/matlab.html)
[![Python](https://img.shields.io/badge/Python-3.9+-blue.svg)](https://www.python.org/)
[![Verilog-A](https://img.shields.io/badge/VerilogA-IEEE1800-green.svg)](https://en.wikipedia.org/wiki/Verilog-AMS)

**A comprehensive computational framework implementing equivalent-circuit spin-transport formalism for advanced spintronic device modeling and simulation.**

## 🔬 Scope of Simulation

SpinCirc covers multiple domains of computational spintronics:
- **Spin Transport Physics** — Drift-diffusion equations with 4×4 conductance matrix formalism
- **Magnetization Dynamics** — LLG/LLGS integration with thermal fluctuations
- **Device Modeling** — MTJs, spin valves, all-spin logic, multiferroic devices
- **Circuit Integration** — SPICE-compatible compact models for system-level design
- **Material Physics** — Comprehensive database of spintronic materials and interfaces

## 📋 Overview

SpinCirc implements the theoretical framework from *Alawein & Fariborzi, IEEE J-XCDC 2018* for modeling spin transport in ferromagnetic/normal-metal heterostructures. The framework provides:

- **MATLAB Core Engine** — High-performance solvers for coupled transport-magnetodynamics
- **Python Analysis Tools** — Advanced data processing and machine learning integration  
- **Verilog-A Models** — Industry-standard compact models for circuit simulators
- **Validation Suite** — Extensive benchmarking against experimental literature

## ✨ Key Features

### Core Physics Models
- 4×4 conductance matrix formalism for F/N/F heterostructures
- Self-consistent spin transport + magnetization dynamics coupling
- Temperature-dependent material properties and stochastic effects
- Interface transmission probabilities and contact resistance modeling

### Device Library
- **Magnetic Tunnel Junctions (MTJs)** — TMR, bias dependence, switching dynamics
- **Nonlocal Spin Valves** — Hanle precession, temperature characterization
- **All-Spin Logic (ASL)** — Cascaded logic with process variation analysis
- **Multiferroic Devices** — Voltage-controlled magnetic anisotropy (VCMA)

### Numerical Methods
- Multiple LLG integration schemes (RK4, RK45, Dormand-Prince)
- Adaptive mesh refinement for transport solvers
- Parallel computing support and GPU acceleration
- Advanced Monte Carlo for process variation studies

## 🛠️ Installation

### MATLAB Requirements
```matlab
% Requires MATLAB R2024b+ with toolboxes:
% - Signal Processing Toolbox
% - Optimization Toolbox
% - Parallel Computing Toolbox (optional)

% Add SpinCirc to MATLAB path
addpath(genpath('matlab'));
berkeley();  % Apply UC Berkeley plotting theme
```

### Python Environment
```bash
# Create virtual environment
python -m venv spincirc-env
source spincirc-env/bin/activate  # Linux/Mac
# spincirc-env\Scripts\activate     # Windows

# Install dependencies
pip install -r python/requirements.txt
pip install -e .  # Install SpinCirc package
```

### Verilog-A Models
```bash
# For Cadence Spectre
cp verilogA/models/*.va $SPECTRE_HOME/tools/spectre/etc/ahdl/
# For other simulators, consult documentation
```

## 🚀 Usage Example

```matlab
% Quick start: Nonlocal spin valve simulation
device = NonlocalSpinValve();
device.setGeometry(2e-6, 100e-9, 10e-9);  % 2μm × 100nm × 10nm
device.setMaterials('NiFe', 'Cu');

% Hanle measurement
field_range = linspace(-50e-3, 50e-3, 101);  % ±50 mT
results = device.measureHanle(100e-6, field_range);

% Plot results with Berkeley styling
device.plotResults('save_figures', true);

% Extract spin diffusion parameters
fprintf('Spin diffusion length: %.1f nm\n', results.hanle_fit.lambda_sf*1e9);
fprintf('Contact polarization: %.1f%%\n', results.hanle_fit.polarization*100);
```

## 📁 Directory Structure

```
SpinCirc/
├── matlab/                    # MATLAB framework core
│   ├── core/                  # Transport solvers and LLG integration
│   ├── devices/               # Device model library
│   ├── style/                 # Berkeley plotting theme
│   ├── tests/                 # Unit tests and validation
│   └── validation/            # Literature benchmarking
├── python/                    # Python analysis ecosystem  
│   ├── analysis/              # Data processing and fitting
│   ├── ml_tools/              # Machine learning integration
│   └── visualization/         # Advanced plotting utilities
├── verilogA/                  # SPICE compact models
│   ├── models/                # Device compact models (.va)
│   └── examples/              # Testbench examples
├── examples/                  # Tutorial and demo scripts
├── docs/                      # Sphinx documentation
├── data/                      # Reference datasets
├── cadence/                   # Cadence integration tools
├── spice_examples/            # SPICE simulation examples
└── ci/                        # Continuous integration
```

## 🧪 Testing

### MATLAB Test Suite
```matlab
% Run complete test suite
runtests('matlab/tests');

% Run physics validation examples
run('matlab/validation/basic_transport/transport_1D_diffusion.m');
run('matlab/validation/magnetodynamics/llg_damped_precession.m');
```

### Python Testing
```bash
# Run pytest suite
pytest python/tests/ -v --cov=python

# Validate against reference data
python python/validation/benchmark_against_literature.py
```

## 📚 Documentation System

The `docs/` folder contains comprehensive Sphinx-based documentation:
- **API Reference** — Complete function and class documentation
- **Physics Background** — Theoretical foundation and equations
- **Tutorial Notebooks** — Step-by-step simulation guides  
- **Validation Reports** — Benchmarking against experimental literature
- **Developer Guide** — Contributing guidelines and code standards

Build documentation:
```bash
cd docs && make html
open _build/html/index.html
```

## 🎨 Visualization Standards

SpinCirc enforces professional scientific plotting standards:
- **Berkeley Blue** `#003262` for primary data series
- **California Gold** `#FDB515` for secondary/reference data  
- **Neutral Gray** `#888888` for auxiliary elements
- **Typography** — Times New Roman, inward ticks, clean grids
- **Export Formats** — High-resolution PDF and PNG to `plots/` directory

Apply Berkeley theme automatically:
```matlab
berkeley();  % Sets all plotting defaults
```

## 📚 Citation

If you use SpinCirc in your research, please cite:

```bibtex
@software{alawein2025spincirc,
  author = {Dr. Meshal Alawein},
  title = {SpinCirc: Advanced Spin Transport Circuit Framework},
  url = {https://github.com/alaweimm90/SpinCirc},
  year = {2025},
  institution = {University of California, Berkeley}
}

@article{alawein2018circuit,
  title={Circuit Models for Spintronic Devices Subject to Electric and Magnetic Fields},
  author={Alawein, Meshal and Fariborzi, Hamid},
  journal={IEEE Journal on Exploratory Solid-State Computational Devices and Circuits},
  volume={4},
  number={2},
  pages={76--85},
  year={2018},
  publisher={IEEE},
  doi={10.1109/JXCDC.2018.2848670}
}
```

## 🪪 License

This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.  
© 2025 Dr. Meshal Alawein – All rights reserved.

---

<div align="center">
<strong>Dr. Meshal Alawein</strong><br/>
<em>Computational Physicist & Research Scientist</em><br/>
University of California, Berkeley

📧 <a href="mailto:meshal@berkeley.edu" style="color:#003262;">meshal@berkeley.edu</a>

<a href="https://www.linkedin.com/in/meshal-alawein" title="LinkedIn">
  <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=flat&logo=linkedin&logoColor=white" alt="LinkedIn" height="32" />
</a>
<a href="https://github.com/alaweimm90" title="GitHub">
  <img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white" alt="GitHub" height="32" />
</a>
<a href="https://malawein.com" title="Website">
  <img src="https://img.shields.io/badge/Website-003262?style=flat&logo=googlechrome&logoColor=white" alt="Website" height="32" />
</a>
<a href="https://scholar.google.com/citations?user=IB_E6GQAAAAJ&hl=en" title="Google Scholar">
  <img src="https://img.shields.io/badge/Scholar-4285F4?style=flat&logo=googlescholar&logoColor=white" alt="Scholar" height="32" />
</a>
<a href="https://simcore.dev" title="SimCore">
  <img src="https://img.shields.io/badge/SimCore-FDB515?style=flat&logo=atom&logoColor=white" alt="SimCore" height="32" />
</a>
</div>

<p align="center"><em>
Made with love, and a deep respect for the struggle.<br/>
For those still learning—from someone who still is.<br/>
Science can be hard. This is my way of helping. ⚛️
</em></p>

---

Crafted with love, 🐻 energy, and zero sleep.