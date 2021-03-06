/ * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P _ G E T _ S U B S C R I P T I O N _ D E T A I L S ]         S c r i p t   D a t e :   0 8 / 1 4 / 2 0 1 2   1 3 : 5 7 : 0 1   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E     [ d b o ] . [ S P _ G E T _ S U B S C R I P T I O N _ D E T A I L S ]    
 	 @ U S E R N A M E   V A R C H A R ( 5 0 ) ,  
 	 @ A C C E S S _ I D   I N T  
 	  
 A S    
 S E L E C T              
             E S A . S I T E _ I D     A S   E S A _ S I T E _ I D ,  
             ( S E L E C T   S I T E . D E S C R I P T I O N   A S   S I T E _ D E S C R I P T I O N   F R O M   E C O M M _ S I T E   S I T E   W H E R E   S I T E . I D   =   E S A . S I T E _ I D ) ,                                      
             A A . A C C E S S _ D E S C R   A S   A A _ A C C E S S _ D E S C R ,  
             ( I S N U L L ( E S F . F E E , 0 ) )   A S   F e e ,                
             C A S E  
             W H E N   L O O K U P . C A T E G O R Y   =   ' R E C U R R I N G _ S U B S C R I P T I O N '  
 	 	 T H E N   C A S E   E U A . A C T I V E  
 	 	 	 	 W H E N     ' Y '    
 	 	 	 	 T H E N   ' N '  
 	 	 	   E L S E  
 	 	 	 	 ' Y '  
 	 	 	 E N D 	  
 	     E L S E   ' N '  
             E N D                            
               A S   P a y m e n t P e n d i n g ,  
             E U A . L A S T _ B I L L I N G _ D A T E   A S   E U A _ L a s t B i l l i n g D a t e ,  
             C A S E   E U A . M A R K _ F O R _ C A N C E L L A T I O N  
             W H E N   ' Y '    
 	 	 T H E N   ( E U A . N E X T _ B I L L I N G _ D A T E   -   1 )  
 	     W H E N   ' N '  
 	 	 T H E N   E U A . N E X T _ B I L L I N G _ D A T E  
 	     E N D    
 	     A S   N e x t B i l l i n g D a t e ,  
             E U A . I D   A S   E U A _ A C C O U N T I D ,  
             A A . I D   A S   A A _ A C C E S S I D ,  
             A U A . I D   A S   A U A _ U S E R A C C E S S I D ,  
             L O O K U P . D E S C R I P T I O N   A S   L O O K U P _ D E S C R I P T I O N ,  
             E U A . M A R K _ F O R _ C A N C E L L A T I O N   A S   E U A _ M A R K _ F O R _ C A N C E L L A T I O N ,  
             T E R M   A S   T E R M ,  
             L O O K U P . C A T E G O R Y   A S   L O O K U P _ C A T E G O R Y  
 F R O M  
 	     A U T H _ U S E R S   A U  
 	     I N N E R   J O I N   A U T H _ U S E R S _ A C C E S S   A U A   O N   A U A . U S E R _ I D   =   A U . I D  
             I N N E R   J O I N   A U T H _ A C C E S S   A A   O N   A U A . A C C E S S _ I D   =   A A . I D  
             L E F T   O U T E R   J O I N   E C O M M _ U S E R S _ A C C O U N T   E U A   O N   E U A . U S E R _ A C C E S S _ I D   =   A U A . I D  
             I N N E R   J O I N   E C O M M _ S I T E _ A C C E S S   E S A   O N   E S A . A C C E S S _ I D   =   A A . I D  
             I N N E R   J O I N   E C O M M _ S U B S C R I P T I O N F E E   E S F   O N   E S F . S I T E A C C E S S _ I D   =   E S A . I D  
             I N N E R   J O I N   C O D E L O O K U P   L O O K U P   O N   L O O K U P . I D   =   E S F . S U B S C R I P T I O N _ T Y P _ I D  
 W H E R E  
             A A . I D   =   @ A C C E S S _ I D   A N D    
             A U . E M A I L _ I D   =   @ U S E R N A M E   A N D              
             A A . A C T I V E   =   ' Y '   A N D  
             E S A . A C T I V E   =   ' Y '   A N D  
             E S F . A C T I V E   =   ' Y '   A N D  
             L O O K U P . A C T I V E   =   ' Y '  
 G O  
 