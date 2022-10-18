cd "d:\mijn documenten\projecten\stata\n_lab"

cscript 

input female urban
0 1
0 2
1 3
1 3
2 2
end

label define fem_lb 0 "male, man, mänlich" ///
                    1 "female, vrouw, weiblich" ///
                    2 "other, anders, divers"

label define urb_lb 1 "rural, ruraal, ländlich" ///
                    2 "suburban, dorp, kleinstadt" ///
                    3 "city, stad, stadt"
                    
label value female fem_lb
label value urban urb_lb

n_lab

mata: 
st_vlload("fem_lb", values=., text="")
asserteq(values, 0 \ 1 \ 2 )
asserteq(text, "male" \  "female" \  "other")

st_vlload("urb_lb", values=., text="")
asserteq(values, 1 \ 2 \ 3)
asserteq(text, "rural" \  "suburban" \  "city")
end

// n(1)

label define fem_lb 0 "male, man, mänlich" ///
                    1 "female, vrouw, weiblich" ///
                    2 "other, anders, divers", modify

label define urb_lb 1 "rural, ruraal, ländlich" ///
                    2 "suburban, dorp, kleinstadt" ///
                    3 "city, stad, stadt", modify

n_lab, n(1)

mata: 
st_vlload("fem_lb", values=., text="")
asserteq(values, 0 \ 1 \ 2 )
asserteq(text, "male" \  "female" \  "other")

st_vlload("urb_lb", values=., text="")
asserteq(values, 1 \ 2 \ 3)
asserteq(text, "rural" \  "suburban" \  "city")
end
                    
// n(2)

label define fem_lb 0 "male, man, mänlich" ///
                    1 "female, vrouw, weiblich" ///
                    2 "other, anders, divers", modify

label define urb_lb 1 "rural, ruraal, ländlich" ///
                    2 "suburban, dorp, kleinstadt" ///
                    3 "city, stad, stadt", modify

n_lab, n(2)

mata: 
st_vlload("fem_lb", values=., text="")
asserteq(values, 0 \ 1 \ 2 )
asserteq(text, "man" \  "vrouw" \  "anders")

st_vlload("urb_lb", values=., text="")
asserteq(values, 1 \ 2 \ 3)
asserteq(text, "ruraal" \  "dorp" \  "stad")
end

// n(3)

label define fem_lb 0 "male, man, mänlich" ///
                    1 "female, vrouw, weiblich" ///
                    2 "other, anders, divers", modify

label define urb_lb 1 "rural, ruraal, ländlich" ///
                    2 "suburban, dorp, kleinstadt" ///
                    3 "city, stad, stadt", modify

n_lab, n(3)

mata: 
st_vlload("fem_lb", values=., text="")
asserteq(values, 0 \ 1 \ 2 )
asserteq(text, "mänlich" \  "weiblich" \  "divers")

st_vlload("urb_lb", values=., text="")
asserteq(values, 1 \ 2 \ 3)
asserteq(text, "ländlich" \  "kleinstadt" \  "stadt")
end                                        

// ----------------------------- pchar

label define fem_lb 0 "male; man; mänlich" ///
                    1 "female; vrouw; weiblich" ///
                    2 "other; anders; divers", modify

label define urb_lb 1 "rural; ruraal; ländlich" ///
                    2 "suburban; dorp; kleinstadt" ///
                    3 "city; stad; stadt", modify

n_lab, parse(";")

mata: 
st_vlload("fem_lb", values=., text="")
asserteq(values, 0 \ 1 \ 2 )
asserteq(text, "male" \  "female" \  "other")

st_vlload("urb_lb", values=., text="")
asserteq(values, 1 \ 2 \ 3)
asserteq(text, "rural" \  "suburban" \  "city")
end

// n(1)

label define fem_lb 0 "male; man; mänlich" ///
                    1 "female; vrouw; weiblich" ///
                    2 "other; anders; divers", modify

label define urb_lb 1 "rural; ruraal; ländlich" ///
                    2 "suburban; dorp; kleinstadt" ///
                    3 "city; stad; stadt", modify

n_lab, n(1) parse(";")

mata: 
st_vlload("fem_lb", values=., text="")
asserteq(values, 0 \ 1 \ 2 )
asserteq(text, "male" \  "female" \  "other")

st_vlload("urb_lb", values=., text="")
asserteq(values, 1 \ 2 \ 3)
asserteq(text, "rural" \  "suburban" \  "city")
end
                    
// n(2)

label define fem_lb 0 "male; man; mänlich" ///
                    1 "female; vrouw; weiblich" ///
                    2 "other; anders; divers", modify

label define urb_lb 1 "rural; ruraal; ländlich" ///
                    2 "suburban; dorp; kleinstadt" ///
                    3 "city; stad; stadt", modify
                    
n_lab, n(2) parse(";")

mata: 
st_vlload("fem_lb", values=., text="")
asserteq(values, 0 \ 1 \ 2 )
asserteq(text, "man" \  "vrouw" \  "anders")

st_vlload("urb_lb", values=., text="")
asserteq(values, 1 \ 2 \ 3)
asserteq(text, "ruraal" \  "dorp" \  "stad")
end

// n(3)

label define fem_lb 0 "male; man; mänlich" ///
                    1 "female; vrouw; weiblich" ///
                    2 "other; anders; divers", modify

label define urb_lb 1 "rural; ruraal; ländlich" ///
                    2 "suburban; dorp; kleinstadt" ///
                    3 "city; stad; stadt", modify

n_lab, n(3) parse(";")

mata: 
st_vlload("fem_lb", values=., text="")
asserteq(values, 0 \ 1 \ 2 )
asserteq(text, "mänlich" \  "weiblich" \  "divers")

st_vlload("urb_lb", values=., text="")
asserteq(values, 1 \ 2 \ 3)
asserteq(text, "ländlich" \  "kleinstadt" \  "stadt")
end  

// -------------------- specify labels

label define fem_lb 0 "male, man, mänlich" ///
                    1 "female, vrouw, weiblich" ///
                    2 "other, anders, divers", modify

label define urb_lb 1 "rural, ruraal, ländlich" ///
                    2 "suburban, dorp, kleinstadt" ///
                    3 "city, stad, stadt", modify

n_lab fem_lb urb_lb, n(1)

mata: 
st_vlload("fem_lb", values=., text="")
asserteq(values, 0 \ 1 \ 2 )
asserteq(text, "male" \  "female" \  "other")

st_vlload("urb_lb", values=., text="")
asserteq(values, 1 \ 2 \ 3)
asserteq(text, "rural" \  "suburban" \  "city")
end

label define fem_lb 0 "male, man, mänlich" ///
                    1 "female, vrouw, weiblich" ///
                    2 "other, anders, divers", modify

label define urb_lb 1 "rural, ruraal, ländlich" ///
                    2 "suburban, dorp, kleinstadt" ///
                    3 "city, stad, stadt", modify

n_lab fem_lb , n(1)

mata: 
st_vlload("fem_lb", values=., text="")
asserteq(values, 0 \ 1 \ 2 )
asserteq(text, "male" \  "female" \  "other")

st_vlload("urb_lb", values=., text="")
asserteq(values, 1 \ 2 \ 3)
asserteq(text, "rural, ruraal, ländlich" \  "suburban, dorp, kleinstadt" \  "city, stad, stadt")
end
