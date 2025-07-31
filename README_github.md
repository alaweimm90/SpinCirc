# SpinCirc: Advanced Spin Transport Circuit Framework

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![MATLAB](https://img.shields.io/badge/MATLAB-R2024b+-blue.svg)](https://www.mathworks.com/products/matlab.html)
[![Python](https://img.shields.io/badge/Python-3.9+-green.svg)](https://www.python.org/)
[![Tests](https://img.shields.io/badge/Tests-Passing-brightgreen.svg)](#testing-validation)
[![GitHub issues](https://img.shields.io/github/issues/alaweimm90/SpinCirc)](https://github.com/alaweimm90/SpinCirc/issues)
[![GitHub stars](https://img.shields.io/github/stars/alaweimm90/SpinCirc)](https://github.com/alaweimm90/SpinCirc/stargazers)

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

## 🚀 Quick Start

### Installation
```bash
git clone https://github.com/alaweimm90/SpinCirc.git
cd SpinCirc
```

### MATLAB Setup
```matlab
addpath(genpath('matlab'));
berkeley();  % Apply Berkeley styling
runtests('matlab/tests');  % Verify installation
```

### First Simulation
```matlab
solver = SpinTransportSolver();
solver.setGeometry(200e-9, 100e-9, 2e-9);
materials = [MaterialsDB.CoFeB, MaterialsDB.Cu, MaterialsDB.CoFeB];
solver.setMaterials(materials);
solver.setMagnetization([1, 0, 0; 1, 0, 0]);
[V, I_s] = solver.solve();
```

## 📚 Project Overview

SpinCirc implements the equivalent-circuit spin-transport formalism from ["Circuit Models for Spintronic Devices Subject to Electric and Magnetic Fields"](https://doi.org/10.1109/JXCDC.2018.2848670) (Alawein & Fariborzi, IEEE J-XCDC 2018). 

### Key Features
- **4×4 Conductance Matrix Formalism** for complete F/N/F heterostructure modeling
- **Advanced LLG/LLGS Solvers** with multiple integration schemes
- **Comprehensive Device Library** including ASL, spin valves, multiferroics
- **Berkeley-themed Visualization** for publication-quality figures
- **Extensive Validation Suite** with 20+ examples

## 🔬 Scientific Modules

| Module | Description | Files |
|--------|-------------|-------|
| **Transport** | 4×4 conductance matrices, F/N/F physics | [`SpinTransportSolver.m`](matlab/core/transport/SpinTransportSolver.m) |
| **Dynamics** | LLG/LLGS solvers, STT/SOT effects | [`LLGSolver.m`](matlab/core/dynamics/LLGSolver.m) |
| **Materials** | Temperature-dependent parameter database | [`MaterialsDB.m`](matlab/core/materials/MaterialsDB.m) |
| **Devices** | ASL, spin valves, multiferroics | [`devices/`](matlab/devices/) |
| **Validation** | 20+ benchmarks and examples | [`validation/`](matlab/validation/) |

## 🧪 Testing & Validation

![Tests](https://img.shields.io/badge/Tests-Passing-brightgreen.svg)

Run the test suite:
```matlab
% All tests
results = runtests('matlab/tests', 'IncludeSubfolders', true);

% Specific test class
results = runtests('TestSpinTransport');
```

**Validation Examples:**
- [Basic Transport](matlab/validation/basic_transport/) - 1D diffusion, Hanle precession
- [Magnetodynamics](matlab/validation/magnetodynamics/) - LLG conservation, hysteresis
- [Paper Figures](matlab/validation/paper_figures/) - Literature reproduction

## 📖 Documentation

- 📋 [API Reference](docs/api/) - Complete function documentation
- 🎓 [Tutorials](examples/) - Step-by-step examples
- 🔬 [Theory Guide](docs/theory/) - Mathematical formalism
- 📊 [Benchmarks](docs/benchmarks/) - Performance analysis

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md).

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 Citation

```bibtex
@software{spincirc2025,
  title={SpinCirc: Advanced Spin Transport Circuit Framework},
  author={Alawein, Dr. Meshal},
  year={2025},
  url={https://github.com/alaweimm90/SpinCirc},
  version={1.0.0}
}
```

## 📞 Support

- 🐛 [Issues](https://github.com/alaweimm90/SpinCirc/issues) - Bug reports and feature requests
- 💬 [Discussions](https://github.com/alaweimm90/SpinCirc/discussions) - Community discussions
- 📧 [Email](mailto:meshal@berkeley.edu) - Direct contact

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