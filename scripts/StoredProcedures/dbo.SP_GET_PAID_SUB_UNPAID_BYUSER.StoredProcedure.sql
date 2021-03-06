/ * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P _ G E T _ P A I D _ S U B _ U N P A I D _ B Y U S E R ]         S c r i p t   D a t e :   0 8 / 1 4 / 2 0 1 2   1 3 : 5 7 : 0 0   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E     [ d b o ] . [ S P _ G E T _ P A I D _ S U B _ U N P A I D _ B Y U S E R ]    
 	 @ U S E R N A M E   V A R C H A R ( 5 0 ) ,  
 	 @ N O D E N A M E   V A R C H A R ( 5 0 )  
 A S    
 B E G I N  
 D E C L A R E   @ S Q L   N V A R C H A R ( 4 0 0 0 )   =   ' ' ;  
 D E C L A R E   @ C O N D I T I O N   N V A R C H A R ( 4 0 0 0 )   =   ' ' ;  
 S E T   @ S Q L   =   ' S E L E C T  
             E S A . S I T E _ I D     A S   E S A _ S I T E _ I D ,  
             ( S E L E C T   S I T E . D E S C R I P T I O N   A S   S I T E _ D E S C R I P T I O N   F R O M   E C O M M _ S I T E   S I T E   W H E R E   S I T E . I D   =   E S A . S I T E _ I D )   A S   S I T E ,                          
             A A . A C C E S S _ C D   A S   A A _ A C C E S S _ C D ,              
             A A . A C C E S S _ D E S C R   A S   A A _ A C C E S S _ D E S C R ,  
             E S F . F E E   A S   E S F _ F E E ,            
             ( S E L E C T   L O O K U P 1 . C O D E   A S   L O O K U P 1 _ C O D E   F R O M   C O D E L O O K U P   L O O K U P 1   W H E R E   L O O K U P 1 . I D   =   E S F . S U B S C R I P T I O N _ T Y P _ I D )   A S   P E R I O D ,  
             ( S E L E C T   L O O K U P 2 . D E S C R I P T I O N   F R O M   C O D E L O O K U P   L O O K U P 2   W H E R E   L O O K U P 2 . I D   =   E S F . S U B S C R I P T I O N _ T Y P _ I D )   A S   P E R I O D D E S C ,  
             A U A . I D   A S   A U A _ I D ,  
             A A . I S _ A U T H O R I Z A T I O N _ R E Q U I R E D   A S   A A _ I S _ A U T H O R I Z A T I O N _ R E Q U I R E D ,  
             A U A . I S _ A U T H O R I Z E D   A S   A U A _ I S _ A U T H O R I Z E D ,  
             A U A . I S _ A C C E S S _ O V E R R I D D E N   A S   A U A _ I S _ A C C E S S _ O V E R R I D D E N            
 F R O M  
             A U T H _ A C C E S S   A A  
             I N N E R   J O I N   A U T H _ U S E R S _ A C C E S S   A U A   O N   A U A . A C C E S S _ I D   =   A A . I D  
             I N N E R   J O I N   A U T H _ U S E R S   A U   O N   A U A . U S E R _ I D   =   A U . I D            
             I N N E R   J O I N   E C O M M _ S I T E _ A C C E S S   E S A   O N   E S A . A C C E S S _ I D   =   A A . I D  
             I N N E R   J O I N   E C O M M _ S I T E   S I T E   O N   E S A . S I T E _ I D   =   S I T E . I D  
             I N N E R   J O I N   E C O M M _ N O D E   N O D E   O N   N O D E . I D   =   S I T E . N O D E _ I D  
             I N N E R   J O I N   E C O M M _ S U B S C R I P T I O N F E E   E S F   O N   E S F . S I T E A C C E S S _ I D   =   E S A . I D  
             I N N E R   J O I N   C O D E L O O K U P   L O O K U P   O N   E S F . S U B S C R I P T I O N _ T Y P _ I D   =   L O O K U P . I D   W H E R E   ( 1 = 1 )   A N D   A U A . I S _ A C C E S S _ O V E R R I D D E N   =   ' ' N ' '   '              
 S E T   @ C O N D I T I O N   =   @ C O N D I T I O N   +   '   A N D   L O O K U P . C A T E G O R Y   =   ' ' R E C U R R I N G _ S U B S C R I P T I O N ' '   A N D   E S F . F E E   >   0   A N D                  
             A A . A C C E S S _ C D   N O T   I N   (  
                                                                 S E L E C T   P A I D A C C E S S   F R O M   V _ G E T U S E R A C C E S S _ P A I D  
                                                                 W H E R E   U S E R N A M E   =   ' ' '   +   @ U S E R N A M E   +   ' ' '  
                                                     ) '  
 I F   ( @ U S E R N A M E   I S   N O T   N U L L   A N D   @ U S E R N A M E   < >   ' ' )  
 	 S E T   @ C O N D I T I O N   =   @ C O N D I T I O N   +   '   A N D   A U . E M A I L _ I D   =   ' ' '   +     @ U S E R N A M E   +   ' ' ' '  
 I F   ( @ N O D E N A M E   I S   N O T   N U L L   A N D   @ N O D E N A M E   < >   ' ' )  
 	 S E T   @ C O N D I T I O N   =   @ C O N D I T I O N   +   '   A N D   N O D E . N A M E   =   ' ' '   +     @ N O D E N A M E   +   ' ' ' '  
 S E T   @ S Q L   =   @ S Q L   +   @ C O N D I T I O N    
 E x e c u t e   S P _ E X E C U T E S Q L     @ S Q L  
 - - p r i n t   @ s q l  
 E N D  
 G O  
 