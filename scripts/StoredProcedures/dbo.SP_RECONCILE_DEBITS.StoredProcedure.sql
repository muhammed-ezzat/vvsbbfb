/ * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P _ R E C O N C I L E _ D E B I T S ]         S c r i p t   D a t e :   0 8 / 1 4 / 2 0 1 2   1 3 : 5 7 : 0 2   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E     [ d b o ] . [ S P _ R E C O N C I L E _ D E B I T S ]   	  
 A S  
  
 D E C L A R E   @ D E B I T E D _ C H E C K _ N U M   i n t  
 D E C L A R E   @ D E B I T E D _ A M O U N T   N U M E R I C ( 1 8 , 2 )  
 D E C L A R E   @ C H E C K _ A M O U N T   N U M E R I C ( 1 8 , 2 )  
  
 D E C L A R E   C H E C K _ N U M B E R _ C R   C U R S O R   F O R  
 	 S E L E C T    
 	 	 B A N K H I S T O R Y . C H E C K _ N U M   A S   B A N K H I S T O R Y _ C H E C K _ N U M ,  
 	 	 B A N K H I S T O R Y . T X _ A M O U N T   A S   B A N K H I S T O R Y _ T X _ A M O U N T 	 	  
 	 F R O M   E C O M M _ B A N K _ T R A N _ H I S T   B A N K H I S T O R Y   W H E R E   I S _ V E R I F I E D   =   ' N '  
 	  
 O P E N   C H E C K _ N U M B E R _ C R  
  
 F E T C H   N E X T   F R O M   C H E C K _ N U M B E R _ C R   I N T O   @ D E B I T E D _ C H E C K _ N U M ,   @ D E B I T E D _ A M O U N T  
  
 W H I L E   @ @ F E T C H _ S T A T U S   =   0  
       B E G I N  
 	     I F   ( @ D E B I T E D _ C H E C K _ N U M   I S   N O T   N U L L   A N D   @ D E B I T E D _ C H E C K _ N U M   >   0 )  
 	     B E G I N  
 	 	 S E T   @ C H E C K _ A M O U N T   =   ( S E L E C T   A M O U N T   F R O M   E C O M M _ C H E C K _ H I S T   W H E R E   C H E C K N U M   =   @ D E B I T E D _ C H E C K _ N U M )  
 	 	 I F     ( @ C H E C K _ A M O U N T   =   @ D E B I T E D _ A M O U N T )  
 	 	 B E G I N  
 	 	 	 U P D A T E   E C O M M _ B A N K _ T R A N _ H I S T   S E T   I S _ V E R I F I E D   =   ' Y ' ,   I S _ M A T C H E D   =   ' Y ' ,   D A T E _ T I M E _ M O D   =   G E T D A T E ( ) ,   M O D _ U S E R _ I D   =   ' S Y S T E M '   W H E R E   C H E C K _ N U M   =   @ D E B I T E D _ C H E C K _ N U M  
 	 	 E N D  
 	 	 E L S E  
 	 	 B E G I N  
 	 	 	 U P D A T E   E C O M M _ B A N K _ T R A N _ H I S T   S E T   I S _ V E R I F I E D   =   ' Y ' ,   I S _ M A T C H E D   =   ' N ' ,   D A T E _ T I M E _ M O D   =   G E T D A T E ( ) ,   M O D _ U S E R _ I D   =   ' S Y S T E M '   W H E R E   C H E C K _ N U M   =   @ D E B I T E D _ C H E C K _ N U M  
 	 	 E N D  
 	     E N D  
             F E T C H   N E X T   F R O M   C H E C K _ N U M B E R _ C R   I N T O   @ D E B I T E D _ C H E C K _ N U M ,   @ D E B I T E D _ A M O U N T  
       E N D ;  
 C L O S E   C H E C K _ N U M B E R _ C R ;  
 D E A L L O C A T E   C H E C K _ N U M B E R _ C R ;  
 G O  
 