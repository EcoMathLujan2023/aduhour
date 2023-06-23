# N = Nutrientes
# P = Población (fitoplankton)
#
# dN = a - b N P - e N
# dP = c N P - d P 
#
# a = Tasa de ingreso de Nutrientes
# b = Consuma de Nutrientes por la poblacion P
# e = Tasa de degradacion de Nutrientes
#
# c = Tasa de asimilación c < b
# d = Mortalidad de la poblacion

function pop_nutrientes(par,N₀,P₀, tfinal = 200, h=1.0)

    a, b, e, c, d = par

    N = Float64[N₀]
    pop = Float64[P₀]
    ts = [0.0]
    t=1
    i=1
    while t < tfinal
        # dN = a - b N P - e N
        N₁ = a - b * N[i] * pop[i] - e * N[i]

        # dP = c N P - d P 
        pop1 = pop[i] + h * ( c * N[i] * pop[i] - d * pop[i])

        t = ts[i] + h
        i += 1                   # equivale a i = i + 1 
        push!(pop, pop1)
        push!(ts,t)
        push!(N, N₁)
    end
    return ts,N,pop
end

crecimiento = pop_nutrientes([0.1,0.01,0.01,0.01,0.01],10.0,10.0,2000)
plot(crecimiento)
t,N = crecimiento