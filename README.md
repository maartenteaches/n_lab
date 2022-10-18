_v. 0.1.0_  

# `n_lab` : retain nth value label

## Description
**n_lab** assumes that value labels contain the same text in different languages, whereby each language is separated by a character like `,` or `;`. For example, if this separator character is `,` then we could have a value label like "male, man, mänlich". The purpose of **n_lab** is to keep only one of these. We might for example want keep only the Dutch (2nd) label or the English (1st) label.

## Requirements and use
This requies [Stata](https://www.stata.com) version 11.2. The easiest way to install this is using E. F. Haghish's [github](https://haghish.github.io/github/) command. After you have installed that, you can install **n_lab** by typing in Stata: `github install maartenteaches/n_lab`. Alternatively, **n_lab** can be installed without the **github** command by typing in Stata `net install n_lab, from("https://raw.githubusercontent.com/maartenteaches/n_lab/main")`. 

## Example

```
. clear

. 
. input female urban

        female      urban
  1. 0 1
  2. 0 2
  3. 1 3
  4. 1 3
  5. 2 2
  6. end

. 
. label define fem_lb 0 "male, man, mänlich" ///
>                     1 "female, vrouw, weiblich" ///
>                     2 "other, anders, divers"

. 
. label define urb_lb 1 "rural, ruraal, ländlich" ///
>                     2 "suburban, dorp, kleinstadt" ///
>                     3 "city, stad, stadt"

.                     
. label value female fem_lb

. label value urban urb_lb

. 
. list

     +------------------------------------------------------+
     |                  female                        urban |
     |------------------------------------------------------|
  1. |      male, man, mänlich      rural, ruraal, ländlich |
  2. |      male, man, mänlich   suburban, dorp, kleinstadt |
  3. | female, vrouw, weiblich            city, stad, stadt |
  4. | female, vrouw, weiblich            city, stad, stadt |
  5. |   other, anders, divers   suburban, dorp, kleinstadt |
     +------------------------------------------------------+

. 
. n_lab

. 
. list

     +-------------------+
     | female      urban |
     |-------------------|
  1. |   male      rural |
  2. |   male   suburban |
  3. | female       city |
  4. | female       city |
  5. |  other   suburban |
     +-------------------+

```

## License
Creative Commons Attribution 4.0

## Author
**Maarten Buis**  
maarten.buis@uni.kn  
