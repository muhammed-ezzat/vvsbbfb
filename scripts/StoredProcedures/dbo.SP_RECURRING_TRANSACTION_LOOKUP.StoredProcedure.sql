/ * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P _ R E C U R R I N G _ T R A N S A C T I O N _ L O O K U P ]         S c r i p t   D a t e :   0 8 / 1 4 / 2 0 1 2   1 3 : 5 7 : 0 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E     [ d b o ] . [ S P _ R E C U R R I N G _ T R A N S A C T I O N _ L O O K U P ]    
 	 	 @ T R A N S A C T I O N _ R E F _ N U M   V A R C H A R ( 5 0 ) ,   @ S I T E _ N A M E   V A R C H A R ( 5 0 ) 	  
 A S  
 B E G I N  
 D E C L A R E   @ S Q L   N V A R C H A R ( 4 0 0 0 )   =   ' ' ;  
 D E C L A R E   @ C O N D I T I O N   N V A R C H A R ( 4 0 0 0 )   =   ' ' ;  
 S E T   @ S Q L   =   ' S E L E C T  
                           r e c u r T X . I D   A S   r e c u r T X _ I D  
                         , r e c u r T X . T X _ R E F E R E N C E _ N U M   A S   r e c u r T X _ T X _ R E F E R E N C E _ N U M  
                         , r e c u r T X . O R G _ R E F _ N U M   A S   r e c u r T X _ O R G _ R E F _ N U M  
                         , r e c u r T X . T X _ A M O U N T   A S   r e c u r T X _ T X _ A M O U N T  
                         , r e c u r T X . C O M M E N T S   A S   r e c u r T X _ C O M M E N T S  
                         , r e c u r T X . T X _ T Y P E   A S   r e c u r T X _ T X _ T Y P E  
                         , r e c u r T X . C H E C K N U M   A S   r e c u r T X _ C H E C K N U M  
                         , r e c u r T X . T X _ D A T E   A S   r e c u r T X _ T X _ D A T E     	                                          
                         , r e c u r T X . C A R D _ N U M B E R   A S   r e c u r T X _ C A R D _ N U M B E R  
                         , r e c u r T X . A C C O U N T N A M E   A S   r e c u r T X _ A C C O U N T N A M E                          
                         , r e c u r T X . M A C H I N E N A M E   A S   r e c u r T X _ M A C H I N E N A M E  
                         , r e c u r T X . M O D _ U S E R _ I D   A S   r e c u r T X _ M O D _ U S E R _ I D  
                         , r e c u r T X . D A T E _ T I M E _ C R E A T E D   A S   r e c u r T X _ D A T E _ T I M E _ C R E A T E D  
                         , r e c u r T X . S E T T L E M E N T _ S T A T U S   A S   r e c u r T X _ S E T T L E M E N T _ S T A T U S  
                         , s i t e . I D   A S   s i t e _ I D  
                         , s i t e . N A M E   A S   s i t e _ N A M E  
                         , m e r c h a n t . I D   A S   m e r c h a n t _ I D  
                         , m e r c h a n t . P A R T N E R   A S   m e r c h a n t _ P A R T N E R  
                         , m e r c h a n t . V E N D O R N A M E   A S   m e r c h a n t _ V E N D O R N A M E  
                         , m e r c h a n t . U S E R N A M E   A S   m e r c h a n t _ U S E R N A M E  
                         , m e r c h a n t . P A S S W O R D   A S   m e r c h a n t _ P A S S W O R D  
                         , r e c u r T X . U S E R _ I D   A S   r e c u r T X _ U S E R _ I D  
                         , r e c u r T x . A C C E S S _ I D   A S   r e c u r T x _ A C C E S S _ I D  
                         , r e c u r T x . P A Y _ P A L _ I D   A S   r e c u r T x _ P A Y _ P A L _ I D  
                         , r e c u r T x . C A R D _ T Y P E   A S   r e c u r T x _ C A R D _ T Y P E  
                         , r e c u r T x . A U T H _ C O D E   A S   r e c u r T x _ A U T H _ C O D E  
                         , r e c u r T x . C R E A T E D _ B Y   A S   r e c u r T x _ C R E A T E D _ B Y  
                         , r e c u r T x . A M O U N T   A S   r e c u r T x _ A M O U N T  
                         , m e r c h a n t . T R A N _ F E E _ P E R C E N T A G E   A S   m e r c h a n t _ T R A N _ F E E _ P E R C E N T A G E  
                         , m e r c h a n t . T R A N _ F E E _ F L A T   A S   m e r c h a n t _ T R A N _ F E E _ F L A T                          
                         , s h a r e . C L I E N T _ S H A R E   A S   s h a r e _ C L I E N T _ S H A R E  
                         , r e c u r T x . I S _ D O W N G R A D E _ F E E   A S   r e c u r T x _ D O W N G R A D E _ F E E  
                         , r e c u r T x . I S _ P R E V I O U S _ A C C E S S   A S   r e c u r T x _ P R E V I O U S _ A C C E S S  
             F R O M  
                         E C O M M _ R E C U R _ T X _ H I S T _ I N F O   r e c u r T X    
                         I N N E R   J O I N   A U T H _ A C C E S S   A C C E S S   O N   A C C E S S . I D   =   r e c u r T X . A C C E S S _ I D  
                         L E F T   O U T E R   J O I N   E C O M M _ P R O F I T _ S H A R E   s h a r e   O N   S H A R E . A C C E S S _ I D   =   A C C E S S . I D  
                         I N N E R   J O I N   E C O M M _ S I T E _ A C C E S S   S I T E A C C E S S   O N   S I T E A C C E S S . A C C E S S _ I D   =   A C C E S S . I D                          
                         I N N E R   J O I N   E C O M M _ S I T E   s i t e   O N   s i t e . I D   =   S I T E A C C E S S . S I T E _ I D  
                         I N N E R   J O I N   E C O M M _ M E R C H A N T I N F O   m e r c h a n t   o n   m e r c h a n t . S I T E _ I D   =   s i t e . I D 	  
 	 W H E R E   ( 1 = 1 )   A N D   M E R C H A N T . I D   =   r e c u r T X . M E R C H A N T _ I D '  
 S E T   @ C O N D I T I O N   =   @ C O N D I T I O N   +   '   A N D   r e c u r T X . T X _ R E F E R E N C E _ N U M   =   ' ' '   +   @ T R A N S A C T I O N _ R E F _ N U M   +   ' ' ' '  
 I F   ( @ S I T E _ N A M E   I S   N O T   N U L L   A N D   @ S I T E _ N A M E   < >   ' ' )  
 	 S E T   @ C O N D I T I O N   =   @ C O N D I T I O N   +   '   A N D   S I T E . N A M E   =   ' ' '   +     @ S I T E _ N A M E   +   ' ' ' '  
 S E T   @ S Q L   =   @ S Q L   +   @ C O N D I T I O N    
 E x e c u t e   S P _ E X E C U T E S Q L     @ S Q L  
  
 E N D  
 G O  
 