# SpinCirc: Advanced Spin Transport Circuit Framework

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![MATLAB](https://img.shields.io/badge/MATLAB-R2024b+-blue.svg)](https://www.mathworks.com/products/matlab.html)
[![Python](https://img.shields.io/badge/Python-3.9+-green.svg)](https://www.python.org/)
[![Tests](https://img.shields.io/badge/Tests-Passing-brightgreen.svg)](#testing-validation)

*A comprehensive cross-platform MATLAB/Python/Verilog-A scientific computing framework for computational spintronics and magnetodynamics — implemented in MATLAB, Python, and Verilog-A with Berkeley-themed visualization.*

**Core subject areas covered (fully implemented):**

- **Spintronics**: Spin transport, Giant magnetoresistance, Tunnel magnetoresistance
- **Magnetodynamics**: LLG/LLGS equations, Spin-transfer torque, Spin-orbit torque
- **Device Physics**: All-spin logic, Spin valves, Multiferroic devices, SOT devices
- **Circuit Modeling**: 4×4 conductance matrices, F/N/F heterostructures, Interface physics
- **Numerical Methods**: Adaptive integration, Parallel computing, Monte Carlo analysis
- **Visualization**: Berkeley color schemes, 3D trajectory plots, Publication-quality figures

**Author**: Dr. Meshal Alawein (meshal@berkeley.edu)  
**Institution**: University of California, Berkeley  
**License**: MIT License © 2025 Dr. Meshal Alawein — All rights reserved

---

## Project Overview

SpinCirc implements the equivalent-circuit spin-transport formalism from "Circuit Models for Spintronic Devices Subject to Electric and Magnetic Fields" (Alawein & Fariborzi, IEEE J-XCDC 2018). The framework provides cutting-edge computational tools for spintronic device modeling, featuring 4×4 conductance matrix formalism, time-dependent drift-diffusion solvers, and advanced magnetodynamics with LLG/LLGS integration.

<p align="center">
  <img src="docs/images/spincirc_overview.png" alt="SpinCirc Framework Overview" width="800"/>
</p>

## Quick Start

### Prerequisites
- **MATLAB R2024b+** with Signal Processing, Optimization, and Parallel Computing Toolboxes
- **Python 3.9+** with NumPy, SciPy, Matplotlib
- **Git** for version control

### Installation
```bash
# Clone the repository
git clone https://github.com/alaweimm90/SpinCirc.git
cd SpinCirc

# Start MATLAB and add to path
```

```matlab
% In MATLAB
addpath(genpath('matlab'));
berkeley();  % Apply Berkeley styling

% Run a quick test
runtests('matlab/tests');

% Try a simple example
example_transport_1D;
```

### Basic Usage
```matlab
% Create transport solver
solver = SpinTransportSolver();

% Set geometry (length, width, thickness)
solver.setGeometry(200e-9, 100e-9, 2e-9);

% Define F/N/F structure
materials = [MaterialsDB.CoFeB, MaterialsDB.Cu, MaterialsDB.CoFeB];
solver.setMaterials(materials);

% Set magnetization (parallel configuration)
magnetization = [1, 0, 0; 1, 0, 0];
solver.setMagnetization(magnetization);

% Apply boundary conditions and solve
bc_values = struct('node', [1, 3], 'voltage', [1, 0]);
solver.setBoundaryConditions('voltage', bc_values);
[V, I_s, info] = solver.solve('verbose', true);

% Plot results
solver.plotSolution('component', 'charge');
```

## Scientific Modules

### Core Transport Engine
- **SpinTransportSolver**: Master class for 4×4 conductance matrix calculations
- **ConductanceMatrix**: F/N/F interface physics and rotation matrices
- **MaterialsDB**: Comprehensive database with temperature dependencies

### Magnetodynamics Solvers
- **LLGSolver**: Advanced LLG dynamics with multiple integration schemes
- **LLGSSolver**: Self-consistent LLGS with spin-transfer torque coupling
- **Numerical methods**: RK4, RK45, Dormand-Prince, IMEX schemes

### Device Libraries
- **All-Spin Logic**: ASL inverters, NAND, NOR, XOR gates with optimization
- **Spin Valves**: Nonlocal spin valves, GMR, TMR devices
- **Multiferroic Devices**: Voltage-controlled magnetism and switching
- **SOT Devices**: Spin-orbit torque switching and characterization

### Visualization System
- **Berkeley Color Scheme**: Publication-quality plotting with UC Berkeley branding
- **3D Trajectory Plots**: Advanced magnetization dynamics visualization
- **Statistical Analysis**: Parameter sweeps, optimization, Monte Carlo

## Performance Benchmarks

- **Large-scale simulations**: GPU acceleration with CUDA support
- **Parallel computing**: MATLAB Parallel Computing Toolbox integration
- **Memory optimization**: Efficient algorithms for complex systems
- **Adaptive meshing**: Smart spatial discretization for accuracy

## Testing & Validation

SpinCirc includes comprehensive unit tests and validation examples:

```matlab
% Run all tests
results = runtests('matlab/tests', 'IncludeSubfolders', true);

% Generate detailed test report
results = runtests('matlab/tests', 'OutputDetail', 'Detailed');
```

**Test Coverage:**
- Conductance matrix properties and current conservation
- Energy conservation in magnetodynamics
- Material parameter validation and consistency
- Interface modeling accuracy
- Performance benchmarking and memory optimization

**Validation Examples (20+ examples):**
- Basic transport: 1D spin diffusion, Hanle precession, interface resistance
- Magnetodynamics: LLG precession, hysteresis loops, STT switching
- Advanced physics: SOT characterization, spin pumping, multiferroic switching
- Literature reproduction: ASL transient response, NLSV characteristics

## Documentation

Complete documentation is available:
- **API Reference**: Full MATLAB function documentation
- **Tutorial Notebooks**: Step-by-step examples in `examples/`
- **Theory Guide**: Mathematical formalism and implementation details
- **Device Examples**: Comprehensive validation and benchmarking

## Educational Examples

- **Quick Start Tutorial**: Basic spin transport and magnetization dynamics
- **Device Simulations**: All-spin logic, spin valves, multiferroic devices
- **Advanced Analysis**: Monte Carlo, parameter optimization, parallel computing
- **Literature Reproduction**: Key papers in computational spintronics

## Development

### Repository Structure
```
SpinCirc/
├── matlab/                     # Core MATLAB framework
│   ├── core/                   # Physics engines
│   │   ├── transport/          # 4×4 conductance matrices
│   │   ├── dynamics/           # LLG/LLGS solvers
│   │   ├── materials/          # Material databases
│   │   └── numerical/          # Numerical methods
│   ├── devices/                # Device implementations
│   ├── validation/             # 20+ validation examples
│   ├── style/                  # Berkeley plotting theme
│   └── tests/                  # Unit test suite
├── python/                     # Python analysis tools
├── verilogA/                   # SPICE compact models
├── docs/                       # Documentation
├── examples/                   # Tutorial notebooks
└── data/                       # Reference datasets
```

### Contributing
We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

```bash
# Fork and clone
git clone https://github.com/your-username/SpinCirc.git
cd SpinCirc

# Create feature branch
git checkout -b feature/new-device

# Make changes and test
matlab -batch "runtests('matlab/tests')"

# Submit pull request
```

## Citation

If you use SpinCirc in your research, please cite:

```bibtex
@article{alawein2018circuit,
  title={Circuit Models for Spintronic Devices Subject to Electric and Magnetic Fields},
  author={Alawein, Meshal and Fariborzi, Hamid},
  journal={IEEE Journal on Exploratory Solid-State Computational Devices and Circuits},
  volume={4},
  number={2},
  pages={76--85},
  year={2018},
  publisher={IEEE}
}

@software{spincirc2025,
  title={SpinCirc: Advanced Spin Transport Circuit Framework},
  author={Alawein, Dr. Meshal},
  year={2025},
  url={https://github.com/alaweimm90/SpinCirc},
  version={1.0.0}
}
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Connect & Collaborate

<div align="center">

<strong>Dr. Meshal Alawein</strong><br/>
<em>Principal Research Scientist</em><br/>
University of California, Berkeley

---

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

*Built with precision at UC Berkeley — Advancing the frontiers of computational spintronics*

<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/UC_Berkeley_wordmark_blue.svg/320px-UC_Berkeley_wordmark_blue.svg.png" alt="UC Berkeley" height="40"/>
</p>