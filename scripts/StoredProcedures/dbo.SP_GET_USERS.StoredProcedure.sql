/ * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P _ G E T _ U S E R S ]         S c r i p t   D a t e :   0 8 / 1 4 / 2 0 1 2   1 3 : 5 7 : 0 1   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E     [ d b o ] . [ S P _ G E T _ U S E R S ]   	  
 A S  
 S E L E C T      
     U S E R S . I D   A S   U S E R _ I D  
   , U S E R S . E M A I L _ I D   A S   U S E R S _ E M A I L _ I D    
   , U S E R S . F I R S T _ N A M E   A S   U S E R S _ F I R S T _ N A M E  
   , U S E R S . L A S T _ N A M E   A S   U S E R S _ L A S T _ N A M E  
   , U S E R S . A C T I V E   A S   U S E R S _ A C T I V E  
   , U S E R S . A C C O U N T _ N O N L O C K E D   A S   U S E R S _ A C C O U N T _ N O N L O C K E D  
   , I S C A R D A V A I L A B L E   =    
 	 C A S E   W H E N   C C . A C C O U N T N U M B E R   I S   N O T   N U L L   T H E N   ' Y '  
 	 	 E L S E   ' N '  
 	 E N D  
   , I S C A R D A C T I V E   =   C C . A C T I V E 	    
   , C C . A C C O U N T N U M B E R   A S   C C _ A C C O U N T N U M B E R  
   , ' Y '   A S   F I E L D 1  
   , ' Y '   A S   F I E L D 2  
   , U S E R S . L A S T _ L O G I N _ T I M E   A S   U S E R S _ L A S T _ L O G I N _ T I M E  
   , U S E R S . D A T E _ T I M E _ C R E A T E D   A S   U S E R S _ D A T E _ T I M E _ C R E A T E D  
 F R O M  
             A U T H _ U S E R S   U S E R S  
             L E F T   O U T E R   J O I N   E C O M M _ C C I N F O   C C   O N   U S E R S . I D   =   C C . U S E R _ I D  
 G O  
 