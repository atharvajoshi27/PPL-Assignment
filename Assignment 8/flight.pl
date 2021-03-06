/* ATHARVA MUKUND JOSHI */
/* 111803142 */

details(toronto,'$50','60min').
details(paris,'$50','60min').
details(toulouse,'$40','3s0min').
details(london,'$75','80min').
details(barcelona,'$40','30min').
details(madrid,'$75','45min').

f(toronto,london,'Air Canada',500,'360min').
f(toronto,london,'United',450,'420min').
f(london,barcelona,'Iberia',220,'240min').
f(paris,toulouse,'United',35,'120min').
f(barcelona,madrid,'Air Canada',100,'60min').
f(barcelona,madrid,'Iberia',120,'65min').
f(toronto,madrid,'Air Canada',900,'480min').
f(toronto,madrid,'United',950,'540min').
f(toronto,madrid,'Iberia',800,'480min').

/*To list down all airports with their tax , security delay.*/
allair(A,B,C) :- details(A,B,C).

/* To check the availability of any flight from A to B. */
checkflight(A,B) :- f(A,B,C,D,E) ; f(B,A,C,D,E).

/*To display all the available flights with their cost, duration, flight name.*/    
availableflight(A,B,C,D,E) :- f(A,B,C,D,E).

/*To check if there exist a cheap flight between city A and B.*/
flightcheap(A,B,C,D,E) :- (f(A,B,C,D,E) ; f(B,A,C,D,E)) , D < 400.

/*To check if it is possible to reach from A to B in two flights.*/
doubleflights(A,B) :- (f(A,X,C,D,E) ; f(X,A,C,D,E)) , (f(X,B,F,G,H) ; f(B,X,F,G,H)).

/*A flight from city A to city B with airline C is preferred if it’s cheap (see (b)) or it’s with Air Canada.*/
preferred(A,B,C,D,E) :- flightcheap(A,B,C,D,E) ; ((availableflight(A,B,'Air Canada',F,G);availableflight(B,A,'Air Canada',F,G)) , (availableflight(A,B,C,D,E);availableflight(B,A,C,D,E)) , D < F).

/*If there exists a flight from A to B with 'United' then there exists a flight from A to B with 'Air Canada'.*/
exists(A,B) :- (f(A,B,'United',D,E) ; f(B,A,'United',D,E)) , (f(A,B,'Air Canada',F,G) ; f(B,A,'Air Canada',F,G)).
