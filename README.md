# Dynamic Conjugate Gradient Optimizer

This repository contains an implementation of the Conjugate Gradient (CG) optimization method, specifically designed to minimize a given 2D function using different step-size strategies. The optimization process visualizes the trajectory of the algorithm on a contour plot of the target function.

This code was developed as part of our Optimization course project at IASBS, in collaboration with my groupmate, [Erfan Faridi](https://github.com/erfanfaridii/).

## Features

- Implements Conjugate Gradient optimization.
- Supports dynamic learning rate strategies, including:
  - **SWC (Strong Wolfe Conditions)**
  - **GOLD (Golden Section Search)**
  - **BT (Backtracking Line Search)**
- Visualizes the optimization path on a 2D contour plot.
- Supports function customization.

## Getting Started

### Prerequisites

- MATLAB (R2021b or later recommended).

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your_username/Dynamic-Conjugate-Gradient-Optimizer.git
   cd Dynamic-Conjugate-Gradient-Optimizer
   ```

2. Open MATLAB and navigate to the repository folder.

### Usage

1. Run the main script to start the optimization:
   ```matlab
   DynamicConjugateGradient.m
   ```
2. Modify the initial point or function as needed within the script:
   ```matlab
   % Example initial point:
   x = [3.5; 3.5];

   % Example function:
   f(x1, x2) = -cos(x1) * cos(x2) * exp(-(x1 - pi) ^ 2 - (x2 - pi) ^ 2);
   ```

3. Select the desired step-size strategy by uncommenting one of the following lines:
   ```matlab
   learningRate = SWC(transpose(x), f);
   % learningRate = GOLD(transpose(x), f);
   % learningRate = BT(transpose(x), f);
   ```

### Output

- The contour plot shows the function with the optimization path.
- Iterative outputs include:
  - The number of iterations.
  - The minimum point found.
  - The final function value at the minimum.
