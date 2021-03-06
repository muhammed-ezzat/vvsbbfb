/ * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P _ G E T U S E R D E T A I L S _ F O R _ A D M I N ]         S c r i p t   D a t e :   0 8 / 1 4 / 2 0 1 2   1 3 : 5 7 : 0 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E     [ d b o ] . [ S P _ G E T U S E R D E T A I L S _ F O R _ A D M I N ]    
 	 @ U S E R N A M E   V A R C H A R ( 5 0 )  
 A S  
 B E G I N  
  
 D E C L A R E   @ S Q L 1   N V A R C H A R ( 4 0 0 0 )   =   ' ' ;  
 D E C L A R E   @ C O N D I T I O N 1   N V A R C H A R ( 4 0 0 0 )   =   ' ' ;  
 D E C L A R E   @ S Q L 2   N V A R C H A R ( 4 0 0 0 )   =   ' ' ;  
 D E C L A R E   @ C O N D I T I O N 2   N V A R C H A R ( 4 0 0 0 )   =   ' ' ;  
 D E C L A R E   @ S Q L 3   N V A R C H A R ( 4 0 0 0 )   =   ' ' ;  
 D E C L A R E   @ C O N D I T I O N 3   N V A R C H A R ( 4 0 0 0 )   =   ' ' ;  
 D E C L A R E   @ P a r m D e f i n i t i o n 1   N V A R C H A R ( 5 0 0 ) ;  
 D E C L A R E   @ P a r m D e f i n i t i o n 2   N V A R C H A R ( 5 0 0 ) ;  
  
 D E C L A R E   @ T O T A L A M O U N T   I N T  
 S E T   @ P a r m D e f i n i t i o n 1   =   N ' @ T O T A L A M O U N T O U T   I N T   O U T P U T '  
 S E T   @ S Q L 1   =   N ' S E L E C T   @ T O T A L A M O U N T O U T   =   S U M ( F E E )   F R O M   E C O M M _ S U B S C R I P T I O N F E E   F E E    
 I N N E R   J O I N   E C O M M _ S I T E _ A C C E S S   S I T E A C C E S S   O N   S I T E A C C E S S . I D   =   F E E . S I T E A C C E S S _ I D  
 I N N E R   J O I N   A U T H _ U S E R S _ A C C E S S   U S E R A C C E S S   O N   U S E R A C C E S S . A C C E S S _ I D   =   S I T E A C C E S S . A C C E S S _ I D  
 I N N E R   J O I N   A U T H _ U S E R S   U S E R S   O N   U S E R S . I D   =   U S E R A C C E S S . U S E R _ I D  
 I N N E R   J O I N   E C O M M _ S I T E   S I T E   O N   S I T E . I D   =   S I T E A C C E S S . S I T E _ I D  
 I N N E R   J O I N   E C O M M _ N O D E   N O D E   O N   N O D E . I D   =   S I T E . N O D E _ I D  
 W H E R E   ( 1 = 1 ) '  
 I F   ( @ U S E R N A M E   I S   N O T   N U L L   A N D   @ U S E R N A M E   < >   ' ' )  
 	 S E T   @ C O N D I T I O N 1   =   @ C O N D I T I O N 1   +   '   A N D   U S E R S . E M A I L _ I D   =   ' ' '   +   @ U S E R N A M E   +   ' ' ' '  
 S E T   @ S Q L 1   =   @ S Q L 1   +   @ C O N D I T I O N 1  
 E x e c u t e   S P _ E X E C U T E S Q L     @ S Q L 1 ,   @ P a r m D e f i n i t i o n 1 ,   @ T O T A L A M O U N T O U T = @ T O T A L A M O U N T   O U T P U T ;  
  
 D E C L A R E   @ A M O U N T D U E   I N T  
 S E T   @ P a r m D e f i n i t i o n 2   =   N ' @ A M O U N T D U E O U T   I N T   O U T P U T '  
 S E T   @ S Q L 2   =   N ' S E L E C T   @ A M O U N T D U E O U T   =   S U M ( F E E )   F R O M   E C O M M _ S U B S C R I P T I O N F E E   F E E    
 I N N E R   J O I N   E C O M M _ S I T E _ A C C E S S   S I T E A C C E S S   O N   S I T E A C C E S S . I D   =   F E E . S I T E A C C E S S _ I D  
 I N N E R   J O I N   A U T H _ U S E R S _ A C C E S S   U S E R A C C E S S   O N   U S E R A C C E S S . A C C E S S _ I D   =   S I T E A C C E S S . A C C E S S _ I D  
 I N N E R   J O I N   A U T H _ U S E R S   U S E R S   O N   U S E R S . I D   =   U S E R A C C E S S . U S E R _ I D  
 I N N E R   J O I N   E C O M M _ S I T E   S I T E   O N   S I T E . I D   =   S I T E A C C E S S . S I T E _ I D  
 I N N E R   J O I N   E C O M M _ N O D E   N O D E   O N   N O D E . I D   =   S I T E . N O D E _ I D  
 W H E R E   ( 1 = 1 )    
 A N D   U S E R A C C E S S . I D   N O T   I N   ( S E L E C T   U S E R _ A C C E S S _ I D   F R O M   E C O M M _ U S E R S _ A C C O U N T   W H E R E   A C T I V E   =   ' ' Y ' ' )  
 A N D   F E E . S U B S C R I P T I O N _ T Y P _ I D   I N   ( S E L E C T   I D   F R O M   C O D E L O O K U P   W H E R E   C A T E G O R Y   =   ' ' R E C U R R I N G _ S U B S C R I P T I O N ' ' ) '  
 I F   ( @ U S E R N A M E   I S   N O T   N U L L   A N D   @ U S E R N A M E   < >   ' ' )  
 	 S E T   @ C O N D I T I O N 2   =   @ C O N D I T I O N 2   +   '   A N D   U S E R S . E M A I L _ I D   =   ' ' '   +   @ U S E R N A M E   +   ' ' ' '  
 S E T   @ S Q L 2   =   @ S Q L 2   +   @ C O N D I T I O N 2  
 E x e c u t e   S P _ E X E C U T E S Q L     @ S Q L 2 ,   @ P a r m D e f i n i t i o n 2 ,   @ A M O U N T D U E O U T = @ A M O U N T D U E   O U T P U T ;  
  
 	  
 D E C L A R E   @ A C C O U N T N U M B E R   A S   V A R C H A R ( 1 0 0 )   =   ' '  
 D E C L A R E   @ I S C A R D A C T I V E   C H A R ( 1 )   =   ' N '  
 ( S E L E C T   T O P   1   @ A C C O U N T N U M B E R   =   A C C O U N T N U M B E R ,   @ I S C A R D A C T I V E   =   A C T I V E   F R O M   E C O M M _ C C I N F O   C C   W H E R E   C C . U S E R _ I D   I N   ( S E L E C T   T O P   1   I D   F R O M   A U T H _ U S E R S   W H E R E   E M A I L _ I D   =   @ U S E R N A M E ) )  
  
 D E C L A R E   @ I S P A I D U S E R   C H A R ( 1 )   =   ' N '  
 D E C L A R E   @ I S P A Y M E N T D U E   C H A R ( 1 )   =   ' N '  
 D E C L A R E   @ I S C A R D A V A I L A B L E   C H A R ( 1 )   =   ' N '  
  
 I F   ( @ T O T A L A M O U N T   >   0 )  
 	 S E T   @ I S P A I D U S E R   =   ' Y '  
 I F   ( @ A M O U N T D U E   >   0 )  
 	 S E T   @ I S P A Y M E N T D U E   =   ' Y '  
 I F   ( @ A C C O U N T N U M B E R   I S   N O T   N U L L   A N D   @ A C C O U N T N U M B E R   < >   ' ' )  
 	 S E T   @ I S C A R D A V A I L A B L E   =   ' Y '  
  
 S E T   @ S Q L 3   =   ' S E L E C T      
 	 U S E R S . I D   A S   U S E R S _ I D  
 	 , U S E R S . E M A I L _ I D   A S   U S E R S _ E M A I L _ I D  
 	 , U S E R S . P A S S W O R D   A S   U S E R S _ P A S S W O R D  
 	 , C A S T ( U S E R S . A C T I V E   A S   V A R C H A R ( 1 ) )   A S   U S E R S _ A C T I V E  
 	 , C A S T ( U S E R S . A C C O U N T _ N O N E X P I R E D   A S   V A R C H A R ( 1 ) )   A S   U S E R S _ A C C O U N T _ N O N E X P I R E D  
 	 , C A S T ( U S E R S . C R E D E N I A L S _ N O N E X P I R E D   A S   V A R C H A R ( 1 ) )   A S   U S E R S _ C R E D E N I A L S _ N O N E X P I R E D  
 	 , C A S T ( U S E R S . A C C O U N T _ N O N L O C K E D   A S   V A R C H A R ( 1 ) )   A S   U S E R S _ A C C O U N T _ N O N L O C K E D  
 	 , A C C E S S . A C C E S S _ C D   A S   A C C E S S _ A C C E S S _ C D  
 	 , ' ' '   +   @ I S C A R D A V A I L A B L E   +   ' ' '   A S   I S C A R D A V A I L A B L E  
 	 , ' ' '   +   @ I S C A R D A C T I V E   +   ' ' '   A S   I S C A R D A C T I V E    
 	 , ' ' '   +   @ A C C O U N T N U M B E R   +   ' ' '   A S   A C C O U N T N U M B E R  
 	 , ' ' '   +   @ I S P A I D U S E R   +   ' ' '   A S   I S P A I D U S E R  
 	 , ' ' '   +   @ I S P A Y M E N T D U E   +   ' ' '   A S   I S P A Y M E N T D U E  
 	 , U S E R S . F I R S T _ N A M E   A S   U S E R S _ F I R S T _ N A M E  
 	 , U S E R S . L A S T _ N A M E   A S   U S E R S _ L A S T _ N A M E  
 	 , A C C E S S . G U E S T _ F L G   A S   A C C E S S _ G U E S T _ F L G  
 	 , L O O K U P . C A T E G O R Y   A S   L O O K U P _ C A T E G O R Y  
 	 , U S E R S . L A S T _ L O G I N _ T I M E   A S   U S E R S _ L A S T _ L O G I N _ T I M E  
 	 , U S E R S . D A T E _ T I M E _ C R E A T E D   A S   U S E R S _ D A T E _ T I M E _ C R E A T E D  
 	 , S I T E . I D   A S   S I T E _ I D  
 	 , S I T E . N A M E   A S   S I T E _ N A M E  
 	 , U S E R S . R E G I S T E R E D _ N O D E   A S   U S E R S _ R E G I S T E R E D _ N O D E  
 	 , A C C E S S . I D   A S   A C C E S S _ I D  
 	 , U S E R S . C U R R E N T _ L O G I N _ T I M E   A S   U S E R S _ C U R R E N T _ L O G I N _ T I M E  
 	 , U S E R A C C E S S . C O M M E N T S   A S   U S E R A C C E S S _ C O M M E N T S  
 	 , U S E R A C C E S S . I S _ A C C E S S _ O V E R R I D D E N   A S   U S E R A C C E S S _ I S _ A C C E S S _ O V E R R I D D E N  
 F R O M  
             A U T H _ U S E R S   U S E R S  
             I N N E R   J O I N   A U T H _ U S E R S _ A C C E S S   U S E R A C C E S S   O N   U S E R A C C E S S . U S E R _ I D   =   U S E R S . I D  
             I N N E R   J O I N   A U T H _ A C C E S S   A C C E S S   O N   A C C E S S . I D   =   U S E R A C C E S S . A C C E S S _ I D  
             L E F T   O U T E R   J O I N   E C O M M _ S I T E _ A C C E S S   S I T E A C C E S S   O N   S I T E A C C E S S . A C C E S S _ I D   =   A C C E S S . I D  
             L E F T   O U T E R   J O I N   E C O M M _ S I T E   S I T E   O N   S I T E . I D   =   S I T E A C C E S S . S I T E _ I D              
             L E F T   O U T E R   J O I N   E C O M M _ N O D E   N O D E   O N   N O D E . I D   =   S I T E . N O D E _ I D              
             L E F T   O U T E R   J O I N   E C O M M _ S U B S C R I P T I O N F E E   F E E   O N   F E E . S I T E A C C E S S _ I D   =   S I T E A C C E S S . I D  
             L E F T   O U T E R   J O I N   C O D E L O O K U P   L O O K U P   O N   L O O K U P . I D   =   F E E . S U B S C R I P T I O N _ T Y P _ I D  
             L E F T   O U T E R   J O I N   E C O M M _ C C I N F O   C C   O N   U S E R S . I D   =   C C . U S E R _ I D   W H E R E   ( 1 = 1 ) '  
 S E T   @ C O N D I T I O N 3   =   '   A N D   A C C E S S . A C T I V E   =   ' ' Y ' '   A N D   U S E R A C C E S S . A C T I V E   =   ' ' Y ' ' '  
 I F   ( @ U S E R N A M E   I S   N O T   N U L L   A N D   @ U S E R N A M E   < >   ' ' )  
 	 S E T   @ C O N D I T I O N 3   =   @ C O N D I T I O N 3   +   '   A N D   U S E R S . E M A I L _ I D   =   ' ' '   +   @ U S E R N A M E   +   ' ' ' '  
 S E T   @ S Q L 3   =   @ S Q L 3   +   @ C O N D I T I O N 3  
 E x e c u t e   S P _ E X E C U T E S Q L     @ S Q L 3  
 E N D  
 G O  
 