<html>
<head>
<style>
body {
	font-family:Helvetica,"Nimbus Sans L",sans-serif;
}
#main{
    -moz-box-align: center;
    -moz-box-orient: vertical;
    border: 0.5em solid #E3E9FF;
    display: block;
    height: auto;
    margin: auto;
    padding: 10px;
    text-overflow: ellipsis;
    width: 350px;
    word-wrap: break-word;
}
.data{
	background-color: #e3e3e3;
    height: 88px;
    padding: 5px;
	margin-bottom:20px;
}
.image{
	border: 1px solid #ffffff;
	padding:3px;
}
.picture{
	float:left;
	width:90px;
}
.profiles{
	float:left;
	width:225px;
	padding: 0 0 0 10px;
}
p.name{
	color:#069;
	font-weight:bold;
	margin:0;
}
p.headline{
	font-size:12px;
}
#demo{
	display:none;
}
</style>
<script type="text/javascript" src="http://platform.linkedin.com/in.js">
//	api_key: lg2s1jdk6lfv
    api_key:817rencrdgmevp
    
	onLoad: onLinkedInLoad
	scope: r_emailaddress,r_basicprofile
	authorize: true
</script>
<script type="text/javascript">
// 1. Runs when the JavaScript framework is loaded
function onLinkedInLoad() {
	IN.Event.on(IN, "auth", onLinkedInAuth);
}

// 2. Runs when the viewer has authenticated
function onLinkedInAuth() {
	IN.API.Profile("me").result(displayProfiles);
}

// 3. Runs when the Profile() API call returns successfully
function displayProfiles(profiles) {
	member = profiles.values[0];
	document.getElementById('demo').style.display = 'block';
	var profile = "<p class='name' id=\"" + member.id + "\">" +  member.firstName + " " + member.lastName + "</p>";
	profile += '<p class="headline">'+member.headline+'</p>';
	document.getElementById("profiles").innerHTML = profile;
	document.getElementById("picture").innerHTML = '<img src="'+member.pictureUrl+'" class="image" />';
}
function closeSession() {
	  if ( typeof IN === 'object' && typeof IN.User === 'object' && IN.User.isAuthorized() ) {
	     //user logged in linkedin
	    //call linkedin logout with websites logout function as callback
	     alert("I m inside linkedin object check.."); //do you see this
	     IN.User.logout(logout);
	  }
	  else {
	     logout();
	  }
	}
	function logout() {
	  window.location.href = "index.jsp";
	}
</script>
</head>
<body>
<div id="main">
	<h4>JS template method</h4>
	<script type="in/Login">
	
	</script>

	<div id="demo">
		<h4>User Details..</h4>
		<div class="data">
			<div id="picture" class="picture"></div>
			<div id="profiles" class="profiles"></div>
			<a href="#" class="myButton" onclick="closeSession()" id="logout-link">
    Logout In LinkedIn
</a>
		</div>
	</div>

	
</div>
</body>
</html>