_v. 0.1.0_  

# `n_lab` : retain nth value label

## Description
**n_lab** assumes that value labels contain the same text in different languages, whereby each language is separated by a character like `,` or `;`. For example, if this separator character is `,` then we could have a value label like "male, man, mänlich". The purpose of **n_lab** is to keep only one of these. We might for example want keep only the Dutch (2nd) label or the English (1st) label.

## Requirements and use
This requies [Stata](https://www.stata.com) version 11.2. The easiest way to install this is using E. F. Haghish's [github](https://haghish.github.io/github/) command. After you have installed that, you can install **n_lab** by typing in Stata: `github install maartenteaches/n_lab`. Alternatively, **n_lab** can be installed without the **github** command by typing in Stata `net install n_lab, from("https://raw.githubusercontent.com/maartenteaches/n_lab/main")`. 

## License
Creative Commons Attribution 4.0

## Author
**Maarten Buis**  
maarten.buis@uni.kn  
