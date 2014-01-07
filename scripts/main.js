// JavaScript Document
$( function( )
{
	validateLoginForm();
	validateResetPassForm();
	validateSignupForm();

	setTimeout( '$("#user_msg").fadeOut();' , 9000 );

	$( '.topbar li' ).hover( function( )
	{
		$( this ).find( '.subnav' ).stop( true , true ).slideDown();
	} , function( )
	{
		var slider = $( this );

		if( slider.attr( "id" ) == 'formSubnav' )
		{
			$( "html" ).click( function( )
			{
				slider.find( '.subnav' ).stop( true , true ).slideUp();
			} );

			$( '.loginnav' ).click( function( event )
			{
				event.stopPropagation();
			} );
		}
		else
		{
			slider.find( '.subnav' ).stop( true , true ).slideUp();
		}

	} );

	// $(".sign-up").click(function()
	// {
	// $(".loginnav").stop(true, true).slideDown();
	// $("#loginForm").hide();
	// $("#resetPassForm").hide();
	// $("#signupForm").show();
	// return false;
	// });

	$( ".forgot-pwd" ).click( function( )
	{
		$( "#signupForm" ).hide();
		$( "#loginForm" ).hide();
		$( "#resetPassForm" ).show();
		return false;
	} );

	$( ".back-login" ).click( function( )
	{
		$( "#resetPassForm" ).hide();
		$( "#signupForm" ).hide();
		$( "#loginForm" ).show();
		return false;
	} );

	$( '.feedback' ).example( function( )
	{
		return $( this ).attr( 'title' );
	} );

	$( '#feedback_btn' ).one( "click" , sendFeedback );
} );

function sendFeedback( )
{
	var feedback = $( "#feedback_txt" ).val();

	if( feedback != '' )
	{
		$.ajax(
		{
			type : "POST" ,
			url : baseUrl + "/index/feedback/feedback/" + feedback ,

			success : function( result )
			{
				$( "#feedback_txt" ).attr( 'title' , 'Thank you!' );

				$( '.feedback' ).example( function( )
				{
					return $( this ).attr( 'title' );
				} );
			} ,
			error : function( )
			{
				alert( "Oops, it seems that something went wrong, but we are still interested in knowing your feedback.\ncould you do it again please ?" );
			}
		} );
	}
}

function validateSignupForm( )
{
	$( "#signupForm" ).validate(
	{
		rules :
		{
			name :
			{
				required : true
			} ,
			username :
			{
				required : true ,
				minlength : 5 ,
				maxlength : 20
			} ,
			password :
			{
				required : true ,
				minlength : 5 ,
				maxlength : 20
			} ,
			confirm_password :
			{
				required : true ,
				equalTo : "#signupForm #password"
			} ,
			email :
			{
				required : true ,
				email : true
			}
		} ,
		messages :
		{
			name :
			{
				required : "* this field is required."
			} ,
			username :
			{
				required : "* this field is required." ,
				minlength : "* username must be 5 characters atleast." ,
				maxlength : "* username must be 20 characters atmost."
			} ,
			password :
			{
				required : "* this field is required." ,
				minlength : "* password must be 5 characters atleast." ,
				maxlength : "* password must be 20 characters atmost."
			} ,
			confirm_password :
			{
				required : "* this field is required." ,
				equalTo : "* passwords are not matching."
			} ,
			email :
			{
				required : "* this field is required." ,
				email : "* enter a valid email."
			}
		}
	} );
}

function validateLoginForm( )
{
	$( "#loginForm" ).validate(
	{
		rules :
		{
			auth_username :
			{
				required : true
			} ,
			auth_password :
			{
				required : true
			}
		} ,
		messages :
		{
			auth_username :
			{
				required : "* this field is required."
			} ,
			auth_password :
			{
				required : "* this field is required."
			}
		}
	} );
}

function validateResetPassForm( )
{
	$( "#resetPassForm" ).validate(
	{
		rules :
		{
			email :
			{
				required : true ,
				email : true
			}
		} ,
		messages :
		{
			email :
			{
				required : "* this field is required." ,
				email : "* enter a valid email."
			}
		}
	} );
}