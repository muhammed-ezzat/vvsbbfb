/ * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P _ G E T _ U S E R C O U N T S _ B Y _ S I T E ]         S c r i p t   D a t e :   0 8 / 1 4 / 2 0 1 2   1 3 : 5 7 : 0 1   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E     [ d b o ] . [ S P _ G E T _ U S E R C O U N T S _ B Y _ S I T E ]   	  
 	 	 @ S I T E _ I D   I N T  
 A S  
 S E T   N O C O U N T   O N  
 D E C L A R E   @ S Q L   N V A R C H A R ( 4 0 0 0 )   =   ' ' ;  
 D E C L A R E   @ C O N D I T I O N   N V A R C H A R ( 4 0 0 0 )   =   ' ' ;  
 S E T   @ S Q L   =   ' S E L E C T    
 	 	 	 C O U N T ( U S E R S . I D )   A S   U S E R C O U N T ,    
 	 	 	 S I T E . D E S C R I P T I O N   A S   S I T E _ D E S C R I P T I O N ,  
 	 	 	 S I T E . I D   A S   S I T E _ I D  
 	 	 	 F R O M   E C O M M _ S I T E   S I T E  
 	 	 	 I N N E R   J O I N   E C O M M _ S I T E _ A C C E S S   S A   O N   S I T E . I D   =   S A . S I T E _ I D  
 	 	 	 I N N E R   J O I N   A U T H _ A C C E S S   A C C E S S   O N   S A . A C C E S S _ I D   =   A C C E S S . I D  
 	 	 	 L E F T   O U T E R   J O I N   A U T H _ U S E R S _ A C C E S S   U A     O N   A C C E S S . I D   =   U A . A C C E S S _ I D  
 	 	 	 L E F T   O U T E R   J O I N   A U T H _ U S E R S   U S E R S   O N   U A . U S E R _ I D   =   U S E R S . I D   	  
 	 	 	 W H E R E   ( 1   = 1 )   A N D   A C C E S S . G U E S T _ F L G   =   ' ' N ' '   A N D   A C C E S S . A C C E S S _ O R D E R   I S   N O T   N U L L   A N D   A C C E S S _ C D   N O T   L I K E   ' ' % A D M I N % ' ' '      
 I F   ( @ S I T E _ I D   I S   N O T   N U L L   A N D   @ S I T E _ I D   < >   ' ' )  
 	 S E T   @ C O N D I T I O N   =   @ C O N D I T I O N   +   '   A N D   S I T E . I D   =   ' ' '   +     C O N V E R T ( V A R C H A R , @ S I T E _ I D )   +   ' ' ' '  
 S E T   @ S Q L   =   @ S Q L   +   @ C O N D I T I O N   +   '   G R O U P   B Y   S I T E . D E S C R I P T I O N ,   S I T E . I D   O R D E R   B Y   S I T E . D E S C R I P T I O N   A S C '  
 E x e c u t e   S P _ E X E C U T E S Q L     @ S Q L  
 G O  
 