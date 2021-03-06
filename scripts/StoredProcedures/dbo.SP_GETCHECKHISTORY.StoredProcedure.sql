/ * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P _ G E T C H E C K H I S T O R Y ]         S c r i p t   D a t e :   0 8 / 1 4 / 2 0 1 2   1 3 : 5 7 : 0 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ S P _ G E T C H E C K H I S T O R Y ]    
 	 	 @ S I T E _ I D   I N T ,   @ F R O M _ D A T E   V A R C H A R ( 2 0 ) ,   @ T O _ D A T E   V A R C H A R ( 2 0 ) 	  
 A S  
 B E G I N  
 D E C L A R E   @ S Q L   N V A R C H A R ( 4 0 0 0 )   =   ' ' ;  
 D E C L A R E   @ C O N D I T I O N   N V A R C H A R ( 4 0 0 0 )   =   ' ' ;  
 S E T   @ S Q L   =   ' S E L E C T  
 	 	 	       S I T E . N A M E   A S   S I T E _ N A M E ,  
 	 	 	       H I S T . I D   A S   H I S T _ I D ,  
 	 	 	       H I S T . C H E C K N U M   A S   H I S T _ C H E C K N U M ,  
 	 	 	       H I S T . P A Y M E N T _ T Y P E   A S   H I S T _ P A Y M E N T _ T Y P E ,  
 	 	 	       H I S T . T O T A L _ T R A N S A C T I O N S   A S   H I S T _ T O T A L _ T R A N S A C T I O N S ,  
 	 	 	       H I S T . A M O U N T   A S   H I S T _ A M O U N T ,  
 	 	 	       E B . B A N K _ N A M E   A S   E B _ B A N K _ N A M E ,  
 	 	 	       H I S T . I S _ V O I D E D   A S   H I S T _ I S _ V O I D E D ,  
 	 	 	       H I S T . D A T E _ T I M E _ C R E A T E D   A S   H I S T _ D A T E _ T I M E _ C R E A T E D ,  
 	 	 	       H I S T . D A T E _ T I M E _ M O D   A S   H I S T _ D A T E _ T I M E _ M O D ,  
 	 	 	       H I S T . M O D _ U S E R _ I D   A S   H I S T _ M O D _ U S E R _ I D ,  
 	 	 	       H I S T . M A C H I N E N A M E   A S   H I S T _ M A C H I N E N A M E ,  
 	 	 	       H I S T . A C T I V E   A S   H I S T _ A C T I V E ,  
 	 	 	       H I S T . C O M M E N T S   A S   H I S T _ C O M M E N T S ,  
 	 	 	       H I S T . C R E A T E D _ B Y   A S   H I S T _ C R E A T E D _ B Y    
             F R O M  
                       E C O M M _ C H E C K _ H I S T   H I S T    
                       I N N E R   J O I N   E C O M M _ S I T E   S I T E   O N   S I T E . I D   =   H I S T . S I T E _ I D 	  
                       I N N E R   J O I N   E C O M M _ B A N K _ D E T A I L S   E B   O N   S I T E . I D   =   E B . S I T E _ I D  
 	 W H E R E   ( 1 = 1 ) '  
 I F   ( @ F R O M _ D A T E   I S   N O T   N U L L   A N D   @ F R O M _ D A T E   < >   ' '   A N D   @ T O _ D A T E   I S   N O T   N U L L   A N D   @ T O _ D A T E   < >   ' ' )  
 	 S E T   @ C O N D I T I O N   =   @ C O N D I T I O N   +   '   A N D   c o n v e r t ( D A T E ,   H I S T . D A T E _ T I M E _ C R E A T E D ,   1 0 1 )   > =   ' ' '   +   @ F R O M _ D A T E   +   ' ' '   A N D   c o n v e r t ( D A T E ,   H I S T . D A T E _ T I M E _ C R E A T E D ,   1 0 1 )   < =   ' ' '   +     @ T O _ D A T E   +   ' ' ' '  
 I F   ( @ S I T E _ I D   I S   N O T   N U L L   A N D   @ S I T E _ I D   < >   ' ' )  
 	 S E T   @ C O N D I T I O N   =   @ C O N D I T I O N   +   '   A N D   S I T E . I D   =   ' ' '   +     C O N V E R T ( V A R C H A R , @ S I T E _ I D )   +   ' ' ' '  
  
 S E T   @ S Q L   =   @ S Q L   +   @ C O N D I T I O N   +   '   O R D E R   B Y   H I S T . D A T E _ T I M E _ C R E A T E D   d e s c '  
 E x e c u t e   S P _ E X E C U T E S Q L     @ S Q L  
 E N D  
 G O  
 