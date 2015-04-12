int 	 (a)[1005]  	;void  swap( 		 ){




int 		 tmp 	  	 = * 	 ( 		 a );
( 	*   (   a ) ) =  	 ( *  ( b  ) );
( *   	 ( 	b 	  ) ) =    ( 	tmp );



}void quicksort( 	 ){


int    	 	i 			 	  	= left;



int  	 j    	      = right;
int bar   =  	  ( a      )[  left     ];

printf    (  "%d %d\n", left, right  	 );
if 	(  ( (  right    	 	 	) - 		(  	 left  )    )  	 <= 		  	 		  			 ( 1 )   )  	{return;



}

while ( 	 	 (  	i ) < 	 (  j ) ){
while 		 	( 		    	( 	  ( i   			 		 )   	< ( j ) )   		&& (  ( 	 	  	  bar 	) > 		( ( a 		)[ i ] 	 )   ) 	 )
{++  	( i );







}















while (  (  	   	( i  	) < 	  	  ( j     	)    )    && (   ( bar  ) < 	(  	 	  	 ( 	 	a )[ 		j   ] ) )    ){
-- 	 	( 	  	   	j );






}





if (    (  		i   	 	  	) <  (  	  	j ) 	    	) {



swap (  ( 	  a 	 				       ) 	  + 	 ( 			  i 		 ), ( 	a )  	+ (   j )   );if ( 	(   	(    a )[ i  ]   ) 		 == (  		   bar )    )  	   	{
--  	 (    j );


}







else if ( ( 		( a  		 	  	    )[    		  j  	 ] )  == ( bar  		 	)   ) {



++  ( i    		   	 );}


else {
(   ( 	    i     	 )++  	       ) 		, (   ( j )-- );


}


}
}




if  (  (  i ) <  ( right    	 ) )  quicksort ( a,  	 ( i  	 )     	   	 +    (      		1 ), right  	     					);
if  	(     	(  j 			) >     ( 	left   ) 	)   quicksort  	    ( a,   left,     (  	 j  	)   -   		 ( 1    	 		)   	 	 );




}

int main(       	){
int n     	;

int 	i  ;scanf ( "%d", &     	 		    	(   n  	)   );
for 	 ( (   	i 	    		)  =    (   	 	0 	 );  	   ( 	  i )  	< 	 ( n 	 );  ++ (   	 	i  	) )
{




scanf ( 	     		    		 	  "%d",   ( 	a 	 	)  +  (   i 		 		)   );



}


quicksort   (   a,  0, 	( n  	 ) -    		 (  1 ) 	   	 );





for   	( (  	 i ) = 		  (  0   	 );   ( 			i  )  	      < (   n  ); ++ ( i )   	)


{
printf (  	"%d ",  	  	( 	 a  )[     	i   ]  		     );}
return  0;







}



