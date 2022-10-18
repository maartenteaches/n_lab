*! version 0.1.0 MLB 18Oct2022
program define n_lab
    version 11.2
    syntax [anything(name=lablist)], [n(integer 1) parse(string)]
    
    
    if `"`parse'"' == "" local parse ","
    if `"`lablist'"' == ""{
        qui label dir
        local lablist = `"`r(names)'"'
    } 
    else {
        foreach lab of local lablist {
            capture label list `lab'
            if _rc == 111 {
                local notfound = "`notfound' `lab'"
            }
            else if _rc != 0 {
                di as err "this should not occur"
                exit 198
            }
        }
        if "`notfound'" != "" {
            di as err "value label(s) {bf `notfound'} not found"
            exit 111
        }
        
    }
    if `n' <= 0 {
        di as err "n() can only contain positive integers"
        exit 198
    }
    
    mata: n_lab(`"`lablist'"', `n', `"`parse'"')
end

mata:

void n_lab(string scalar names, real scalar n, string scalar parse)
{
    real scalar i
    string scalar name
    
    names = tokens(names)
    n = 2*n-1
    
    for(i=1; i<=cols(names); i++) {
        name   = names[i]
        parse_lab(name, n, parse)
    }
}

void parse_lab(string scalar name, real scalar n, string scalar parse)
{
    real colvector values
    string colvector text
    
    values = .
    text   = ""
    
    st_vlload(name, values, text)
    text = find_n_lab(text, n, parse)
    st_vldrop(name)
    st_vlmodify(name, values, text)    
}

string colvector find_n_lab(string colvector tochange, real scalar n, string scalar parse)
{
    transmorphic scalar t
    real scalar i, j
    string scalar lab, newlab
    
    t = tokeninit(" ", parse)
    for(i=1; i<=rows(tochange); i++) {
        lab = tochange[i]
        tokenset(t,lab)
        for(j=1; j<=n; j++) {
            newlab = tokenget(t)
        }
        tochange[i] = newlab
    }
    return(tochange)
}

end
