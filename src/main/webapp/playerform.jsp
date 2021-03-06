<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
	body {
    background-color: #444442;
    padding-top: 85px;
	}
	
	h1 {
	    font-family: 'Poppins', sans-serif, 'arial';
	    font-weight: 600;
	    font-size: 72px;
	    color: white;
	    text-align: center;
	}
	
	h4 {
	    font-family: 'Roboto', sans-serif, 'arial';
	    font-weight: 400;
	    font-size: 20px;
	    color: #9b9b9b;
	    line-height: 1.5;
	}
	
	/* ///// inputs /////*/
	
	input:focus ~ label, textarea:focus ~ label, input:valid ~ label, textarea:valid ~ label {
	    font-size: 0.75em;
	    color: #999;
	    top: -5px;
	    -webkit-transition: all 0.225s ease;
	    transition: all 0.225s ease;
	}
	
	.styled-input {
	    float: left;
	    width: 293px;
	    margin: 1rem 0;
	    position: relative;
	    border-radius: 4px;
	}
	
	@media only screen and (max-width: 768px){
	    .styled-input {
	        width:100%;
	    }
	}
	
	.styled-input label {
	    color: #999;
	    padding: 1.3rem 30px 1rem 30px;
	    position: absolute;
	    top: 10px;
	    left: 0;
	    -webkit-transition: all 0.25s ease;
	    transition: all 0.25s ease;
	    pointer-events: none;
	}
	
	.styled-input.wide { 
	    width: 650px;
	    max-width: 100%;
	}
	
	input,
	textarea {
	    padding: 30px;
	    border: 0;
	    width: 100%;
	    font-size: 1rem;
	    background-color: #2d2d2d;
	    color: white;
	    border-radius: 4px;
	}
	
	input:focus,
	textarea:focus { outline: 0; }
	
	input:focus ~ span,
	textarea:focus ~ span {
	    width: 100%;
	    -webkit-transition: all 0.075s ease;
	    transition: all 0.075s ease;
	}
	
	textarea {
	    width: 100%;
	    min-height: 15em;
	}
	
	.input-container {
	    width: 650px;
	    max-width: 100%;
	    margin: 20px auto 25px auto;
	}
	
	.submit-btn {
	    float: right;
	    padding: 7px 35px;
	    border-radius: 60px;
	    display: inline-block;
	    background-color: #4b8cfb;
	    color: white;
	    font-size: 18px;
	    cursor: pointer;
	    box-shadow: 0 2px 5px 0 rgba(0,0,0,0.06),
	              0 2px 10px 0 rgba(0,0,0,0.07);
	    -webkit-transition: all 300ms ease;
	    transition: all 300ms ease;
	}
	
	.submit-btn:hover {
	    transform: translateY(1px);
	    box-shadow: 0 1px 1px 0 rgba(0,0,0,0.10),
	              0 1px 1px 0 rgba(0,0,0,0.09);
	}
	
	@media (max-width: 767px) {
	    .submit-btn {
	        width:100%;
	        float: none;
	        text-align:center;
	    }
	}
	
	input[type=checkbox] + label {
	  color: #ccc;
	  font-style: italic;
	} 
	
	input[type=checkbox]:checked + label {
	  color: #f00;
	  font-style: normal;
	}
</style>
</head>
<body>
<div class="container">
	<div class="row">
			<h1>?????? ??????</h1>
	</div>
	<form method="post" action="playeradd.jsp" enctype="multipart/form-data">
	
		<div class="row input-container">
				<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="text" name="name" />
						<label>????????????</label> 
					</div>
				</div>
				<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="text" name="ufNo" />
						<label>?????????</label> 
					</div>
				</div>
				<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="text" name="nationality" />
						<label>??????</label> 
					</div>
				</div>
				<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="text" name="position" />
						<label>?????????</label> 
					</div>
				</div>
				<div class="col-xs-6">
					<div class="styled-input wide">
						<input type="text" name="goal" />
						<label>???</label> 
					</div>
				</div>
				<div class="col-xs-6">
					<label>??????</label> 
					<div class="styled-input wide">
						<select class="form-select" name="clubNo">
							<option value="" selected="selected" disabled="disabled"> ???????????????</option>
							<option value="1"> ?????????</option>
						</select>
					</div>
				</div>
				<div class="col-xs-6">
					<label>????????????</label> 
					<div class="styled-input wide">
						<input type="date" class="form-control" name="birth">
					</div>
				</div>
				<div class="col-xs-12">
					<label>??????</label> 
					<div class="styled-input wide">
						<input type="file" class="form-control" name="upFile" />
					</div>
				</div>
				
				
				<div class="col-12 text-end mb-3">
					<button type="submit" class="btn btn-primary">??????</button>
				</div>
			
		</div>
	</form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>