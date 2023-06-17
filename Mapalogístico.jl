# Mapa logístico.
# En sistemas discretos
# El tiempo evoluciona en pasos discretos.
# Herramienta matemática: Mapas.
# Modelo: ecuaciones en diferencias

# Modelo logístico:

function crecim_logístico(R,N₀,tfinal=200)
    pop = [N₀]
    for t in 1:tfinal
        pop1 = R * pop[t] * (1 - pop[t])
        push!(pop,pop1)
    end
    return pop
end
crecimiento = crecim_logístico(2,0.2,8)
crecimiento
using Plots
scatter(crecimiento)

# Ejercicios de la teoría 1

# Modelo logístico

function crecim_logístico2(R,N₀,K,tfinal=200)
    pop = [N₀]
    for t in 1:tfinal
        pop1 = R * pop[t] * ((K - pop[t])/K)
        push!(pop,pop1)
    end
    return pop
end


# Ejercicio 2
crecimiento = crecim_logístico2(4,20,20,20)
scatter(crecimiento)
@info(crecimiento[12])

# Respuesta: 0

# Ejercicio 3

crecimiento = crecim_logístico2(5,20,100)
scatter(crecimiento)
# El punto fijo está en 80

# Ejercicio 4
# Todas las opciones son correctas