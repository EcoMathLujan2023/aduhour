
## Ejercicios. Dos numerales define un bloque de código que se puede ejecutar con una Combinacíon de teclas

# Crecimiento exponencial determinístico
# discreto con intervalo de tiempo h variable.
# Modificando la función anterior. 
# Subirlo al repositorio de Github 

function crec_exp(λ,N0,tfinal,h=1)
    pop = [N0]
    ts = [0.0]
    i = 1
    t = 0.0
    while t <= tfinal
        pop1 = pop[i] + h * λ * pop[i]
        t = ts[i] + h
        push!(pop,pop1)
        push(ts,t)
    end
    return pop, ts
end

c1 = crec_exp(0.1,1-0,100,1)

plot(c1)
function distr_exp(λ)
    n = 10000
    de = zeros(n)
    for i in 1:n
    de[i] = -log(rand())/λ
    end
    return de
end

de = distr_exp(10*2/100)
plot(de)

# Para graficar la densidad de la distribución
using StatsPlots
density(de)

function promedio (x)
    p = sum(x)/length(x)
    return p
end

sum(de)/length(de)