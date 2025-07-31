---
title: "SpinCirc: Advanced Spin Transport Circuit Framework"
subtitle: "Comprehensive MATLAB/Python Framework for Computational Spintronics"
authors:
  - name: Dr. Meshal Alawein
    email: meshal@berkeley.edu
    affiliations:
      - University of California, Berkeley
      - Department of Electrical Engineering and Computer Sciences
kernelspec:
  display_name: MATLAB
  language: matlab
  name: matlab
execute:
  timeout: 300
  cache: true
---

# SpinCirc: Advanced Spin Transport Circuit Framework

```{note}
This is an executable document. All code cells can be run interactively to demonstrate the SpinCirc framework capabilities.
```

## Framework Overview

*A comprehensive cross-platform MATLAB/Python/Verilog-A scientific computing framework for computational spintronics and magnetodynamics — implemented in MATLAB, Python, and Verilog-A with Berkeley-themed visualization.*

### Core Subject Areas Covered

```{list-table} Scientific Domains
:header-rows: 1
:name: domains-table

* - Domain
  - Subfields
  - Implementation Status
* - **Spintronics**
  - Spin transport, GMR, TMR
  - ✅ Complete
* - **Magnetodynamics**
  - LLG/LLGS equations, STT, SOT
  - ✅ Complete  
* - **Device Physics**
  - ASL, Spin valves, Multiferroics
  - ✅ Complete
* - **Circuit Modeling**
  - 4×4 conductance matrices, F/N/F
  - ✅ Complete
* - **Numerical Methods**
  - Adaptive integration, Parallel computing
  - ✅ Complete
* - **Visualization**
  - Berkeley themes, 3D plots
  - ✅ Complete
```

```{margin}
**Author**: Dr. Meshal Alawein (meshal@berkeley.edu)  
**Institution**: University of California, Berkeley  
**License**: MIT License © 2025 Dr. Meshal Alawein — All rights reserved
```

---

## Interactive Setup

Let's start by setting up the SpinCirc framework in your MATLAB environment:

```{code-cell} matlab
:tags: [setup]

% Initialize SpinCirc framework
clear; clc; close all;

% Add SpinCirc to MATLAB path
fprintf('Setting up SpinCirc framework...\n');
addpath(genpath('matlab'));

% Apply Berkeley styling for publication-quality plots
berkeley();
fprintf('Berkeley plotting style applied.\n');

% Verify installation with quick test
fprintf('Running installation verification...\n');
test_results = runtests('matlab/tests/TestSpinTransport.m', 'Verbosity', 1);
if all([test_results.Passed])
    fprintf('✅ SpinCirc installation verified successfully!\n');
else
    fprintf('❌ Installation verification failed. Check dependencies.\n');
end
```

## Core Physics: Spin Transport Fundamentals

### 4×4 Conductance Matrix Theory

The SpinCirc framework implements the complete 4×4 conductance matrix formalism for F/N/F heterostructures:

```{math}
\begin{bmatrix}
I_{e\uparrow} \\
I_{e\downarrow} \\  
I_{h\uparrow} \\
I_{h\downarrow}
\end{bmatrix} = 
\begin{bmatrix}
G_{ee}^{\uparrow\uparrow} & G_{ee}^{\uparrow\downarrow} & G_{eh}^{\uparrow\uparrow} & G_{eh}^{\uparrow\downarrow} \\
G_{ee}^{\downarrow\uparrow} & G_{ee}^{\downarrow\downarrow} & G_{eh}^{\downarrow\uparrow} & G_{eh}^{\downarrow\downarrow} \\
G_{he}^{\uparrow\uparrow} & G_{he}^{\uparrow\downarrow} & G_{hh}^{\uparrow\uparrow} & G_{hh}^{\uparrow\downarrow} \\
G_{he}^{\downarrow\uparrow} & G_{he}^{\downarrow\downarrow} & G_{hh}^{\downarrow\uparrow} & G_{hh}^{\downarrow\downarrow}
\end{bmatrix}
\begin{bmatrix}
V_1 \\
V_1 \\
V_3 \\
V_3
\end{bmatrix}
```

Let's explore this with an interactive example:

```{code-cell} matlab
:tags: [physics-demo]

% Create a basic F/N/F spin transport solver
fprintf('=== Interactive Spin Transport Demo ===\n');

% Initialize the transport solver
solver = SpinTransportSolver();

% Define geometry: 200nm × 100nm × 2nm F/N/F structure
length = 200e-9;  % 200 nm
width = 100e-9;   % 100 nm  
thickness = 2e-9; % 2 nm
solver.setGeometry(length, width, thickness);

fprintf('Geometry set: %.0f nm × %.0f nm × %.0f nm\n', ...
        length*1e9, width*1e9, thickness*1e9);

% Define materials: CoFeB/Cu/CoFeB heterostructure
materials = [MaterialsDB.CoFeB, MaterialsDB.Cu, MaterialsDB.CoFeB];
solver.setMaterials(materials);

fprintf('Materials: %s/%s/%s heterostructure\n', ...
        materials(1).name, materials(2).name, materials(3).name);

% Set magnetization configuration (parallel)
magnetization = [1, 0, 0; 1, 0, 0];  % Both FMs along +x
solver.setMagnetization(magnetization);

fprintf('Magnetization: Parallel configuration ([1,0,0] || [1,0,0])\n');
```

```{code-cell} matlab
:tags: [transport-solve]

% Apply boundary conditions: 1V across the structure
bc_values = struct('node', [1, 3], 'voltage', [1, 0]);
solver.setBoundaryConditions('voltage', bc_values);

fprintf('Boundary conditions: 1V applied across F/N/F structure\n');

% Solve the transport equations
fprintf('Solving 4×4 conductance matrix system...\n');
tic;
[V, I_s, info] = solver.solve('verbose', false);
solve_time = toc;

fprintf('Solution completed in %.3f ms\n', solve_time*1000);
fprintf('Charge current: %.3e A\n', info.I_charge);
fprintf('Spin current: [%.3e, %.3e, %.3e] A\n', I_s(1), I_s(2), I_s(3));
fprintf('Magnetoresistance: %.2f%%\n', info.MR_ratio*100);
```

### Visualization: Berkeley-Themed Results

```{code-cell} matlab
:tags: [visualization]

% Create publication-quality visualization
fig = figure('Position', [100, 100, 1200, 400]);

% Plot charge potential
subplot(1,3,1);
solver.plotSolution('component', 'charge');
title('Charge Potential Distribution');
ylabel('Potential (V)');
xlabel('Position (nm)');

% Plot spin accumulation  
subplot(1,3,2);
solver.plotSolution('component', 'spin_x');
title('Spin Accumulation (x-component)');
ylabel('Spin Potential (V)');
xlabel('Position (nm)');

% Plot total current density
subplot(1,3,3);
solver.plotSolution('component', 'current_density');
title('Current Density Profile');
ylabel('Current Density (A/m²)');
xlabel('Position (nm)');

% Apply Berkeley styling
sgtitle('SpinCirc: F/N/F Heterostructure Transport Analysis', ...
        'FontSize', 16, 'FontWeight', 'bold');

% Save figure
saveBerkeleyFigure(fig, 'transport_demo', 'Format', 'png', 'DPI', 150);
fprintf('Figure saved as transport_demo.png\n');
```

## Advanced Physics: Magnetization Dynamics

### LLG Equation Implementation

The framework includes advanced solvers for the Landau-Lifshitz-Gilbert equation:

```{math}
\frac{d\mathbf{m}}{dt} = -\frac{\gamma}{1+\alpha^2} \left[ \mathbf{m} \times \mathbf{H}_{\text{eff}} + \alpha \mathbf{m} \times (\mathbf{m} \times \mathbf{H}_{\text{eff}}) \right]
```

```{code-cell} matlab
:tags: [magnetodynamics]

fprintf('=== Interactive Magnetization Dynamics Demo ===\n');

% Initial magnetization state
m0 = [1; 0; 0];  % Start along +x axis

% Define effective field: constant + AC component
H_applied = [0; 0; 1];        % 1 T along +z (easy axis)
H_ac_amplitude = 0.1;         % 0.1 T AC field
f_ac = 10e9;                  % 10 GHz frequency

% Time-dependent effective field
H_eff = @(t, m) H_applied + H_ac_amplitude * sin(2*pi*f_ac*t) * [1; 0; 0];

% Material parameters
alpha = 0.01;                 % Gilbert damping
gamma = 1.76e11;              % Gyromagnetic ratio (rad/s/T)

% Time span: 10 nanoseconds
tspan = [0, 10e-9];

fprintf('Solving LLG equation with parameters:\n');
fprintf('  Initial state: [%.1f, %.1f, %.1f]\n', m0(1), m0(2), m0(3));
fprintf('  Applied field: [%.1f, %.1f, %.1f] T\n', H_applied(1), H_applied(2), H_applied(3));
fprintf('  AC field: %.1f T at %.1f GHz\n', H_ac_amplitude, f_ac/1e9);
fprintf('  Damping: α = %.3f\n', alpha);
fprintf('  Time span: %.1f ns\n', tspan(2)*1e9);
```

```{code-cell} matlab
:tags: [llg-solve]

% Solve LLG equation with adaptive timestep
fprintf('Solving LLG dynamics...\n');
tic;
[m, t, llg_info] = LLGSolver(m0, H_eff, alpha, gamma, tspan, 'Verbose', false);
solve_time = toc;

fprintf('LLG solution completed in %.3f ms\n', solve_time*1000);
fprintf('Integration steps: %d\n', llg_info.steps_taken);
fprintf('Energy conservation error: %.2e\n', llg_info.energy_conservation);
fprintf('Magnitude conservation error: %.2e\n', llg_info.magnitude_conservation);
```

### 3D Magnetization Trajectory Visualization

```{code-cell} matlab
:tags: [3d-visualization]

% Create 3D trajectory plot
fig = figure('Position', [100, 100, 1000, 800]);

% Main 3D trajectory plot
subplot(2,2,[1,3]);
plot3(m(1,:), m(2,:), m(3,:), 'LineWidth', 2, 'Color', getBerkeleyColors('blue'));
hold on;

% Mark initial and final states
plot3(m(1,1), m(2,1), m(3,1), 'o', 'MarkerSize', 10, 'MarkerFaceColor', getBerkeleyColors('gold'), 'MarkerEdgeColor', 'k');
plot3(m(1,end), m(2,end), m(3,end), 's', 'MarkerSize', 10, 'MarkerFaceColor', getBerkeleyColors('rose'), 'MarkerEdgeColor', 'k');

% Draw unit sphere
[X, Y, Z] = sphere(50);
surf(X, Y, Z, 'FaceAlpha', 0.1, 'EdgeColor', 'none', 'FaceColor', [0.8, 0.8, 0.8]);

xlabel('m_x'); ylabel('m_y'); zlabel('m_z');
title('3D Magnetization Trajectory');
axis equal; grid on;
legend('Trajectory', 'Initial', 'Final', 'Unit Sphere', 'Location', 'best');

% Time series plots
subplot(2,2,2);
plot(t*1e9, m(1,:), 'r-', t*1e9, m(2,:), 'g-', t*1e9, m(3,:), 'b-', 'LineWidth', 1.5);
xlabel('Time (ns)'); ylabel('Magnetization');
title('Magnetization Components vs Time');
legend('m_x', 'm_y', 'm_z', 'Location', 'best');
grid on;

% Energy evolution
subplot(2,2,4);
energy = -0.5 * sum(m .* (H_applied * ones(1, length(t))), 1);
plot(t*1e9, energy, 'k-', 'LineWidth', 2);
xlabel('Time (ns)'); ylabel('Energy (J)');
title('System Energy Evolution');
grid on;

sgtitle('SpinCirc: LLG Magnetization Dynamics Analysis', ...
        'FontSize', 16, 'FontWeight', 'bold');

% Save figure
saveBerkeleyFigure(fig, 'magnetodynamics_demo', 'Format', 'png', 'DPI', 150);
fprintf('3D trajectory saved as magnetodynamics_demo.png\n');
```

## Device Libraries: All-Spin Logic Example

### ASL Inverter Implementation

```{code-cell} matlab
:tags: [device-demo]

fprintf('=== All-Spin Logic Inverter Demo ===\n');

% Create ASL inverter device
inverter = ASLInverter();

% Set device geometry (elliptical nanomagnet)
major_axis = 100e-9;  % 100 nm
minor_axis = 50e-9;   % 50 nm
thickness = 2e-9;     % 2 nm
inverter.setGeometry('elliptical', [major_axis, minor_axis, thickness]);

% Set material (CoFeB with optimized parameters)
inverter.setMaterial('CoFeB');

fprintf('ASL Inverter configured:\n');
fprintf('  Geometry: %.0f nm × %.0f nm × %.0f nm ellipse\n', ...
        major_axis*1e9, minor_axis*1e9, thickness*1e9);
fprintf('  Material: CoFeB\n');

% Define input current pulse
I_input = 1e-6;          % 1 μA input current
pulse_width = 2e-9;      % 2 ns pulse width
total_time = 10e-9;      % 10 ns total simulation

fprintf('  Input: %.1f μA, %.1f ns pulse\n', I_input*1e6, pulse_width*1e9);
```

```{code-cell} matlab
:tags: [asl-simulation]

% Run transient simulation
fprintf('Running ASL inverter transient simulation...\n');
tic;
results = inverter.simulate('transient', ...
    'input_current', I_input, ...
    'pulse_width', pulse_width, ...
    'time_span', [0, total_time], ...
    'verbose', false);
sim_time = toc;

fprintf('Simulation completed in %.3f ms\n', sim_time*1000);
fprintf('Switching achieved: %s\n', results.switching_achieved ? 'Yes' : 'No');
fprintf('Switching time: %.2f ns\n', results.switching_time*1e9);
fprintf('Energy consumption: %.2f fJ\n', results.energy_consumed*1e15);
```

### ASL Performance Visualization

```{code-cell} matlab
:tags: [asl-visualization]

% Visualize ASL inverter results
fig = figure('Position', [100, 100, 1200, 800]);

% Magnetization dynamics
subplot(2,3,[1,4]);
inverter.plotResults(results, 'magnetization_trajectory');
title('Magnetization Switching Trajectory');

% Input current profile
subplot(2,3,2);
inverter.plotResults(results, 'input_current');
title('Input Current Profile');
ylabel('Current (μA)');
xlabel('Time (ns)');

% Output voltage
subplot(2,3,3);
inverter.plotResults(results, 'output_voltage');
title('Output Voltage Response');
ylabel('Voltage (mV)');
xlabel('Time (ns)');

% Energy consumption
subplot(2,3,5);
inverter.plotResults(results, 'energy_evolution');
title('Energy Consumption');
ylabel('Energy (fJ)');
xlabel('Time (ns)');

% Switching probability
subplot(2,3,6);
inverter.plotResults(results, 'switching_probability');
title('Switching Probability');
ylabel('P(switch)');
xlabel('Current (μA)');

sgtitle('SpinCirc: All-Spin Logic Inverter Analysis', ...
        'FontSize', 16, 'FontWeight', 'bold');

% Save results
saveBerkeleyFigure(fig, 'asl_inverter_demo', 'Format', 'png', 'DPI', 150);
fprintf('ASL inverter analysis saved as asl_inverter_demo.png\n');
```

## Validation & Benchmarking

### Test Suite Execution

```{code-cell} matlab
:tags: [validation]

fprintf('=== SpinCirc Validation Suite ===\n');

% Run comprehensive test suite
fprintf('Executing comprehensive test suite...\n');
test_suite_start = tic;

% Core transport tests
fprintf('  Testing transport solvers...\n');
transport_tests = runtests('matlab/tests/TestSpinTransport.m', 'Verbosity', 0);

% Magnetodynamics tests  
fprintf('  Testing magnetodynamics solvers...\n');
dynamics_tests = runtests('matlab/tests/TestMagnetodynamics.m', 'Verbosity', 0);

% Materials database tests
fprintf('  Testing materials database...\n');
materials_tests = runtests('matlab/tests/TestMaterialsDB.m', 'Verbosity', 0);

% Berkeley plotting tests
fprintf('  Testing visualization system...\n');
plotting_tests = runtests('matlab/tests/TestBerkeleyPlots.m', 'Verbosity', 0);

test_suite_time = toc(test_suite_start);

% Compile results
all_tests = [transport_tests; dynamics_tests; materials_tests; plotting_tests];
passed_tests = sum([all_tests.Passed]);
total_tests = length(all_tests);

fprintf('\n=== Test Results Summary ===\n');
fprintf('Total tests: %d\n', total_tests);
fprintf('Passed: %d (%.1f%%)\n', passed_tests, (passed_tests/total_tests)*100);
fprintf('Failed: %d\n', total_tests - passed_tests);
fprintf('Execution time: %.2f seconds\n', test_suite_time);

if passed_tests == total_tests
    fprintf('🎉 All tests passed! SpinCirc is ready for scientific computing.\n');
else
    fprintf('⚠️  Some tests failed. Check individual test results for details.\n');
end
```

## Performance Benchmarking

```{code-cell} matlab
:tags: [benchmarks]

fprintf('=== Performance Benchmarks ===\n');

% Benchmark different system sizes
sizes = [10, 50, 100, 200, 500];
transport_times = zeros(size(sizes));
dynamics_times = zeros(size(sizes));

fprintf('Running performance benchmarks...\n');

for i = 1:length(sizes)
    n = sizes(i);
    fprintf('  Testing %dx%d system... ', n, n);
    
    % Transport benchmark
    tic;
    solver = SpinTransportSolver();
    solver.setGeometry(n*1e-9, n*1e-9, 2e-9);
    solver.setMaterials([MaterialsDB.CoFeB, MaterialsDB.Cu, MaterialsDB.CoFeB]);
    solver.setMagnetization([1, 0, 0; 1, 0, 0]);
    [~, ~, ~] = solver.solve('verbose', false);
    transport_times(i) = toc;
    
    % Dynamics benchmark  
    tic;
    m0 = [1; 0; 0];
    H_eff = @(t, m) [0; 0; 1];
    [~, ~, ~] = LLGSolver(m0, H_eff, 0.01, 1.76e11, [0, 1e-9], 'Verbose', false);
    dynamics_times(i) = toc;
    
    fprintf('Transport: %.3f ms, Dynamics: %.3f ms\n', ...
            transport_times(i)*1000, dynamics_times(i)*1000);
end

% Plot benchmark results
fig = figure('Position', [100, 100, 800, 400]);

subplot(1,2,1);
loglog(sizes, transport_times*1000, 'o-', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('System Size'); ylabel('Time (ms)');
title('Transport Solver Scaling');
grid on;

subplot(1,2,2);
semilogx(sizes, dynamics_times*1000, 's-', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('System Size'); ylabel('Time (ms)');
title('Dynamics Solver Performance');
grid on;

sgtitle('SpinCirc Performance Benchmarks', 'FontSize', 14, 'FontWeight', 'bold');
saveBerkeleyFigure(fig, 'performance_benchmarks', 'Format', 'png', 'DPI', 150);

fprintf('Performance benchmarks completed and saved.\n');
```

## Conclusion & Next Steps

This interactive notebook demonstrated the core capabilities of the SpinCirc framework:

```{note}
**Key Achievements Demonstrated:**
- ✅ 4×4 conductance matrix transport calculations
- ✅ Advanced LLG magnetization dynamics  
- ✅ All-spin logic device modeling
- ✅ Berkeley-themed scientific visualization
- ✅ Comprehensive validation and benchmarking
```

### Recommended Next Steps

1. **Explore Advanced Examples**: Check the `matlab/validation/` directory for specialized use cases
2. **Custom Device Development**: Use the device template system to implement new spintronic devices  
3. **Parameter Optimization**: Employ the built-in optimization tools for device design
4. **Parallel Computing**: Scale up simulations using MATLAB Parallel Computing Toolbox

### Educational Resources

- 📚 **[API Documentation](docs/api/)** - Complete function reference
- 🎓 **[Tutorial Collection](examples/)** - Step-by-step learning materials
- 🔬 **[Theory Guide](docs/theory/)** - Mathematical foundations
- 📊 **[Validation Suite](matlab/validation/)** - Benchmarking examples

---

<div align="center">

**Dr. Meshal Alawein**  
*Principal Research Scientist*  
University of California, Berkeley

📧 [meshal@berkeley.edu](mailto:meshal@berkeley.edu) | 🌐 [Website](https://malawein.com) | 🔬 [Research](https://simcore.dev)

</div>

*Made with love, and a deep respect for the struggle. For those still learning—from someone who still is. Science can be hard. This is my way of helping.* ⚛️

---

*Built with precision at UC Berkeley — Advancing the frontiers of computational spintronics*