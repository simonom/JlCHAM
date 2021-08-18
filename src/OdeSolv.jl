"""function for solving ODEs"""
# Ordinary Differential Equations (ODEs) relevant to the user-defined problem are solved here
# ODE solver tutorial: https://diffeq.sciml.ai/stable/tutorials/ode_example/#Example-1-:-Solving-Scalar-Equations

using Sundials # for ODE solver

function dydt!(dydtv,u,p,t) # define ODE function
    # the ordinary differential equation to solve
    dydtv[1] = 2.0(u[1])
end # finish ODE function

# inputs
rtol = 1.0e-6 # relative tolerance
atol = 1.0e-6 # absolute tolerance
u0 = [1.0] # initial concentrations (molecules/cm3)
tspan = (0.0,60.0) # time to solve over (s)

prob = ODEProblem(dydt!,u0,tspan) # define problem
# solve ordinary differential equation problem
sol = solve(prob,CVODE_BDF(),reltol=rtol,abstol=atol,save_everystep=false)
println(sol.u) # see result