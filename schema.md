# Schéma relationnel

## CATEGORIEPLAT (nouveau)

CATEGORIEPLAT(**id**, nom)

## PLAT (nouveau)

PLAT(**id**, nom, prix, #idCategoriePlat)

## COMMANDE (nouveau)

COMMANDE(**id**, date)

## COMMANDE (modifié)

COMMANDE(**id**, date, #idClient?, #idServeur?, #idTableGargotte?)

## COMMANDEPLAT (nouveau)

COMMANDEPLAT(**#idCommande**, **#idPlat**, quantite)

## CLIENT (nouveau)

CLIENT(**id**, nom)

## SERVEUR (nouveau)

SERVEUR(**id**, nom)

## TABLEGARGOTTE (nouveau)

TABLEGARGOTTE(**id**, numero)