
local PI = 3.1415926535897932385
local SQRT_2PI = 2.5066282746310005024

local sin = math.sin
local exp = math.exp

local g = 5
local n = 7

--Compute the p table by running `tlg1[g, n]` in the generate.m thing
--g is any number such that Re(z + g + 1/2) > 0
local p = {
    1.0000000001900148240,
    76.180091729471463483,
    -86.505320329416767652,
    24.014098240830910490,
    -1.2317395724501553875,
    0.0012086509738661785061,
    -5.3952393849531283785e-6
}

--TODO: Extend to complex plane
local function gamma(z)
    if z < 0.5 then
        --For lanczos approximation, Re(z) < 1/2 doesnt work so we use the reflection formula
        return pi/(sin(pi*z)*gamma(1 - z))    
    end
    z = z - 1
    local x = p[1]
    for i = 2, n do
        x = x + p[i]/(z + i - 1)
    end
    local t = z + g + 0.5
    return SQRT_2PI*t^(z + 0.5)*exp(-t)*x
end

print(gamma(10))
