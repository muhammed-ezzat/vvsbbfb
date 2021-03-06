/ * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P _ G E T _ E R R O R _ L O G _ B Y _ D A T E ]         S c r i p t   D a t e :   0 8 / 1 4 / 2 0 1 2   1 3 : 5 7 : 0 0   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E     [ d b o ] . [ S P _ G E T _ E R R O R _ L O G _ B Y _ D A T E ]    
 	 @ F R O M _ D A T E   V A R C H A R ( 5 0 ) ,  
 	 @ T O _ D A T E   V A R C H A R ( 5 0 ) ,  
 	 @ U S E R N A M E   V A R C H A R ( 5 0 )  
 A S  
 B E G I N  
 D E C L A R E   @ S Q L   N V A R C H A R ( 4 0 0 0 )   =   ' ' ;  
 D E C L A R E   @ C O N D I T I O N   N V A R C H A R ( 4 0 0 0 )   =   ' ' ;  
 S E T   @ S Q L   =   ' S E L E C T  
 	 	 	 E L . I D   A S   E L _ I D ,  
 	 	 	 E L . E R R _ C O D E   A S   E L _ E R R _ C O D E ,  
 	 	 	 E L . E R R _ D E S C R I P T I O N   A S   E L _ E R R _ D E S C R I P T I O N ,  
 	 	 	 E L . M O D U L E _ N A M E   A S   E L _ M O D U L E _ N A M E ,  
 	 	 	 E L . F U N C T I O N _ N A M E   A S   E L _ F U N C T I O N _ N A M E ,    
 	 	 	 E L . D A T E _ T I M E _ C R E A T E D   A S   E L _ D A T E _ T I M E _ C R E A T E D ,  
 	 	 	 E L . D A T E _ T I M E _ M O D   A S   E L _ D A T E _ T I M E _ M O D ,  
 	 	 	 E L . M O D _ U S E R _ I D   A S   E L _ M O D _ U S E R _ I D ,  
 	 	 	 E L . A C T I V E   A S   E L _ A C T I V E ,  
 	 	 	 E L . U S E R _ N A M E   A S   E L _ U S E R _ N A M E ,  
 	 	 	 E L . C R E A T E D _ B Y   A S   E L _ C R E A T E D _ B Y  
 	 	 F R O M   E R R O R _ L O G   E L  
 	 W H E R E   ( 1 = 1 ) '  
 I F   ( @ F R O M _ D A T E   I S   N O T   N U L L   A N D   @ F R O M _ D A T E   < >   ' '   A N D   @ T O _ D A T E   I S   N O T   N U L L   A N D   @ T O _ D A T E   < >   ' ' )  
 	 S E T   @ C O N D I T I O N   =   @ C O N D I T I O N   +   '   A N D   c o n v e r t ( D A T E ,   D A T E _ T I M E _ C R E A T E D ,   1 0 1 )   > =   ' ' '   +   @ F R O M _ D A T E   +   ' ' '   A N D   c o n v e r t ( D A T E ,   D A T E _ T I M E _ C R E A T E D ,   1 0 1 )   < =   ' ' '   +     @ T O _ D A T E   +   ' ' ' '  
 I F   ( @ U S E R N A M E   I S   N O T   N U L L   A N D   @ U S E R N A M E   < >   ' ' )  
 	 S E T   @ C O N D I T I O N   =   @ C O N D I T I O N   +   '   A N D   U S E R _ N A M E   =   ' ' '   +     @ U S E R N A M E   +   ' ' ' '  
 	 S E T   @ S Q L   =   @ S Q L   +   @ C O N D I T I O N   +   '   O R D E R   B Y   D A T E _ T I M E _ C R E A T E D   A S C '  
 E x e c u t e   S P _ E X E C U T E S Q L     @ S Q L  
 E N D  
 G O  
 