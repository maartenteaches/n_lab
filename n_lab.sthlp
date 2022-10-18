{smcl}
{* *! version 0.1.0  18Oct2022}{...}
{findalias asfradohelp}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "[D] label" "help label"}{...}
{viewerjumpto "Syntax" "n_label##syntax"}{...}
{viewerjumpto "Description" "n_label##description"}{...}
{viewerjumpto "Examples" "n_label##example"}{...}
{title:Title}

{phang}
{bf:n_label} {hline 2} In value label retain only the nth label


{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmd:n_label}
[{it:label_list}]
[{cmd:,} {it:options}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{synopt:{opt N(#)}}the nth label should be retained, the default is 1{p_end}
{synopt:{opt parse}{cmd:("}{it:pchar}{cmd:")}}specifies the parsing characters, 
the default is ","{p_end}
{synoptline}
{p2colreset}{...}


{marker description}{...}
{title:Description}

{pstd}
{cmd:n_lab} assumes that value labels contain the same text in different 
languages, whereby each language is separated by {it:pchar}. For example,
if {it:pchar} = "," then we could have a value label like "male, man, mänlich".
The purpose of {cmd:n_lab} is to keep only one of these. So in this example, if 
we only want to keep the Dutch (2nd) label we would set {cmd:n()} to 2. If we
wanted to keep the English (1st) label we would not need to set {cmd:n()} because
1 is the default


{marker example}{...}
{title:Example}

{cmd:}
    . clear 
    . input female urban
    . 0 1
    . 0 2
    . 1 3
    . 1 3
    . 2 2
    . end

    . label define fem_lb 0 "male, man, mänlich" ///
                          1 "female, vrouw, weiblich" ///
                          2 "other, anders, divers"
      
    . label define urb_lb 1 "rural, ruraal, ländlich" ///
                          2 "suburban, dorp, kleinstadt" ///
                          3 "city, stad, stadt"
                          
    . label value female fem_lb
    . label value urban urb_lb

    . list 

    . n_lab

    . list
{txt}
