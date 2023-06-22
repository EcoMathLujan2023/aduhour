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