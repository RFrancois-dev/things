##=============
Quelle est la différence entre crochets simples et crochets doubles?

##génération de données
#un vecteur
vec <- c(rep("Hello", 2), rep("Goodbye", 3))
#un dataframe
data <- data.frame(col1 = vec, col2 = c(1:5), col3 = seq(1, 10, length.out = 5))

##les crochets simples retournent (sauf exception) un objet du même type.
#ils permettent de sélectionner "une partie de l'objet"
vec[1] #renvoie la première valeur de vec.

#si l'objet a 2 dimensions, il faut utiliser la virgule et préciser les indices retenus pour chaque dimension
data[2:4, c(2,3)] #renvoie les valeurs aux indices 2 à 4 (en ligne) et 2 et 3 (en colonne).

##les crochets doublent retournent un objet de dimension inférieure
#appliqués à un dataframe, qui est une liste de vecteurs, ils retournent donc un vecteur.
#Par conséquent, la virgule n'est pas nécessaire, on a toujours un seul indice.
data[[2]] #renvoie le second vecteur de data, c'est à dire la deuxième colonne.

#appliqués à un vecteur, ils renvoient la valeur correspondante (qui est cependant toujours un vecteur)
vec[[3]] #renvoie le 3e vecteur de vec, c'est à dire la troisième valeur.

##Attention : par exception, les crochets simples, si on ne sélectionne qu'une colonne dans
#un dataframe, ne renvoient plus un dataframe mais un vecteur. On peut modifier ce comportement
#avec le paramètre "drop" :
noDrop <- data[, 2] #renvoie la deuxième colonne de data... sous forme de vecteur!
is.vector(noDrop)
withDrop <- data[, 2, drop = FALSE] #renvoie un dataframe à une seule colonne
is.vector(withDrop)
