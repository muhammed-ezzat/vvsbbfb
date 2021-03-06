/ * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P _ D E L E T E _ I N A C T I V E _ U S E R S ]         S c r i p t   D a t e :   0 8 / 1 4 / 2 0 1 2   1 3 : 5 7 : 0 0   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E     [ d b o ] . [ S P _ D E L E T E _ I N A C T I V E _ U S E R S ]   	  
 A S  
 D E C L A R E   @ I N A C T I V E U S E R S   T A B L E   (  
 	 I D   I N T ,  
 	 E M A I L _ I D   V A R C H A R ( 5 5 ) ,  
 	 P A S S W O R D   V A R C H A R ( 5 0 ) ,  
 	 F I R S T _ N A M E   V A R C H A R ( 5 0 ) ,  
 	 L A S T _ N A M E   V A R C H A R ( 5 0 ) ,  
 	 A D D R E S S _ 1   V A R C H A R ( 2 5 0 ) ,  
 	 A D D R E S S _ 2   V A R C H A R ( 2 ) ,  
 	 C I T Y   V A R C H A R ( 5 0 ) ,  
 	 S T A T E   C H A R ( 2 ) ,  
 	 Z I P   V A R C H A R ( 1 0 ) ,  
 	 P H O N E   V A R C H A R ( 1 0 ) ,  
 	 C R E A T E D _ I P   V A R C H A R ( 2 0 ) ,  
 	 R E G I S T E R E D _ N O D E   V A R C H A R ( 5 0 ) ,  
 	 C R E A T E D _ B Y   V A R C H A R ( 5 0 ) ,  
 	 L A S T _ L O G I N _ T I M E   D A T E T I M E ,  
 	 D A T E _ T I M E _ C R E A T E D   D A T E T I M E ,  
 	 D A T E _ T I M E _ M O D   D A T E T I M E ,  
 	 M O D _ U S E R _ I D   V A R C H A R ( 5 0 ) ,  
 	 A C T I V E   C H A R ( 1 )    
 )  
  
 I N S E R T   I N T O   @ I N A C T I V E U S E R S    
 	 S E L E C T  
 	 	 I D ,    
 	 	 E M A I L _ I D ,    
 	 	 P A S S W O R D ,    
 	 	 F I R S T _ N A M E ,    
 	 	 L A S T _ N A M E ,   	 	  
 	 	 A D D R E S S _ 1 ,    
 	 	 A D D R E S S _ 2 ,    
 	 	 C I T Y ,    
 	 	 S T A T E ,    
 	 	 Z I P ,    
 	 	 P H O N E ,    
 	 	 C R E A T E D _ I P ,    
 	 	 R E G I S T E R E D _ N O D E ,    
 	 	 C R E A T E D _ B Y ,  
 	 	 C U R R E N T _ L O G I N _ T I M E ,  
 	 	 D A T E _ T I M E _ C R E A T E D ,  
 	 	 G E T D A T E ( )   A S   D A T E _ T I M E _ M O D ,  
 	 	 ' S Y S T E M '   A S   M O D _ U S E R _ I D ,  
 	 	 ' Y '   A S   A C T I V E  
 	 F R O M   A U T H _ U S E R S   U S E R S    
 	 W H E R E    
 	 N O T   E X I S T S   ( S E L E C T   U S E R _ I D   F R O M   E C O M M _ R E C U R _ T X _ H I S T _ I N F O   R E C U R   W H E R E   R E C U R . U S E R _ I D   =   U S E R S . I D )   A N D    
 	 N O T   E X I S T S   ( S E L E C T   U S E R _ I D   F R O M   E C O M M _ W E B P A Y _ T X   W E B   W H E R E   W E B . U S E R _ I D   =   U S E R S . I D )   A N D    
 	 N O T   E X I S T S   ( S E L E C T   U S E R _ I D   F R O M   E C O M M _ C C I N F O   C C I N F O   W H E R E   C C I N F O . U S E R _ I D   =   U S E R S . I D )   A N D    
 	 N O T   E X I S T S   ( S E L E C T   U S E R _ I D   F R O M   A U T H _ U S E R S _ A L E R T S   A L E R T S   W H E R E   A L E R T S . U S E R _ I D   =   U S E R S . I D )   A N D    
 	 N O T   E X I S T S   ( S E L E C T   U S E R _ I D   F R O M   E C O M M _ U S E R S _ P U R C H A S E S   P U R C H A S E S   W H E R E   P U R C H A S E S . U S E R _ I D   =   U S E R S . I D )   A N D    
 	 N O T   E X I S T S   ( S E L E C T   U S E R _ I D   F R O M   E C O M M _ U S E R S _ H I S T O R Y   U S E R H I S T O R Y   W H E R E   U S E R H I S T O R Y . U S E R _ I D   =   U S E R S . I D )   A N D    
 	 C U R R E N T _ L O G I N _ T I M E   <   G E T D A T E ( )   -   ( S E L E C T   T O P   1   U S E R _ R E T E N T I O N _ D A Y S   F R O M   E C O M M _ S I T E   S I T E    
 	 	 	 	 	 	 	 	 	 	     I N N E R   J O I N   E C O M M _ S I T E _ A C C E S S   S I T E A C C E S S   O N   S I T E A C C E S S . S I T E _ I D   =   S I T E . I D    
 	 	 	 	 	 	 	 	 	 	     I N N E R   J O I N   A U T H _ A C C E S S   A C C E S S   O N   A C C E S S . I D   =   S I T E A C C E S S . A C C E S S _ I D  
 	 	 	 	 	 	 	 	 	 	     I N N E R   J O I N   A U T H _ U S E R S _ A C C E S S   U S E R A C C E S S   O N   ( U S E R A C C E S S . A C C E S S _ I D   =   A C C E S S . I D   A N D   U S E R A C C E S S . U S E R _ I D   =     U S E R S . I D ) )   A N D  
 	 E M A I L _ I D   N O T   L I K E   ' % a d m i n @ % '  
  
 D E L E T E   F R O M   E C O M M _ U S E R S _ S H O P P I N G _ C A R T   W H E R E   U S E R _ I D   I N   ( S E L E C T   I D   F R O M   @ I N A C T I V E U S E R S )  
 D E L E T E   F R O M   A U T H _ U S E R S _ T E R M S   W H E R E   U S E R _ I D   I N   ( S E L E C T   I D   F R O M   @ I N A C T I V E U S E R S )  
 D E L E T E   F R O M   A U T H _ U S E R S _ E V E N T S   W H E R E   U S E R _ I D   I N   ( S E L E C T   I D   F R O M   @ I N A C T I V E U S E R S )  
 D E L E T E   F R O M   A U T H _ U S E R S _ A C C E S S   W H E R E   U S E R _ I D   I N   ( S E L E C T   I D   F R O M   @ I N A C T I V E U S E R S )  
 D E L E T E   F R O M   A U T H _ U S E R S   W H E R E   I D   I N   ( S E L E C T   I D   F R O M   @ I N A C T I V E U S E R S )  
  
 I N S E R T   I N T O   A U T H _ U S E R S _ A R C H I V E ( E M A I L _ I D , P A S S W O R D , F I R S T _ N A M E , L A S T _ N A M E , A D D R E S S _ 1 , A D D R E S S _ 2 , C I T Y , S T A T E , Z I P , P H O N E , C R E A T E D _ I P , R E G I S T E R E D _ N O D E , C R E A T E D _ B Y , L A S T _ L O G I N _ T I M E , D A T E _ T I M E _ C R E A T E D , D A T E _ T I M E _ M O D , M O D _ U S E R _ I D , A C T I V E )    
 	                                         S E L E C T   E M A I L _ I D , P A S S W O R D , F I R S T _ N A M E , L A S T _ N A M E , A D D R E S S _ 1 , A D D R E S S _ 2 , C I T Y , S T A T E , Z I P , P H O N E , C R E A T E D _ I P , R E G I S T E R E D _ N O D E , C R E A T E D _ B Y , L A S T _ L O G I N _ T I M E , D A T E _ T I M E _ C R E A T E D , D A T E _ T I M E _ M O D , M O D _ U S E R _ I D , A C T I V E   F R O M   @ I N A C T I V E U S E R S  
 G O  
 