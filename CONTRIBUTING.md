# Contributing to SpinCirc

🎉 **Thank you for your interest in contributing to SpinCirc!** 🎉

SpinCirc is an open-source framework for computational spintronics research, and we welcome contributions from researchers, students, and developers worldwide. This document provides guidelines for contributing to the project.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Types of Contributions](#types-of-contributions)
- [Development Setup](#development-setup)
- [Coding Standards](#coding-standards)
- [Testing Guidelines](#testing-guidelines)
- [Documentation](#documentation)
- [Submission Process](#submission-process)
- [Review Process](#review-process)
- [Recognition](#recognition)

## 📜 Code of Conduct

By participating in this project, you agree to abide by our [Code of Conduct](CODE_OF_CONDUCT.md). We are committed to making participation in this project a harassment-free experience for everyone.

## 🚀 Getting Started

### Prerequisites

- **MATLAB R2024b+** with required toolboxes
- **Python 3.9+** with NumPy, SciPy, Matplotlib
- **Git** for version control
- **GitHub account** for pull requests

### First Steps

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/your-username/SpinCirc.git
   cd SpinCirc
   ```
3. **Add upstream remote**:
   ```bash
   git remote add upstream https://github.com/alaweimm90/SpinCirc.git
   ```
4. **Set up development environment**:
   ```matlab
   % In MATLAB
   addpath(genpath('matlab'));
   berkeley(); % Apply Berkeley styling
   runtests('matlab/tests'); % Verify installation
   ```

## 🛠️ Types of Contributions

We welcome various types of contributions:

### 🐛 Bug Reports
- Use the [Bug Report template](.github/ISSUE_TEMPLATE/bug_report.md)
- Include MATLAB/Python version, operating system
- Provide minimal reproducible example
- Include error messages and stack traces

### ✨ Feature Requests
- Use the [Feature Request template](.github/ISSUE_TEMPLATE/feature_request.md)
- Describe the scientific motivation
- Provide literature references if applicable
- Consider implementation complexity

### 📝 Documentation
- Fix typos, improve clarity
- Add examples and tutorials
- Improve API documentation
- Translate documentation (future)

### 🧪 New Physics Models
- Implement new spintronic phenomena
- Add material parameter databases
- Create device models
- Validate against experimental data

### 🔧 Code Improvements
- Performance optimizations
- Code refactoring
- Enhanced error handling
- Better visualization tools

### 🧪 Test Cases
- Add validation examples
- Improve test coverage
- Benchmark against literature
- Edge case testing

## 💻 Development Setup

### Branch Strategy

We use **Git Flow** branching model:

- `main`: Stable release code
- `develop`: Development integration branch
- `feature/feature-name`: New feature development
- `bugfix/bug-description`: Bug fixes
- `hotfix/critical-fix`: Critical production fixes

### Creating a Feature Branch

```bash
# Update your fork
git checkout develop
git pull upstream develop

# Create feature branch
git checkout -b feature/your-feature-name

# Make your changes
# ...

# Commit with descriptive messages
git commit -m "Add quantum dot transport model

Implement Coulomb blockade effects and co-tunneling
processes for quantum dot spin transport.

- Add QuantumDotTransport class
- Implement master equation solver
- Add validation against literature
- Include temperature dependencies"
```

### Environment Setup

```bash
# Python virtual environment
python -m venv spincirc-dev
source spincirc-dev/bin/activate  # Linux/Mac
# spincirc-dev\Scripts\activate     # Windows

# Install development dependencies
pip install -r requirements-dev.txt

# Pre-commit hooks (optional but recommended)
pre-commit install
```

## 📏 Coding Standards

### MATLAB Code Style

#### Function Structure
```matlab
function [output1, output2] = functionName(input1, input2, varargin)
% FUNCTIONNAME - Brief description
%
% Detailed description explaining the physics and implementation.
%
% Inputs:
%   input1 - Description with units
%   input2 - Description with units
%   varargin - Optional parameters (see options below)
%
% Optional Parameters:
%   'Temperature' - Operating temperature (K) [default: 300]
%   'Method' - Solver method ('RK45', 'RK4') [default: 'RK45']
%
% Outputs:
%   output1 - Description with units
%   output2 - Description with units
%
% Example:
%   [m, t] = LLGSolver([1;0;0], @(t,m) [0;0;1], 0.01, 1.76e11, [0, 1e-9]);
%
% References:
%   [1] Author et al., "Title," Journal, vol, pp, year.
%
% Author: Your Name <email@domain.com>
% Copyright © 2025 Meshal Alawein — All rights reserved.
% License: MIT

    % Input validation
    validateattributes(input1, {'numeric'}, {'vector', 'finite'});
    
    % Parse optional arguments
    p = inputParser;
    addParameter(p, 'Temperature', 300, @(x) isnumeric(x) && x > 0);
    parse(p, varargin{:});
    
    % Implementation
    % ...
    
end
```

#### Naming Conventions
- **Functions**: `camelCase` (e.g., `calculateConductance`)
- **Variables**: `snake_case` or `camelCase` (be consistent)
- **Constants**: `UPPER_CASE` (e.g., `BOLTZMANN_CONSTANT`)
- **Classes**: `PascalCase` (e.g., `SpinTransportSolver`)

#### Code Quality
- Use meaningful variable names
- Add comments explaining physics, not obvious code
- Vectorize operations when possible
- Include input validation
- Handle edge cases gracefully
- Use Berkeley plotting style

### Python Code Style

We follow **PEP 8** with some modifications:

```python
def calculate_conductance(material_params: Dict[str, float], 
                         geometry: Tuple[float, float, float],
                         temperature: float = 300.0) -> np.ndarray:
    """
    Calculate 4x4 conductance matrix for spin transport.
    
    This function implements the conductance matrix formalism from
    Alawein & Fariborzi, IEEE J-XCDC 2018.
    
    Args:
        material_params: Dictionary with material properties
            - 'lambda_sf': Spin diffusion length (m)
            - 'rho': Resistivity (Ohm.m)
            - 'beta': Spin asymmetry parameter
        geometry: Tuple of (length, width, thickness) in meters
        temperature: Operating temperature in Kelvin
        
    Returns:
        4x4 conductance matrix (S)
        
    Raises:
        ValueError: If parameters are unphysical
        
    Example:
        >>> params = {'lambda_sf': 200e-9, 'rho': 100e-9, 'beta': 0.7}
        >>> geometry = (100e-9, 50e-9, 2e-9)
        >>> G = calculate_conductance(params, geometry)
        >>> print(f"Conductance matrix shape: {G.shape}")
        Conductance matrix shape: (4, 4)
    """
    # Validation
    if temperature <= 0:
        raise ValueError("Temperature must be positive")
        
    # Implementation
    # ...
    
    return conductance_matrix
```

#### Python Quality Tools

```bash
# Code formatting
black --line-length 88 python/

# Import sorting
isort python/

# Linting
flake8 python/

# Type checking
mypy python/
```

### Verilog-A Code Style

```verilog
// Use IEEE 1800-2017 standard
// Include comprehensive parameter validation
// Add detailed physics comments
// Use SI units with proper comments

module device_model(terminal1, terminal2);
    inout terminal1, terminal2;
    electrical terminal1, terminal2;
    
    // Parameters with physical bounds
    parameter real length = 100e-9 from (1e-9:1e-6);  // Device length (m)
    parameter real temperature = 300 from (4:1000);    // Temperature (K)
    
    analog begin
        // Physics implementation with detailed comments
        // ...
    end
endmodule
```

## 🧪 Testing Guidelines

### Test Requirements

All contributions must include appropriate tests:

#### MATLAB Tests
```matlab
classdef TestYourFeature < matlab.unittest.TestCase
    methods (Test)
        function testBasicFunctionality(testCase)
            % Test basic operation
            result = yourFunction(input);
            testCase.verifyEqual(result, expected, 'RelTol', 1e-6);
        end
        
        function testEdgeCases(testCase)
            % Test boundary conditions
            testCase.verifyError(@() yourFunction([]), 'MATLAB:expectedVector');
        end
        
        function testPhysicalConsistency(testCase)
            % Test physics constraints
            result = yourFunction(validInput);
            testCase.verifyGreaterThan(result.energy, 0, 'Energy must be positive');
        end
    end
end
```

#### Python Tests
```python
import pytest
import numpy as np
from numpy.testing import assert_allclose

def test_conductance_matrix_symmetry():
    """Test that conductance matrix is symmetric for passive systems"""
    G = calculate_conductance(material_params, geometry)
    assert_allclose(G, G.T, rtol=1e-10, err_msg="Matrix should be symmetric")

def test_current_conservation():
    """Test Kirchhoff's current law"""
    G = calculate_conductance(material_params, geometry)
    row_sums = np.sum(G, axis=1)
    assert_allclose(row_sums, 0, atol=1e-12, err_msg="Current not conserved")

@pytest.mark.parametrize("temperature", [77, 300, 400])
def test_temperature_dependence(temperature):
    """Test temperature-dependent behavior"""
    result = calculate_temperature_effect(temperature)
    assert result > 0, f"Result should be positive at T={temperature}K"
```

### Running Tests

```bash
# MATLAB tests
matlab -batch "runtests('matlab/tests')"

# Python tests
pytest python/tests/ -v --cov=python --cov-report=html

# Verilog-A compilation tests
cd verilogA && make test
```

### Test Coverage

- Aim for **>90% code coverage** for new code
- Test both **normal operation** and **edge cases**
- Include **physics validation** tests
- Test **error handling** and **input validation**

## 📚 Documentation

### Documentation Requirements

1. **Code Documentation**:
   - Comprehensive docstrings/comments
   - Physics explanations
   - Parameter descriptions with units
   - Usage examples
   - Literature references

2. **API Documentation**:
   - Auto-generated from docstrings
   - Keep docstrings up-to-date
   - Include type hints (Python)

3. **User Documentation**:
   - Update relevant sections
   - Add tutorials for new features
   - Include validation examples

### Documentation Style

- Use **clear, concise language**
- Explain the **physics context**
- Provide **working examples**
- Include **units** for all parameters
- Reference **relevant literature**
- Use **Berkeley plotting style** for figures

## 📤 Submission Process

### Before Submitting

1. **Sync with upstream**:
   ```bash
   git checkout develop
   git pull upstream develop
   git checkout feature/your-feature
   git rebase develop
   ```

2. **Run all tests**:
   ```bash
   # MATLAB
   matlab -batch "runtests('matlab/tests')"
   
   # Python
   pytest python/tests/
   
   # Style checks
   black --check python/
   flake8 python/
   ```

3. **Update documentation**:
   - Add/update docstrings
   - Update relevant README sections
   - Add examples if needed

4. **Self-review**:
   - Check code quality
   - Verify test coverage
   - Ensure physics correctness
   - Review commit messages

### Creating Pull Request

1. **Push your branch**:
   ```bash
   git push origin feature/your-feature
   ```

2. **Create Pull Request** on GitHub:
   - Use the provided PR template
   - Write descriptive title and summary
   - Reference related issues
   - Add reviewers if known
   - Select appropriate labels

3. **PR Description Template**:
   ```markdown
   ## Summary
   Brief description of changes and motivation.
   
   ## Physics Background
   Explain the physical phenomena being modeled.
   
   ## Changes Made
   - [ ] Added new transport solver
   - [ ] Updated material database
   - [ ] Added validation examples
   - [ ] Updated documentation
   
   ## Testing
   - [ ] All existing tests pass
   - [ ] New tests added with >90% coverage
   - [ ] Validated against literature/experiments
   
   ## References
   [1] Author et al., "Title," Journal, vol, pp, year.
   
   ## Screenshots/Plots
   (If applicable, using Berkeley style)
   ```

## 🔍 Review Process

### What We Look For

1. **Code Quality**:
   - Follows coding standards
   - Proper error handling
   - Efficient algorithms
   - Clear documentation

2. **Physics Correctness**:
   - Accurate implementation
   - Proper units and scaling
   - Validated against known results
   - Literature references

3. **Testing**:
   - Comprehensive test coverage
   - Edge cases handled
   - Physics validation included

4. **Documentation**:
   - Clear explanations
   - Working examples
   - Updated API docs

### Review Timeline

- **Initial response**: Within 48 hours
- **Detailed review**: Within 1 week
- **Follow-up reviews**: Within 2-3 days

### Addressing Review Comments

1. **Respond to all comments**
2. **Make requested changes** or explain why not
3. **Update tests** if needed
4. **Push updates** to the same branch
5. **Request re-review** when ready

## 🏆 Recognition

### Contributors

All contributors will be:
- **Listed** in CONTRIBUTORS.md
- **Acknowledged** in release notes
- **Invited** to co-author papers (for significant contributions)
- **Mentioned** in presentations and talks

### Types of Recognition

- **Code Contributors**: Implementation, bug fixes, optimizations
- **Scientific Contributors**: New physics models, validation
- **Documentation Contributors**: Tutorials, examples, translations
- **Community Contributors**: Issue reports, discussions, support

## 🤝 Getting Help

### Communication Channels

- **GitHub Issues**: Bug reports, feature requests
- **GitHub Discussions**: General questions, ideas
- **Email**: meshal@berkeley.edu (for sensitive issues)

### Development Discussions

- **Weekly meetings**: Virtual, open to all contributors
- **Slack workspace**: For real-time discussions
- **Mailing list**: For announcements and updates

### Mentorship

New contributors are welcome! We provide:
- **Onboarding assistance**
- **Code review mentorship**
- **Physics consultation**
- **Career guidance** (for students)

## 📋 Checklist for Contributors

Before submitting your contribution:

- [ ] **Code follows style guidelines**
- [ ] **All tests pass**
- [ ] **Documentation is updated**
- [ ] **Physics is validated**
- [ ] **Examples are provided**
- [ ] **Literature is referenced**
- [ ] **PR description is complete**
- [ ] **Commits have good messages**
- [ ] **No merge conflicts**
- [ ] **Ready for review**

---

## 💫 Thank You!

Your contributions help advance computational spintronics research worldwide. Every bug report, feature suggestion, code improvement, and documentation enhancement makes SpinCirc better for the entire research community.

**Together, we're building the future of spintronic device modeling!** 🚀

---

*For questions about contributing, please contact [meshal@berkeley.edu](mailto:meshal@berkeley.edu) or open a GitHub Discussion.*

<p align="center">
  <strong>Built with ❤️ at UC Berkeley</strong><br>
  <em>Advancing computational spintronics through collaboration</em>
</p>