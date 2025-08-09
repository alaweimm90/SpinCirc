# SpinCirc: Spin Transport Circuit Framework

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![MATLAB](https://img.shields.io/badge/MATLAB-R2024b+-orange.svg)](https://www.mathworks.com/products/matlab.html)
[![Python](https://img.shields.io/badge/Python-3.9+-blue.svg)](https://www.python.org/)
[![Verilog-A](https://img.shields.io/badge/VerilogA-IEEE1800-green.svg)](https://en.wikipedia.org/wiki/Verilog-AMS)

Computational framework for spintronic device modeling using equivalent-circuit spin-transport methods.

## Features

Core functionality:
- **Spin Transport** — Drift-diffusion solver with 4×4 conductance matrix
- **Magnetization Dynamics** — LLG/LLGS integration with thermal noise
- **Device Models** — MTJs, spin valves, all-spin logic, multiferroic devices
- **Circuit Integration** — SPICE-compatible compact models
- **Material Database** — Properties for common spintronic materials

## Implementation

Based on *Alawein & Fariborzi, IEEE J-XCDC 2018* spin transport theory:

- **MATLAB Core** — Numerical solvers for coupled transport-magnetodynamics
- **Python Tools** — Data analysis and ML integration  
- **Verilog-A Models** — Compact models for circuit simulation
- **Validation** — Benchmarks against published experiments

## Device Models

**Magnetic Tunnel Junctions (MTJs)** — TMR calculation, bias dependence, switching
**Nonlocal Spin Valves** — Hanle precession measurements, temperature effects
**All-Spin Logic (ASL)** — Logic gates with process variation analysis
**Multiferroic Devices** — Voltage-controlled magnetic anisotropy

## Numerical Methods

**Transport Solvers** — 4×4 conductance matrix for F/N/F structures
**LLG Integration** — Multiple schemes (RK4, RK45, Dormand-Prince)
**Stochastic Effects** — Temperature-dependent properties, thermal noise
**Process Variation** — Monte Carlo analysis for device statistics

## Setup

### MATLAB
Requires R2024b+ with Signal Processing and Optimization toolboxes.
```matlab
addpath(genpath('matlab'));
berkeley();  % UC Berkeley plot theme
```

### Python
```bash
python -m venv spincirc-env
source spincirc-env/bin/activate
pip install -r python/requirements.txt
pip install -e .
```

### Verilog-A Models
Copy `.va` files to your simulator's model directory:
```bash
# Cadence Spectre
cp verilogA/models/*.va $SPECTRE_HOME/tools/spectre/etc/ahdl/
```

## Usage

```matlab
% Nonlocal spin valve simulation
device = NonlocalSpinValve();
device.setGeometry(2e-6, 100e-9, 10e-9);  % 2μm × 100nm × 10nm
device.setMaterials('NiFe', 'Cu');

% Hanle measurement at 100 µA
field_range = linspace(-50e-3, 50e-3, 101);
results = device.measureHanle(100e-6, field_range);

device.plotResults('save_figures', true);

% Extract fitted parameters
fprintf('λ_sf = %.1f nm\n', results.hanle_fit.lambda_sf*1e9);
fprintf('P = %.1f%%\n', results.hanle_fit.polarization*100);
```

## Directory Structure

```
SpinCirc/
├── matlab/                    # MATLAB core
│   ├── core/                  # Transport/LLG solvers
│   ├── devices/               # Device models
│   ├── tests/                 # Unit tests
│   └── validation/            # Literature benchmarks
├── python/                    # Analysis tools
│   ├── analysis/              # Data processing
│   ├── ml_tools/              # ML integration
│   └── visualization/         # Plotting utilities
├── verilogA/                  # SPICE models
│   ├── models/                # .va files
│   └── examples/              # Test circuits
├── examples/                  # Demo scripts
└── docs/                      # Documentation
```

## Testing

### MATLAB
```matlab
runtests('matlab/tests');
run('matlab/validation/basic_transport/transport_1D_diffusion.m');
```

### Python
```bash
pytest python/tests/ -v --cov=python
```

## Documentation

Sphinx-based docs in `docs/` folder:
```bash
cd docs && make html
open _build/html/index.html
```

## Plotting Theme

Berkeley styling with consistent colors and typography:
```matlab
berkeley();  % Apply UC Berkeley theme
```

## Citation

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

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

**Copyright © 2025 Dr. Meshal Alawein — All rights reserved.**

---

---

**Dr. Meshal Alawein**  
University of California, Berkeley  
📧 meshal@berkeley.edu
