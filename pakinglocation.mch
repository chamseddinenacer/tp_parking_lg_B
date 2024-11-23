/* pakinglocation
 * Author: chamsa
 * Creation date: 23/11/2024
 */
MACHINE
    pakinglocation

SETS
/* Définition des ensembles abstraits pour les clients et les places de parking */
CLIENTS; PARKING_SPACES


VARIABLES
/* Déclaration des variables   */
clients,client_pl, places, locations


INVARIANT


clients <: CLIENTS & /* Les clients sont un sous-ensemble de CLIENTS */


places <: PARKING_SPACES & /* Les places sont un sous-ensemble de PARKING_SPACES */


locations : places --> clients & /* Les locations sont une relation entre les places et les clients */


client_pl : clients --> NAT &  

// Un client ne peut louer plus de 4 places
!cl.(cl : clients => client_pl(cl) <= 4) 


INITIALISATION

/* Initialisation des variables  */
clients, places, locations, client_pl := {}, {}, {}, {}


OPERATIONS


/* Ajout client */


Ajouter_Nv_Client(cl) =


PRE 
    /*  le client doit être dans CLIENTS mais pas déjà dans clients */
    cl : CLIENTS - clients 
THEN


clients := clients \/ {cl} || 
client_pl(cl) := 0 /* Initialisation du nombre de places à 0 */


END;




/* Supprimer client */


SupprimerClient(cl) =


PRE 
    /* le client doit être dans clients et ne doit pas avoir de places louées */
    cl : clients & client_pl(cl) = 0
THEN


clients := clients - {cl} || /* Suppression du client de l'ensemble des clients */


client_pl := {cl} <<| client_pl /* Suppression du client de la fonction client_pl */


END;



/* Location d'une place de parking à un client */


LouerPlace(pl, cl) =


PRE pl : places & cl : clients & pl /: dom(locations) & client_pl(cl) < 4 THEN


locations(pl) := cl ||


/* Incrémentation du nombre de places louées par le client */
client_pl(cl) := client_pl(cl) + 1


END;


Rest_place(pl, cl) =

PRE

pl : dom(locations) & // pl doit être une place actuellement louée

cl : clients & // cl doit être un client valide

locations(pl) = cl // La place doit être louée par le client cl

THEN

locations := {pl} <<| locations ||

/* Suppression et décrémentation du nombre de places louées par le client */
client_pl(cl) := client_pl(cl) - 1

END


END

