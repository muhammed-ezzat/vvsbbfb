/ * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P _ G E T _ G R A N D _ T O T A L S _ R P T ]         S c r i p t   D a t e :   0 8 / 1 4 / 2 0 1 2   1 3 : 5 7 : 0 0   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E     [ d b o ] . [ S P _ G E T _ G R A N D _ T O T A L S _ R P T ]    
 	 @ S I T E _ I D   I N T ,   @ F R O M _ D A T E   V A R C H A R ( 2 0 ) ,   @ T O _ D A T E   V A R C H A R ( 2 0 )  
 A S  
 B E G I N  
 S E T   N O C O U N T   O N  
 D E C L A R E   @ C O U N T S T A B L E   T A B L E   (  
 	 N O D E _ N A M E   V A R C H A R ( 5 0 ) ,  
 	 S I T E _ N A M E   V A R C H A R ( 5 0 ) ,  
 	 S U B S C R I P T I O N   V A R C H A R ( 5 0 0 ) ,  
 	 T O T A L _ A M O U N T   N U M E R I C ( 1 0 , 2 ) ,  
 	 T O T A L _ S E R V I C E _ F E E   N U M E R I C ( 1 0 , 2 ) ,  
 	 T O T A L _ T X _ A M O U N T   N U M E R I C ( 1 0 , 2 ) ,  
 	 T O T A L _ T R A N S A C T I O N _ C O S T   N U M E R I C ( 1 0 , 2 ) ,  
 	 T O T A L _ N E T P R O F I T   N U M E R I C ( 1 0 , 2 ) ,  
 	 T O T A L _ C L I E N T _ P R O F I T _ S H A R E   N U M E R I C ( 1 0 , 2 ) ,  
 	 T O T A L _ A M C A D _ P R O F I T _ S H A R E   N U M E R I C ( 1 0 , 2 ) ,  
 	 P A Y M E N T T Y P E   V A R C H A R ( 5 0 )  
 )  
 D E C L A R E   @ S Q L 1   N V A R C H A R ( M A X )   =   ' ' ;  
 D E C L A R E   @ S Q L 2   N V A R C H A R ( M A X )   =   ' ' ;  
 D E C L A R E   @ S Q L 3   N V A R C H A R ( M A X )   =   ' ' ;  
 D E C L A R E   @ C O N D I T I O N 1   N V A R C H A R ( M A X )   =   ' ' ;  
 D E C L A R E   @ C O N D I T I O N 2   N V A R C H A R ( M A X )   =   ' ' ;  
 D E C L A R E   @ C O N D I T I O N 3   N V A R C H A R ( M A X )   =   ' ' ;  
  
 S E T   @ S Q L 1   =   ' S E L E C T   D I S T I N C T  
 	 N O D E . D E S C R I P T I O N   A S   N O D E _ N A M E ,  
 	 S I T E . D E S C R I P T I O N   A S   S I T E _ N A M E ,  
 	 I S N U L L   ( A C C E S S . A C C E S S _ D E S C R ,   ' ' W e b   P u r c h a s e ' ' )   A S   S U B S C R I P T I O N ,  
 	 S U M ( C A S E   I T E M S . I S _ R E F U N D E D  
 	 	 W H E N   ' ' N ' '   T H E N  
 	 	 	 I T E M S . A M O U N T  
 	 	 W H E N   ' ' Y ' '   T H E N  
 	 	 	 0   -   I T E M S . A M O U N T  
 	 E N D )   A S   T O T A L _ A M O U N T ,  
 	 S U M ( C A S E   I T E M S . I S _ R E F U N D E D  
 	 	 W H E N   ' ' N ' '   T H E N  
 	 	 	 I T E M S . S E R V I C E _ F E E  
 	 	 W H E N   ' ' Y ' '   T H E N  
 	 	 	 0   -   I T E M S . S E R V I C E _ F E E  
 	 E N D )   A S   T O T A L _ S E R V I C E _ F E E ,  
 	 S U M ( C A S E   I T E M S . I S _ R E F U N D E D  
 	 	 W H E N   ' ' N ' '   T H E N  
 	 	 	 I T E M S . T O T A L _ A M O U N T  
 	 	 W H E N   ' ' Y ' '   T H E N  
 	 	 	 0   -   I T E M S . T O T A L _ A M O U N T  
 	 E N D )   A S   T O T A L _ T X _ A M O U N T ,  
 	 S U M ( C A S T (   ( ( ( I T E M S . T O T A L _ A M O U N T   *   I N F O . T R A N _ F E E _ P E R C E N T A G E ) / 1 0 0 )   +   I N F O . T R A N _ F E E _ F L A T )     A S   D E C ( 1 0 , 2 ) ) )   A S   T O T A L _ T R A N S A C T I O N _ C O S T ,  
         S U M ( C A S E   I T E M S . I S _ R E F U N D E D  
 	 	 W H E N   ' ' N ' '   T H E N  
 	 	 	 ( I T E M S . T O T A L _ A M O U N T   -   C A S T (   ( ( ( I T E M S . T O T A L _ A M O U N T   *   I N F O . T R A N _ F E E _ P E R C E N T A G E ) / 1 0 0 )   +   I N F O . T R A N _ F E E _ F L A T )     A S   D E C ( 1 0 , 2 ) ) )    
 	 	 W H E N   ' ' Y ' '   T H E N  
 	 	 	 0   -   ( I T E M S . T O T A L _ A M O U N T   +   C A S T (   ( ( ( I T E M S . T O T A L _ A M O U N T   *   I N F O . T R A N _ F E E _ P E R C E N T A G E ) / 1 0 0 )   +   I N F O . T R A N _ F E E _ F L A T )     A S   D E C ( 1 0 , 2 ) ) )    
 	 E N D )   A S   T O T A L _ N E T P R O F I T ,  
 	 S U M ( C A S E   I T E M S . I S _ R E F U N D E D  
 	 	 W H E N   ' ' N ' '   T H E N  
 	 	 	 I T E M S . A M O U N T  
 	 	 W H E N   ' ' Y ' '   T H E N  
 	 	 	 0   -   I T E M S . A M O U N T  
 	 E N D )   A S   T O T A L _ C L I E N T _ P R O F I T _ S H A R E , 	  
 	 S U M ( C A S E   I T E M S . I S _ R E F U N D E D  
 	 	 W H E N   ' ' N ' '   T H E N  
 	 	 	 ( I T E M S . S E R V I C E _ F E E   -   C A S T ( ( ( ( I T E M S . T O T A L _ A M O U N T   *   I N F O . T R A N _ F E E _ P E R C E N T A G E ) / 1 0 0 )   +   I N F O . T R A N _ F E E _ F L A T )     A S   D E C ( 1 0 , 2 ) ) )    
 	 	 W H E N   ' ' Y ' '   T H E N  
 	 	 	 0   -   ( I T E M S . S E R V I C E _ F E E   +   C A S T ( ( ( ( I T E M S . T O T A L _ A M O U N T   *   I N F O . T R A N _ F E E _ P E R C E N T A G E ) / 1 0 0 )   +   I N F O . T R A N _ F E E _ F L A T )     A S   D E C ( 1 0 , 2 ) ) )    
 	 E N D )   A S   T O T A L _ A M C A D _ P R O F I T _ S H A R E ,  
 	 ' ' W e b   P u r c h a s e s ' '   A S   P A Y M E N T T Y P E  
 F R O M   E C O M M _ W E B P A Y _ T X   I N F O  
 	   I N N E R   J O I N   E C O M M _ W E B P A Y _ P U R C H A S E D _ I T E M S   I T E M S   O N   I T E M S . W E B T X _ I D   =   I N F O . I D  
 	   L E F T   O U T E R   J O I N   A U T H _ A C C E S S   A C C E S S   O N   A C C E S S . I D   =   I T E M S . A C C E S S _ I D  
 	   I N N E R   J O I N   E C O M M _ M E R C H A N T I N F O   M E R C H A N T   O N   M E R C H A N T . I D   =   I N F O . M E R C H A N T _ I D  
 	   I N N E R   J O I N   E C O M M _ S I T E   S I T E   O N   S I T E . I D   =   M E R C H A N T . S I T E _ I D  
 	   I N N E R   J O I N   E C O M M _ N O D E   N O D E   O N   N O D E . I D   =   S I T E . N O D E _ I D 	  
 	 W H E R E   ( 1 = 1 ) '  
 I F   ( @ F R O M _ D A T E   I S   N O T   N U L L   A N D   @ F R O M _ D A T E   < >   ' '   A N D   @ T O _ D A T E   I S   N O T   N U L L   A N D   @ T O _ D A T E   < >   ' ' )  
 	 S E T   @ C O N D I T I O N 1   =   @ C O N D I T I O N 1   +   '   A N D   c o n v e r t ( D A T E ,   I N F O . T X _ D A T E ,   1 0 1 )   > =   ' ' '   +   @ F R O M _ D A T E   +   ' ' '   A N D   c o n v e r t ( D A T E ,   I N F O . T X _ D A T E ,   1 0 1 )   < =   ' ' '   +     @ T O _ D A T E   +   ' ' ' '  
 I F   ( @ S I T E _ I D   I S   N O T   N U L L   A N D   @ S I T E _ I D   < >   ' ' )  
 	 S E T   @ C O N D I T I O N 1   =   @ C O N D I T I O N 1   +   '   A N D   S I T E . I D   =   ' ' '   +     C O N V E R T ( V A R C H A R , @ S I T E _ I D )   +   ' ' ' '  
 S E T   @ S Q L 1   =   @ S Q L 1   +   @ C O N D I T I O N 1   +   '   G R O U P   B Y   N O D E . D E S C R I P T I O N ,   S I T E . D E S C R I P T I O N ,   A C C E S S . A C C E S S _ D E S C R   O R D E R   B Y   N O D E . D E S C R I P T I O N ,   S I T E . D E S C R I P T I O N ,   S U B S C R I P T I O N   A S C '  
  
 I N S E R T     I N T O   @ C O U N T S T A B L E   E X E C U T E   S P _ E X E C U T E S Q L     @ S Q L 1  
  
 S E T   @ S Q L 2   =   ' S E L E C T   D I S T I N C T  
 	 N O D E . D E S C R I P T I O N   A S   N O D E _ N A M E ,  
 	 S I T E . D E S C R I P T I O N   A S   S I T E _ N A M E ,  
 	 A C C E S S . A C C E S S _ D E S C R   A S   S U B S C R I P T I O N ,  
 	 S U M ( C A S E   T X _ T Y P E  
 	 	 W H E N   ' ' C H A R G E ' '   T H E N  
 	 	 	 I N F O . A M O U N T  
 	 	 W H E N   ' ' R E F U N D ' '   T H E N  
 	 	 	 0   -   I N F O . A M O U N T  
 	 E N D )   A S   T O T A L _ A M O U N T ,  
 	 S U M ( C A S E   T X _ T Y P E  
 	 	 W H E N   ' ' C H A R G E ' '   T H E N  
 	 	 	 I N F O . S E R V I C E _ F E E  
 	 	 W H E N   ' ' R E F U N D ' '   T H E N  
 	 	 	 0   -   I N F O . S E R V I C E _ F E E  
 	 E N D )   A S   T O T A L _ S E R V I C E _ F E E ,  
 	 S U M ( C A S E   T X _ T Y P E  
 	 	 W H E N   ' ' C H A R G E ' '   T H E N  
 	 	 	 I N F O . T X _ A M O U N T  
 	 	 W H E N   ' ' R E F U N D ' '   T H E N  
 	 	 	 0   -   I N F O . T X _ A M O U N T  
 	 E N D )   A S   T O T A L _ T X _ A M O U N T ,  
 	 S U M ( C A S T ( ( ( ( I N F O . T X _ A M O U N T   *   I N F O . T R A N _ F E E _ P E R C E N T A G E ) / 1 0 0 )   +   I N F O . T R A N _ F E E _ F L A T )     A S   D E C ( 1 0 , 2 ) ) )   A S   T O T A L _ T R A N S A C T I O N _ C O S T , 	          
         S U M ( C A S E   T X _ T Y P E  
 	 	 W H E N   ' ' C H A R G E ' '   T H E N  
 	 	 	 ( I N F O . T X _ A M O U N T   -   C A S T ( ( ( ( I N F O . T X _ A M O U N T   *   I N F O . T R A N _ F E E _ P E R C E N T A G E ) / 1 0 0 )   +   I N F O . T R A N _ F E E _ F L A T )     A S   D E C ( 1 0 , 2 ) ) )    
 	 	 W H E N   ' ' R E F U N D ' '   T H E N  
 	 	 	 0   -   ( I N F O . T X _ A M O U N T   +   C A S T ( ( ( ( I N F O . T X _ A M O U N T   *   I N F O . T R A N _ F E E _ P E R C E N T A G E ) / 1 0 0 )   +   I N F O . T R A N _ F E E _ F L A T )     A S   D E C ( 1 0 , 2 ) ) )    
 	 E N D )   A S   T O T A L _ N E T P R O F I T ,  
 	 S U M ( C A S E   T X _ T Y P E  
 	 	 W H E N   ' ' C H A R G E ' '   T H E N  
 	 	 	 C A S T ( ( I N F O . T X _ A M O U N T   -   C A S T ( ( ( ( I N F O . T X _ A M O U N T   *   I N F O . T R A N _ F E E _ P E R C E N T A G E ) / 1 0 0 )   +   I N F O . T R A N _ F E E _ F L A T )     A S   D E C ( 1 0 , 2 ) ) )   *   I N F O . C L I E N T _ S H A R E     A S   D E C ( 1 0 , 2 ) )  
 	 	 W H E N   ' ' R E F U N D ' '   T H E N  
 	 	 	 C A S T ( ( 0   -   ( I N F O . T X _ A M O U N T   +   C A S T ( ( ( ( I N F O . T X _ A M O U N T   *   I N F O . T R A N _ F E E _ P E R C E N T A G E ) / 1 0 0 )   +   I N F O . T R A N _ F E E _ F L A T )     A S   D E C ( 1 0 , 2 ) ) ) )   *   I N F O . C L I E N T _ S H A R E     A S   D E C ( 1 0 , 2 ) )  
 	 E N D )   A S   T O T A L _ C L I E N T _ P R O F I T _ S H A R E ,  
 	 S U M ( C A S E   T X _ T Y P E  
 	 	 W H E N   ' ' C H A R G E ' '   T H E N  
 	 	 	 C A S T ( ( I N F O . T X _ A M O U N T   -   C A S T ( ( ( ( I N F O . T X _ A M O U N T   *   I N F O . T R A N _ F E E _ P E R C E N T A G E ) / 1 0 0 )   +   I N F O . T R A N _ F E E _ F L A T )     A S   D E C ( 1 0 , 2 ) ) )   *   ( 1   -   I N F O . C L I E N T _ S H A R E )     A S   D E C ( 1 0 , 2 ) )  
 	 	 W H E N   ' ' R E F U N D ' '   T H E N  
 	 	 	 C A S T ( ( 0   -   ( I N F O . T X _ A M O U N T   +   C A S T ( ( ( ( I N F O . T X _ A M O U N T   *   I N F O . T R A N _ F E E _ P E R C E N T A G E ) / 1 0 0 )   +   I N F O . T R A N _ F E E _ F L A T )     A S   D E C ( 1 0 , 2 ) ) ) )   *   ( 1   -   I N F O . C L I E N T _ S H A R E )     A S   D E C ( 1 0 , 2 ) )  
 	 E N D )   A S   T O T A L _ A M C A D _ P R O F I T _ S H A R E ,  
 	 ' ' R e c u r r i n g   P a y m e n t s ' '   A S   P A Y M E N T T Y P E  
 F R O M   E C O M M _ R E C U R _ T X _ H I S T _ I N F O   I N F O  
 	 I N N E R   J O I N   A U T H _ A C C E S S   A C C E S S   O N   A C C E S S . I D   =   I N F O . A C C E S S _ I D  
 	 I N N E R   J O I N   A U T H _ U S E R S   U S E R S   O N   U S E R S . I D   =   I N F O . U S E R _ I D  
 	 I N N E R   J O I N   E C O M M _ S I T E _ A C C E S S   S I T E A C C E S S   O N   S I T E A C C E S S . A C C E S S _ I D   =   A C C E S S . I D  
 	 I N N E R   J O I N   E C O M M _ S I T E   S I T E   O N   S I T E . I D   =   S I T E A C C E S S . S I T E _ I D  
 	 I N N E R   J O I N   E C O M M _ N O D E   N O D E   O N   N O D E . I D   =   S I T E . N O D E _ I D   W H E R E   ( 1 = 1 ) '  
  
 I F   ( @ F R O M _ D A T E   I S   N O T   N U L L   A N D   @ F R O M _ D A T E   < >   ' '   A N D   @ T O _ D A T E   I S   N O T   N U L L   A N D   @ T O _ D A T E   < >   ' ' )  
 	 S E T   @ C O N D I T I O N 2   =   @ C O N D I T I O N 2   +   '   A N D   c o n v e r t ( D A T E ,   I N F O . T X _ D A T E ,   1 0 1 )   > =   ' ' '   +   @ F R O M _ D A T E   +   ' ' '   A N D   c o n v e r t ( D A T E ,   I N F O . T X _ D A T E ,   1 0 1 )   < =   ' ' '   +     @ T O _ D A T E   +   ' ' ' '  
 I F   ( @ S I T E _ I D   I S   N O T   N U L L   A N D   @ S I T E _ I D   < >   ' ' )  
 	 S E T   @ C O N D I T I O N 2   =   @ C O N D I T I O N 2   +   '   A N D   S I T E . I D   =   ' ' '   +     C O N V E R T ( V A R C H A R , @ S I T E _ I D )   +   ' ' ' '  
 S E T   @ S Q L 2   =   @ S Q L 2   +   @ C O N D I T I O N 2   +   '   G R O U P   B Y   N O D E . D E S C R I P T I O N ,   S I T E . D E S C R I P T I O N ,   A C C E S S . A C C E S S _ D E S C R   O R D E R   B Y   N O D E . D E S C R I P T I O N ,   S I T E . D E S C R I P T I O N ,   A C C E S S . A C C E S S _ D E S C R   A S C '  
  
 I N S E R T     I N T O   @ C O U N T S T A B L E   E X E C U T E   S P _ E X E C U T E S Q L     @ S Q L 2  
  
 S E T   @ S Q L 3   =   ' S E L E C T   D I S T I N C T  
 	 N O D E . D E S C R I P T I O N   A S   N O D E _ N A M E ,  
 	 S I T E . D E S C R I P T I O N   A S   S I T E _ N A M E ,    
 	 ' ' O v e r   t h e   C o u n t e r ' '   A S   S U B S C R I P T I O N ,  
 	 S U M ( C A S E   T X _ T Y P E  
 	 	 W H E N   ' ' C H A R G E ' '   T H E N  
 	 	 	 I N F O . A M O U N T  
 	 	 W H E N   ' ' R E F U N D ' '   T H E N  
 	 	 	 0   -   I N F O . A M O U N T  
 	 E N D )   A S   T O T A L _ A M O U N T ,  
 	 S U M ( C A S E   T X _ T Y P E  
 	 	 W H E N   ' ' C H A R G E ' '   T H E N  
 	 	 	 I N F O . S E R V I C E _ F E E  
 	 	 W H E N   ' ' R E F U N D ' '   T H E N  
 	 	 	 0   -   I N F O . S E R V I C E _ F E E  
 	 E N D )   A S   T O T A L _ S E R V I C E _ F E E ,  
 	 S U M ( C A S E   T X _ T Y P E  
 	 	 W H E N   ' ' C H A R G E ' '   T H E N  
 	 	 	 I N F O . T X _ A M O U N T  
 	 	 W H E N   ' ' R E F U N D ' '   T H E N  
 	 	 	 0   -   I N F O . T X _ A M O U N T  
 	 E N D )   A S   T O T A L _ T X _ A M O U N T ,    
 	 S U M ( C A S T ( ( ( ( I N F O . T X _ A M O U N T   *   I N F O . T R A N _ F E E _ P E R C E N T A G E ) / 1 0 0 )   +   I N F O . T R A N _ F E E _ F L A T )     A S   D E C ( 1 0 , 2 ) ) )   A S   T O T A L _ T R A N S A C T I O N _ C O S T ,  
         S U M ( C A S E   T X _ T Y P E  
 	 	 W H E N   ' ' C H A R G E ' '   T H E N  
 	 	 	 ( I N F O . T X _ A M O U N T   -   C A S T ( ( ( ( I N F O . T X _ A M O U N T   *   I N F O . T R A N _ F E E _ P E R C E N T A G E ) / 1 0 0 )   +   I N F O . T R A N _ F E E _ F L A T )     A S   D E C ( 1 0 , 2 ) ) )    
 	 	 W H E N   ' ' R E F U N D ' '   T H E N  
 	 	 	 0   -   ( I N F O . T X _ A M O U N T   +   C A S T ( ( ( ( I N F O . T X _ A M O U N T   *   I N F O . T R A N _ F E E _ P E R C E N T A G E ) / 1 0 0 )   +   I N F O . T R A N _ F E E _ F L A T )     A S   D E C ( 1 0 , 2 ) ) )    
 	 E N D )   A S   T O T A L _ N E T P R O F I T ,  
 	 S U M ( C A S E   T X _ T Y P E  
 	 	 W H E N   ' ' C H A R G E ' '   T H E N  
 	 	 	 I N F O . A M O U N T  
 	 	 W H E N   ' ' R E F U N D ' '   T H E N  
 	 	 	 0   -   I N F O . A M O U N T  
 	 E N D )   A S   T O T A L _ C L I E N T _ P R O F I T _ S H A R E ,  
 	 S U M ( C A S E   T X _ T Y P E  
 	 	 W H E N   ' ' C H A R G E ' '   T H E N  
 	 	 	 ( I N F O . S E R V I C E _ F E E   -   C A S T ( ( ( ( I N F O . T X _ A M O U N T   *   I N F O . T R A N _ F E E _ P E R C E N T A G E ) / 1 0 0 )   +   I N F O . T R A N _ F E E _ F L A T )     A S   D E C ( 1 0 , 2 ) ) )    
 	 	 W H E N   ' ' R E F U N D ' '   T H E N  
 	 	 	 0   -   ( I N F O . S E R V I C E _ F E E   +   C A S T ( ( ( ( I N F O . T X _ A M O U N T   *   I N F O . T R A N _ F E E _ P E R C E N T A G E ) / 1 0 0 )   +   I N F O . T R A N _ F E E _ F L A T )     A S   D E C ( 1 0 , 2 ) ) )    
 	 E N D )   A S   T O T A L _ A M C A D _ P R O F I T _ S H A R E ,  
 	 ' ' O v e r   t h e   C o u n t e r ' '   A S   P A Y M E N T T Y P E  
 F R O M   E C O M M _ O T C _ T X   I N F O  
 	 I N N E R   J O I N   E C O M M _ S I T E   S I T E   O N   S I T E . I D   =   S I T E _ I D  
 	 I N N E R   J O I N   E C O M M _ N O D E   N O D E   O N   N O D E . I D   =   S I T E . N O D E _ I D  
 	 W H E R E   ( 1 = 1 ) '  
 I F   ( @ F R O M _ D A T E   I S   N O T   N U L L   A N D   @ F R O M _ D A T E   < >   ' '   A N D   @ T O _ D A T E   I S   N O T   N U L L   A N D   @ T O _ D A T E   < >   ' ' )  
 	 S E T   @ C O N D I T I O N 3   =   @ C O N D I T I O N 3   +   '   A N D   c o n v e r t ( D A T E ,   I N F O . T X _ D A T E ,   1 0 1 )   > =   ' ' '   +   @ F R O M _ D A T E   +   ' ' '   A N D   c o n v e r t ( D A T E ,   I N F O . T X _ D A T E ,   1 0 1 )   < =   ' ' '   +     @ T O _ D A T E   +   ' ' ' '  
 I F   ( @ S I T E _ I D   I S   N O T   N U L L   A N D   @ S I T E _ I D   < >   ' ' )  
 	 S E T   @ C O N D I T I O N 3   =   @ C O N D I T I O N 3   +   '   A N D   S I T E . I D   =   ' ' '   +     C O N V E R T ( V A R C H A R , @ S I T E _ I D )   +   ' ' ' '  
 S E T   @ S Q L 3   =   @ S Q L 3   +   @ C O N D I T I O N 3   +   '   G R O U P   B Y   N O D E . D E S C R I P T I O N ,   S I T E . D E S C R I P T I O N   O R D E R   B Y   N O D E . D E S C R I P T I O N ,   S I T E . D E S C R I P T I O N   A S C '  
  
 I N S E R T     I N T O   @ C O U N T S T A B L E   E X E C U T E   S P _ E X E C U T E S Q L     @ S Q L 3  
  
 S E L E C T   *   F R O M   @ C O U N T S T A B L E   O R D E R   B Y   N O D E _ N A M E ,   S I T E _ N A M E ,   S U B S C R I P T I O N ,   P A Y M E N T T Y P E   D E S C  
 E N D  
 G O  
 