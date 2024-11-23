/* pakinglocation
 * Author: chamsa
 * Creation date: 23/11/2024
 */
MACHINE
    pakinglocation

SETS

CLIENTS ; PARKING_SPACES


ABSTRACT_VARIABLES

clients , client_pl , places , locations


INVARIANT


clients <: CLIENTS &


places <: PARKING_SPACES &


locations : places --> clients &


client_pl : clients --> NAT &

// Un client ne peut louer plus de 4 places
! cl . ( cl : clients => client_pl ( cl ) <= 4 )


INITIALISATION


clients , places , locations , client_pl := {} , {} , {} , {}


OPERATIONS


/* Ajout client */


Ajouter_Nv_Client ( cl ) =


PRE cl : CLIENTS - clients THEN


clients := clients \/ { cl } || client_pl ( cl ) := 0


END ;




/* Supprimer client */


SupprimerClient ( cl ) =


PRE cl : clients & client_pl ( cl ) = 0 THEN


clients := clients - { cl } ||


client_pl := { cl } <<| client_pl


END ;



/* Location d'une place de parking à un client */


LouerPlace ( pl , cl ) =


PRE pl : places & cl : clients & pl /: dom ( locations ) & client_pl ( cl ) < 4 THEN


locations ( pl ) := cl ||


client_pl ( cl ) := client_pl ( cl ) + 1


END ;


Rest_place ( pl , cl ) =

PRE

pl : dom ( locations ) & // pl doit être une place actuellement louée

cl : clients & // cl doit être un client valide

locations ( pl ) = cl // La place doit être louée par le client cl

THEN

locations := { pl } <<| locations ||

client_pl ( cl ) := client_pl ( cl ) - 1

END


END
