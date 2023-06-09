
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

n = 10000
de = zeros(n)
λ = 0.1

for i in 1:n
    de[i] = -log(rand())/λ
end

plot(de)
density(de)

