## 
# Crecimiento logistico 
#

function crecim_logístico(R,N₀,tfinal=200)
    pop = [N₀]
    for t in 1:tfinal
        pop1 = R * pop[t] * (1 - pop[t])
        push!(pop,pop1)
    end
    return pop
end

function crecim_logístico2(R,N₀,K,tfinal=200)
    pop = [N₀]
    for t in 1:tfinal
        pop1 = R * pop[t] * ((K - pop[t])/K)
        push!(pop,pop1)
    end
    return pop
end

crecimiento = crecim_logístico2(1.1,10.0,2000)
plot(crecimiento)

## 
# Crecimiento logistico + cosecha
#

function crecim_logístico_cosecha(R = 1.1,N₀ = 10.0, K = 200.0,
    tcosecha = 20,tfinal = 200)
    pop = [N₀]
    for t in 1:tfinal
        pop1 = R * pop[t] * ((K - pop[t])/K) 
        if t % tcosecha <= 0.5
            #@info "repique!"
            pop1 = 0.9 * pop1
        end
        push!(pop,pop1)
    end
    return pop
end

crecimiento = crecim_logístico_cosecha()
plot(crecimiento)

cr2 = crecim_logístico_cosecha(1.2,10.0,200.0,50,200)
plot(cr2)

cr3 = crecim_logístico_cosecha(2.1,10.0,200,15)
plot(cr3)

cr4 = crecim_logístico_cosecha(3.1,10.0,200,25)
plot(cr4)


##

function crecim_logístico_cosecha(par,N₀,tfinal = 200, h=1.0)
    λ, K, μ = par

    pop = Float64[N₀]
    ts = [0.0]
    t=0.0
    i=1
    while t < tfinal
        pop1 = pop[i] * h * (λ * pop[i] * ((K - pop[i])/K) - μ)
        t = ts[i] + h 
        i += 1

        if pop1 < 0.0
            pop1 = 0.0
        end
        push!(pop,pop1)
        push!(ts,t)
    end
    return ts,pop
end


# Diagrama de bifurcación de logistico determinista
#
valor_eq = Float64[]
for μ in 0:0.1:10
    #@info μ
    p2 = crecim_logístico_cosecha( [0.2, 100, μ], 100, 1000, 0.01)
    t,p = p2
    push!( valor_eq,p[end])
end

plot(0:0.1:10,valor_eq)

## 
# Ejercicio dia 3 Esquema conceptual: 
# Avanzar definiendo ecuaciones para las variables
#  de estado quizás simplificando el esquema 
# conceptual 

# Variables de estado:

# L: Lombrices adultas
# Ls: Lombrices subadultas
# Lc: Cocones de Lombrices

# Pb: Poros biogénicos
# Ag: Agregados biogénicos

# Parámetros:
# H: Humedad.
# Dap: Densidad aparente
# Mo: Materia orgánica del suelo.
# U: Uso del suelo.

# ecuaciones
# Lombrices

# Cocones
# Lc = r * L


