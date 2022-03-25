<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>mediCal</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style type="text/css">
    
		body {
			margin-top: 10px;
		}
		
		.btn-bottom-margin {
			margin-bottom: 10px;
		}
				
		.join_id_ck,
		.join_id_imposs,
		.join_pw_ck,
		.join_pwck_ck,
		.join_pwck_diff,
		.join_name_ck,
		.join_birth_ck,
		.join_gender_ck,
		.join_id_val,
		.join_pw_val,
		.join_name_val {
			color: red;
			display: none;
		}
		
		.join_id_poss,
		.join_pwck_same {
			color: green;
			display: none;
		}
					
		.register_type_ck,
		.register_type_imposs,
		.register_take_ck,
		.register_memo_val {
			color: red;
			display: none;
		}
		
		.get_take_ck,
		.get_memo_val {
			color: red;
			display: none;
		}
		
		.get_panel_content_hidden {
			display: block;
		}
		
		.get_panel_content_display {
			display: none;
		}
		
		.cycle-form-group input {
			text-align: center;
			background-color: #e2e2e2;
			border: 1px solid #ccc;
			border-radius: 4px;
          	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
		}
		.cycle-form-group input:focus {
  			border-color: #66afe9;
  			outline: 0;
  			-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
          			box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
		}
		
		.cus_register_type_ck,
		.cus_register_type_val,
		.cus_register_type_imposs,
		.cus_register_take_ck,
		.cus_register_cycle_val,
		.cus_register_cycle_ck,
		.cus_register_memo_val {
			color: red;
			display: none;			
		}
		
		.cus-cycle-form-group input {
			text-align: center;
			border: 1px solid #ccc;
			border-radius: 4px;
          	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
		}
		.cus-cycle-form-group input:focus {
  			border-color: #66afe9;
  			outline: 0;
  			-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
          			box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
		}
		
		.sim_register_type_ck,
		.sim_register_type_val,
		.sim_register_type_imposs,
		.sim_register_take_ck,
		.sim_register_memo_val {
			color: red;
			display: none;			
		}
		
		.hidden-col {
			display: none;
		}
		.table-select {
			width: 20%;
		}
		.table-type {
			width: 80%;
		}
		
		@media (min-width: 600px) {
    		.container {
    		    max-width: 600px;
			}
    	}
    	
    	@media all and (max-width: 767px) { 
    		.mobile_text {
    			font-size: 0.7em;
    		}
    		
    		.mobile_textarea_text {
    			font-size: 0.5em;
    		}
    	}
    	
    	.text-center {
    		text-align: center;
    	}
    	
    	.manual-textarea {
    		resize: none;
    		overflow: hidden;
    		border: none;
    		background-color: white;
    	}

    	
		.manual-textarea:focus {
			outline: none;
		}
		
		.userinfo_pw_ck,
		.userinfo_pw_val,
		.userinfo_pwck_ck,
		.userinfo_pwck_diff {
			color: red;
			display: none;			
		}
		
		.userinfo_pwck_same {
			color: green;
			display: none;
		}
    	    	
	</style>
    
</head>

<body>

    <!-- <div id="wrapper"> -->

        <!-- <div id="page-wrapper"> -->
        
<!-- https://developers.google.com/speed/libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
       