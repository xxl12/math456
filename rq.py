import numpy as np

np.random.seed(42)  # Initialize the random seed for reproducibility

def generate_symmetric_matrix(n):
    """Generates a symmetric matrix from a Gaussian ensemble."""
    A = np.random.randn(n, n)
    A = (A + A.T) / 2  # Make the matrix symmetric
    return A

def rayleigh_quotient(A, x):
    """Computes the Rayleigh quotient R(x) = (x^T A x) / (x^T x)."""
    return np.dot(x.T, np.dot(A, x)) / np.dot(x.T, x)

def inverse_iteration_with_rayleigh_quotient(A, tol=1e-10, max_iter=1000):
    """Finds the smallest eigenvalue and corresponding eigenvector using inverse iteration with Rayleigh quotient."""
    n = A.shape[0]

    x = np.random.rand(n)  # Initial guess for the eigenvector
    x = x / np.linalg.norm(x)  # Normalize the initial guess
    
    lambda_old = 0
    for i in range(max_iter):
        # Compute the Rayleigh quotient
        lambda_new = rayleigh_quotient(A, x)

        r= np.dot(A,x) - lambda_new*x
        
        print(f"Iteration {i+1}: Eigenvalue = {lambda_new}")  # Print the eigenvalue at each iteration
        
        # Inverse iteration step with shift
        try:
            u = np.linalg.solve(A - lambda_new * np.eye(n), x)
        except np.linalg.LinAlgError:
            # Singular matrix encountered, break
            break
        
        # Normalize the vector
        x = u / np.linalg.norm(u)
        
        # Check for convergence
        if np.linalg.norm(r) < tol:
            print("Convergence achieved.")
            break
        lambda_old = lambda_new
    
    return lambda_new, x

# Parameters
n = 50  # Size of the matrix

# Generate a symmetric matrix from a Gaussian ensemble
A = generate_symmetric_matrix(n)

# Compute the eigenvalues using numpy.linalg.eigvalsh
eigenvalues = np.linalg.eigvalsh(A)

print("Exact eigenvalues:", eigenvalues)

# Find the smallest eigenvalue and its corresponding eigenvector
smallest_eigenvalue, eigenvector = inverse_iteration_with_rayleigh_quotient(A)
print("Smallest Eigenvalue:", smallest_eigenvalue)
print("Corresponding Eigenvector:", eigenvector)
