int   n    ;int ((a)[105])[105] 	;



int ((b)[105])[105] ;int   ((c)[105])[105] 	;
int 	  	      main(   	  		  )
{
int i 	;

int j ;int  k 	;scanf     	(  	      	"%d",  &    	( n   	  ) );for ( 		( i ) = 	    ( 0   ); (   i 	 	  )  	< ( 		 n );   ++     (    	 i ) )

{for (  (  j 		 	 	)  = 		( 			0  	);



   	 	(  j 		 	  ) < 	 ( n 	); ++  (  		     	j ) )
{





scanf ( "%d",  	 &  	  	(  ( ( a  	 	)[  i ] 	   	   )[ j ] ) );


}
}




for  	 ( (  	 	i 	 	 ) = (  0  	);

   				( 	  i ) <   (  	 	n ); 	++  	 (   	i  ) )
{for  	 				  (  (   		 j     ) =  	( 	0 );
 	   	 		  (       	 j  )  < (    n  ); 	 	 	 	    	++   (  j    	   ) 		)

{scanf  (  	"%d",    	 	         & (  ( ( b )[ i  	 ]  )[  j   	    	 ] 		) 		);


}




}


for   (       	(   i ) =  ( 	0  );


  ( i )    <  	(    	 	n ); 	++ 	 ( i 		  ) 	   )
{for (     	(      	j 		) =    	 (   0 );
 ( j  		) < ( n ); ++ ( 		j  ) 	 )

{

( 	  ( (  	c )[   i 	]  )[ j  	]  ) 	= (  0 	  );



for (   	 (   k 	) 	= 	  (    	    0  		);



 (  k   )  <     	  	 (  	 n  ); 	++  	 	(  k ) 	   ){


(  ( ( 	c )[ 		i ] 	)[ 	j ] )  	 += 		( ( ( 	  (   a )[   	 	i  ] )[ k  ]   )   * ( ( ( 		 b )[ k     	]  )[ 		 j   ] ) );
}

}




}for    	    	(   ( i  ) = 	(  	0  );

  ( 	i ) 	 < ( 		n  );   	  ++ 	( i 	 	) )


{for  (    ( 		 	  j ) = 	( 0  );
   	  (  	 j ) 	< 	 ( n  	 	); 		++  (   	  j ) 	 )
{

printf  ( "%d ", (    (  	 	c 		  )[ i   ] 	)[ j  	 	  	] );



}



printf (   "\n" );
}






return   0;





};
