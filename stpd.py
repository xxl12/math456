import numpy as np

np.random.seed(42)  # For reproducibility

def generate_symmetric_matrix(n):
    """Generates a symmetric matrix from a Gaussian ensemble."""
    A = np.random.randn(n, n)
    A = (A + A.T) / 2  # Make the matrix symmetric
    return A

def rayleigh_quotient(A, x):
    """Computes the Rayleigh quotient R(x) = (x^T A x) / (x^T x)."""
    return np.dot(x.T, np.dot(A, x)) / np.dot(x.T, x)

def gradient_of_rayleigh_quotient(A, x):
    """Computes the gradient of the Rayleigh quotient."""
    Rx = rayleigh_quotient(A, x)
    return 2 * (np.dot(A, x) - Rx * x)

def steepest_descent_for_smallest_eigenvalue(A, tol=1e-6, max_iter=10000):
    """Finds the smallest eigenvalue and corresponding eigenvector using the steepest descent method."""
    n = A.shape[0]
    x = np.random.rand(n)  # Initial guess for the eigenvector
    x = x / np.linalg.norm(x)  # Normalize the initial guess
    
    for i in range(max_iter):
        grad_R = gradient_of_rayleigh_quotient(A, x)
        
        # Update x in the direction of the negative gradient of the Rayleigh quotient
        x = x - 0.05 * grad_R  # Here 0.01 is a chosen step size, might need adjustment
        
        # Normalize x to ensure it doesn't grow unbounded
        x = x / np.linalg.norm(x)
        
        # Compute the Rayleigh quotient as an estimate of the current eigenvalue
        lambda_est = rayleigh_quotient(A, x)
        
        print(f"Iteration {i+1}: Estimated eigenvalue = {lambda_est}")
        
        # Check convergence: if the norm of the gradient is small, stop
        if np.linalg.norm(grad_R) < tol:
            print("Convergence achieved.")
            break
    
    return lambda_est, x

# Parameters
n = 50  # Size of the matrix

# Generate a symmetric matrix from a Gaussian ensemble
A = generate_symmetric_matrix(n)

# Compute the eigenvalues using numpy.linalg.eigvalsh
eigenvalues = np.linalg.eigvalsh(A)

print("Exact eigenvalues:", eigenvalues)

# Find the smallest eigenvalue and its corresponding eigenvector using steepest descent
smallest_eigenvalue, eigenvector = steepest_descent_for_smallest_eigenvalue(A)
print("Smallest Eigenvalue:", smallest_eigenvalue)
print("Corresponding Eigenvector:", eigenvector)
