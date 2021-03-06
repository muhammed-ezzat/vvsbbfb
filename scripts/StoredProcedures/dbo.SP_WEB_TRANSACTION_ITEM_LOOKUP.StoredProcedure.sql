/ * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S P _ W E B _ T R A N S A C T I O N _ I T E M _ L O O K U P ]         S c r i p t   D a t e :   0 8 / 1 4 / 2 0 1 2   1 3 : 5 7 : 0 3   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   P R O C E D U R E     [ d b o ] . [ S P _ W E B _ T R A N S A C T I O N _ I T E M _ L O O K U P ]    
 	 	 @ I T E M _ I D   I N T ,   @ S I T E _ N A M E   V A R C H A R ( 5 0 ) 	  
 A S  
 B E G I N  
 D E C L A R E   @ S Q L   N V A R C H A R ( 4 0 0 0 )   =   ' ' ;  
 D E C L A R E   @ C O N D I T I O N   N V A R C H A R ( 4 0 0 0 )   =   ' ' ;  
 S E T   @ S Q L   =   '   S E L E C T    
 	 	 	   I T E M S . I D   A S   I T E M S _ I D  
 	 	 	 , I T E M S . P R O D U C T _ I D   A S   I T E M S _ P R O D U C T _ I D  
 	 	 	 , I T E M S . P R O D U C T _ T Y P E   A S   I T E M S _ P R O D U C T _ T Y P E  
 	 	 	 , I T E M S . P A G E _ C O U N T   A S   I T E M S _ P A G E _ C O U N T  
 	 	 	 , I T E M S . A M O U N T   A S   I T E M S _ A M O U N T  
 	 	 	 , I T E M S . S E R V I C E _ F E E   A S   I T E M S _ S E R V I C E _ F E E  
 	 	 	 , I T E M S . T O T A L _ A M O U N T   A S   I T E M S _ T O T A L _ A M O U N T  
 	 	 	 , I T E M S . I S _ R E F U N D E D   A S   I T E M S _ I S _ R E F U N D E D  
 	 	 	 , I T E M S . D A T E _ T I M E _ M O D   A S   I T E M S _ D A T E _ T I M E _ M O D  
 	 	 	 , I T E M S . M O D _ U S E R _ I D   A S   I T E M S _ M O D _ U S E R _ I D  
 	 	 	 , W E B T X . T X _ R E F E R E N C E _ N U M   A S   W E B T X _ T X _ R E F E R E N C E _ N U M  
 	 	 	 , W E B T X . O R G _ R E F _ N U M   A S   W E B T X _ O R G _ R E F _ N U M  
 	 	 	 , W E B T X . A M O U N T   A S   W E B T X _ A M O U N T  
 	 	 	 , W E B T X . S E R V I C E _ F E E   A S   W E B T X _ S E R V I C E _ F E E  
 	 	 	 , W E B T X . T X _ A M O U N T   A S   W E B T X _ T X _ A M O U N T  
 	 	 	 , W E B T X . C O M M E N T S   A S   W E B T X _ C O M M E N T S  
 	 	 	 , W E B T X . T X _ T Y P E   A S   W E B T X _ T X _ T Y P E  
 	 	 	 , W E B T X . C H E C K N U M   A S   W E B T X _ C H E C K N U M  
 	 	 	 , W E B T X . M A C H I N E N A M E   A S   W E B T X _ M A C H I N E N A M E  
 	 	 	 , W E B T X . T X _ D A T E   A S   W E B T X _ T X _ D A T E  
 	 	 	 , W E B T X . C A R D _ N U M B E R   A S   W E B T X _ C A R D _ N U M B E R  
 	 	 	 , W E B T X . A C C O U N T N A M E   A S   W E B T X _ A C C O U N T N A M E  
 	 	 	 , W E B T X . S E T T L E M E N T _ S T A T U S   A S   W E B T X _ S E T T L E M E N T _ S T A T U S  
 	 	 	 , W E B T X . M O D _ U S E R _ I D   A S   W E B T X _ M O D _ U S E R _ I D  
 	 	 	 , S I T E . N A M E   A S   S I T E _ N A M E  
 	 	 	 , U S E R S . E M A I L _ I D   A S   U S E R S _ E M A I L _ I D  
 	 	 	 , A C C E S S . A C C E S S _ D E S C R   A S   A C C E S S _ A C C E S S _ D E S C R  
 	 	 	 , A C C E S S . I D   A S   A C C E S S _ I D  
 	 	 	 , M E R C H A N T . P A R T N E R   A S   M E R C H A N T _ P A R T N E R  
 	 	 	 , M E R C H A N T . V E N D O R N A M E   A S   M E R C H A N T _ V E N D O R N A M E  
 	 	 	 , M E R C H A N T . U S E R N A M E   A S   M E R C H A N T _ U S E R N A M E  
 	 	 	 , M E R C H A N T . P A S S W O R D   A S   M E R C H A N T _ P A S S W O R D  
 	 	 	 , M E R C H A N T . I D   A S   M E R C H A N T _ I D  
 	 	 	 , U S E R S . I D   A S   U S E R S _ I D  
 	 	 	 , S I T E . I D   A S   S I T E _ I D  
 	 	 	 , M E R C H A N T . T R A N _ F E E _ P E R C E N T A G E   A S   M E R C H A N T _ T R A N _ F E E _ P E R C E N T A G E  
 	 	 	 , M E R C H A N T . T R A N _ F E E _ F L A T   A S   M E R C H A N T _ T R A N _ F E E _ F L A T  
 	 	 	 , W E B T X . C A R D _ T Y P E   A S   W E B T X _ C A R D _ T Y P E  
 	 	 	 F R O M   E C O M M _ W E B P A Y _ P U R C H A S E D _ I T E M S   I T E M S  
 	 	 	 I N N E R   J O I N   E C O M M _ W E B P A Y _ T X   W E B T X   O N   W E B T X . I D   =   I T E M S . W E B T X _ I D  
 	 	 	 L E F T   O U T E R   J O I N   A U T H _ A C C E S S   A C C E S S   O N   A C C E S S . I D   =   I T E M S . A C C E S S _ I D  
 	 	 	 I N N E R   J O I N   E C O M M _ S I T E   S I T E   O N   S I T E . I D   =   W E B T X . S I T E _ I D  
 	 	 	 I N N E R   J O I N   E C O M M _ M E R C H A N T I N F O   M E R C H A N T   O N   M E R C H A N T . I D   =   W E B T X . M E R C H A N T _ I D  
 	 	 	 L E F T   O U T E R   J O I N   A U T H _ U S E R S   U S E R S   O N   U S E R S . I D   =   W E B T X . U S E R _ I D 	 	 	  
 	 	 	 W H E R E   ( 1 = 1 ) '  
  
 S E T   @ C O N D I T I O N   =   @ C O N D I T I O N   +   '   A N D   I T E M S . I D   =   ' ' '   +   C O N V E R T ( V A R C H A R , @ I T E M _ I D )   +   ' ' ' '  
 I F   ( @ S I T E _ N A M E   I S   N O T   N U L L   A N D   @ S I T E _ N A M E   < >   ' ' )  
 	 S E T   @ C O N D I T I O N   =   @ C O N D I T I O N   +   '   A N D   S I T E . N A M E   =   ' ' '   +     @ S I T E _ N A M E   +   ' ' ' '  
 S E T   @ S Q L   =   @ S Q L   +   @ C O N D I T I O N    
 E x e c u t e   S P _ E X E C U T E S Q L     @ S Q L  
 E N D  
 G O  
 