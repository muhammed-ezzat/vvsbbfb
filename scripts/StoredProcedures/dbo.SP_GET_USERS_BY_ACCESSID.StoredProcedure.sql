/ * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P _ G E T _ U S E R S _ B Y _ A C C E S S I D ]         S c r i p t   D a t e :   0 8 / 1 4 / 2 0 1 2   1 3 : 5 7 : 0 1   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E     [ d b o ] . [ S P _ G E T _ U S E R S _ B Y _ A C C E S S I D ]   	  
 	 	 @ A C C E S S _ I D   I N T  
 A S  
 S E T   N O C O U N T   O N  
 D E C L A R E   @ S Q L   N V A R C H A R ( 4 0 0 0 )   =   ' ' ;  
 D E C L A R E   @ C O N D I T I O N   N V A R C H A R ( 4 0 0 0 )   =   ' ' ;  
 S E T   @ S Q L   =   ' S E L E C T    
 	 	 	 U S E R S . I D   A S   U S E R S _ I D  
 	 	 	 , U S E R S . E M A I L _ I D   A S   U S E R S _ E M A I L _ I D  
 	 	 	 , U S E R S . F I R S T _ N A M E   A S   U S E R S _ F I R S T _ N A M E  
 	 	 	 , U S E R S . L A S T _ N A M E   A S   U S E R S _ L A S T _ N A M E  
 	 	 	 , U S E R S . A D D R E S S _ 1   A S   U S E R S _ A D D R E S S _ 1  
 	 	 	 , U S E R S . A D D R E S S _ 2   A S   U S E R S _ A D D R E S S _ 2  
 	 	 	 , U S E R S . C I T Y   A S   U S E R S _ C I T Y  
 	 	 	 , U S E R S . S T A T E   A S   U S E R S _ S T A T E  
 	 	 	 , U S E R S . Z I P   A S   U S E R S _ Z I P  
 	 	 	 , U S E R S . P H O N E   A S   U S E R S _ P H O N E  
 	 	 	 , U S E R S . R E G I S T E R E D _ N O D E   A S   U S E R S _ R E G I S T E R E D _ N O D E    
 	 	 	 , U S E R S . L A S T _ L O G I N _ T I M E   A S   U S E R S _ L A S T _ L O G I N _ T I M E    
 	 	 	 , U S E R S . A C C O U N T _ N O N L O C K E D   A S   U S E R S _ A C C O U N T _ N O N L O C K E D    
 	 	 	 , U S E R S . C R E D E N I A L S _ N O N E X P I R E D   A S   U S E R S _ C R E D E N I A L S _ N O N E X P I R E D  
 	 	 	 , U S E R S . C U R R E N T _ L O G I N _ T I M E   A S   U S E R S _ C U R R E N T _ L O G I N _ T I M E  
 	 	 	 , U S E R S . M O D _ U S E R _ I D   A S   U S E R S _ M O D _ U S E R _ I D  
 	 	 	 , U S E R S . D A T E _ T I M E _ C R E A T E D   A S   U S E R S _ D A T E _ T I M E _ C R E A T E D  
 	 	 	 , U S E R S . D A T E _ T I M E _ M O D   A S   U S E R S _ D A T E _ T I M E _ M O D  
 	 	 	 , U S E R S . C R E A T E D _ B Y   A S   U S E R S _ C R E A T E D _ B Y  
 	 	 	 , U S E R S . A C T I V E   A S   U S E R S _ A C T I V E 	  
 	 	 	 , U S E R S . A C C O U N T _ N O N E X P I R E D   A S   U S E R S _ A C C O U N T _ N O N E X P I R E D 	   	  
 	 	 	 , A C C E S S . A C C E S S _ D E S C R   A S   A C C E S S _ A C C E S S _ D E S C R  
 	 	 	 F R O M   A U T H _ U S E R S   U S E R S  
 	 	 	 I N N E R   J O I N   A U T H _ U S E R S _ A C C E S S   U A   O N   U A . U S E R _ I D   =   U S E R S . I D  
 	 	 	 I N N E R   J O I N   A U T H _ A C C E S S   A C C E S S   O N   A C C E S S . I D   =   U A . A C C E S S _ I D  
 	 	 	 I N N E R   J O I N   E C O M M _ S I T E _ A C C E S S   S A   O N   S A . A C C E S S _ I D   =   A C C E S S . I D  
 	 	 	 I N N E R   J O I N   E C O M M _ S I T E   S I T E   O N   S I T E . I D   =   S A . S I T E _ I D 	 	 	  
 	 	 	 W H E R E   ( 1   = 1 )   A N D   A C C E S S . G U E S T _ F L G   =   ' ' N ' '   A N D   A C C E S S _ C D   N O T   L I K E   ' ' % A D M I N % ' ' '      
 I F   ( @ A C C E S S _ I D   I S   N O T   N U L L   A N D   @ A C C E S S _ I D   < >   ' ' )  
 	 S E T   @ C O N D I T I O N   =   @ C O N D I T I O N   +   '   A N D   A C C E S S . I D   =   ' ' '   +     C O N V E R T ( V A R C H A R , @ A C C E S S _ I D )   +   ' ' ' '  
 S E T   @ S Q L   =   @ S Q L   +   @ C O N D I T I O N    
 E x e c u t e   S P _ E X E C U T E S Q L     @ S Q L  
 G O  
 