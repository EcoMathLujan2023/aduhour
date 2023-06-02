# 1) Activar el proyecto de la carpeta actual: `activate .`
# 2) Qué paquetes vamos a usar.
# 2.1) `add Plots`


# Variables.

x = 10

typeof(x) # qué tipo de variable es x

x=10.0

typeof(x)

y = 10

x + y

# Vectores y matrices

# Inicializar un vector o una matriz

x = [10, 10, 10, 10, 11]

x = zeros(10)

x = [Float64]

x = zeros(3,4)

mat = [10 11; 12 13]

X = [1:4]

# Julia toma la notación matemática

# Multiplicar escalares por Vectores

5 * x 

# Las operaciones no definidas para un vector 
# se realizan agregando un punto.

log(x) # Error

log.(x)

# Condicionales

if length(x) == 1
    @info "El vector es de largo 1"
else 
    @info "El vector es mayor que 1"
end

if length(x) == 1
    @info "El vector es de largo 1"
elseif length(x) == 2
    @info "El vector es de largo 2"
else @info "EL vector es mayor que 2"
end

if typeof(x) == "Vector"
    @info "El tipo es vector"
else
    @info "El tipo de x es $(typeof(x))"
end

# Bucle

for i in 1: 10
    @info "i = $(i)"
end

# Combinar bucles y Condicionales

for i in 1:10
    if i == 5
        @info "Ohhhhh i es igual a 5"
    else
        @info "i es igual a $(i)"
    end   
end

x = rand(10)

for i in 1:10
    if x[i]<0.2
        @info "Evaluamos la probabilidad de 0.2"
    end
end

p = 0.2 

for i in 1:10
    if rand() < p 
        @info "Verdadero"
    else
        @info "Falso"
    end
end