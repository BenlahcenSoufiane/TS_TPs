# TS_TPs

RECAP_Filtre_Ideal

Dans le traitement du signal, un filtre idéal est un filtre qui passe parfaitement ou bloque une plage spécifique de fréquences, tout en ayant une atténuation ou une distorsion nulle des autres fréquences. En d'autres termes, il s'agit d'un filtre qui a une transition parfaite entre la bande passante et la bande stop, sans région de transition entre les deux.

En MATLAB, les filtres idéaux peuvent être mis en œuvre en utilisant les types de filtres suivants:

Filtre passe-bas: permet aux fréquences inférieures à une certaine fréquence de coupure de passer tout en bloquant les fréquences supérieures à la fréquence de coupure.

Filtre passe-haut: permet aux fréquences supérieures à une certaine fréquence de coupure de passer tout en bloquant les fréquences inférieures à la fréquence de coupure.

Filtre passe-bande: permet aux fréquences dans une certaine plage de passer tout en bloquant les fréquences en dehors de cette plage.

Filtre réjecteur de bande: bloque les fréquences dans une certaine plage tout en permettant aux fréquences en dehors de cette plage de passer.

Les filtres idéaux peuvent être mis en œuvre en MATLAB en créant un tableau de 1s et de 0s qui représente la réponse souhaitée du filtre dans le domaine fréquentiel, puis en multipliant ce tableau avec la FFT du signal pour le filtrer. Le signal filtré peut ensuite être converti en retour au domaine temporel en utilisant la FFT inverse.
