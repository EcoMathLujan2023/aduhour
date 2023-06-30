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

using Plots
function pop_nutrientes(par,N₀,P₀, tfinal = 200, h=1.0)

    a, b, e, c, d = par

    N = Float64[N₀]
    pop = Float64[P₀]
    ts = [0.0]
    t=0.0
    i=1
    while t < tfinal
        # dN = a - b N P - e N
        N₁ = N[i] + h * (a - b * N[i] * pop[i] - e * N[i])

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

t,N,P = pop_nutrientes([0.02,1.0,0.001,0.8,0.1],
1.0,1.0,1000,0.01)
plot(t,P,label="P")
plot!(t,N,label="N")



##
# Ejercicio
#
# 1) Igualar a cero las ecuaciones para sacar de 
# forma analitica los puntos de equilibrio
#
# 2) Hacer un grafico de bifurcaciones
#
# 3) Hacer la versión estocástica
#

# 1)
# 1.1)

# dN = a - b N P - e N

# a - bNP - eN = 0
# a - (bP - e)N = 0

# N = a/(bP + e)
# P = (a - eN)/bN

# 1.2)

# dP = cNP - dP 

# cNP - dP = 0
# P(cN - d) = 0
# P = 0; cN - d = 0 => N = d/c


function diagrama_bifurc(paso,parmax)
    
    valor_eq = Float64[]

    for a in 0:paso:parmax
        @info a
        n2 = pop_nutrientes([0.1,1.0,0.001,0.8,0.11],2.0,1.5,1000)
        t,n = n2
        push!( valor_eq,t[end])
    end
    return valor_eq
end

diagrama_bifurc(0.1,10)
plot(0:0.1:10,valor_eq)


## 
# Versión estocástica

function pop_nutrientes_sto(par,N₀,P₀, tfinal = 200)

    a, b, e, c, d = par

    N = Float64[N₀]
    P = Float64[P₀]
    tsN = [0.0]
    tsP =[0.0]
    tN = 0.0
    tP = 0.0
    iN = 1
    iP = 1

    while tN <= tfinal
        # dN = a - b N P - e N
        NB = a
        NM = b # * N[iN] * P[iN] + e * N[iN]
        NR = NB + NM       

        tN = tsN[iN] - log(rand())/NR

        if rand() < NB/NR                   # probabilidad de incremento de Nutrientes 
            N₁  = N[iN] + 1
        else
            N₁ = N[iN] - 1
        end
        iN += 1                   # equivale a i = i + 1 
        push!(N, N₁)
        push!(tsN,tN)
    end

    while tP <= tfinal

        # dP = c N P - d P 

        PB  =  c * N[iP] * P[iP] 
        PM =   d * P[iP]
        PR = PB + PM

        tP = tsP[iP] - log(rand())/PR

        if rand() < PB/PR                   # probabilidad de aumento poblacional 
            P₁  = P[iP] + 1
        else
            P₁ = P[iP] - 1
        end
        iP += 1  
        push!(P, P₁)
        push!(tsP,tP)
           
    end
    return tsP, P, tsN, N
end

tP,P,tN,N = pop_nutrientes_sto([0.2,1.0,0.001,0.8,0.11],1.0,1.0,1000)

plot(t,P,label="P")
plot!(t,N,label="N")