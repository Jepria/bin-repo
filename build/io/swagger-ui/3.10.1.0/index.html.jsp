<!-- HTML for static distribution bundle build -->

<%
  // must start with '/', must not end with '/'
  final String apiDocsContext = (String)request.getAttribute("org.jepria.swagger.apiDocsContext");
  if (apiDocsContext == null) { throw new IllegalStateException("Cannot deploy jsp with request attribute value missing: " + "org.jepria.swagger.apiDocsContext"); }
%>
<%
  final String uiJsonUrls = (String)request.getAttribute("org.jepria.swagger.uiJsonUrls");
  if (uiJsonUrls == null) { throw new IllegalStateException("Cannot deploy jsp with request attribute value missing: " + "org.jepria.swagger.uiJsonUrls"); }
%>

<!DOCTYPE html>
<html lang="en">
  <head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<title>Swagger UI</title>
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Source+Code+Pro:300,600|Titillium+Web:400,600,700" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%= apiDocsContext %>/_swagger-ui/swagger-ui.css" >
	<link rel="icon" type="image/png" href="<%= apiDocsContext %>/_swagger-ui/favicon-32x32.png" sizes="32x32" />
	<link rel="icon" type="image/png" href="<%= apiDocsContext %>/_swagger-ui/favicon-16x16.png" sizes="16x16" />
    <style>
      html
      {
        box-sizing: border-box;
        overflow: -moz-scrollbars-vertical;
        overflow-y: scroll;
      }

      *,
      *:before,
      *:after
      {
        box-sizing: inherit;
      }

      body
      {
        margin:0;
        background: #fafafa;
      }
    </style>
  </head>

  <body>
    <div id="swagger-ui"></div>
	<script src="<%= apiDocsContext %>/_swagger-ui/swagger-ui-bundle.js" charset="UTF-8"> </script>
	<script src="<%= apiDocsContext %>/_swagger-ui/swagger-ui-standalone-preset.js"> </script>
	<script>
	window.onload = function() {
	  
	  // Build a system
	  const ui = SwaggerUIBundle({
		urls: <%= uiJsonUrls %> // for a single spec use instead >>> url: "http://petstore.swagger.io/v2/swagger.json"
		,
		dom_id: '#swagger-ui',
		deepLinking: true,
		presets: [
		  SwaggerUIBundle.presets.apis,
		  SwaggerUIStandalonePreset
		],
		plugins: [
		  SwaggerUIBundle.plugins.DownloadUrl
		],
		layout: "StandaloneLayout",
		oauth2RedirectUrl: `<%= apiDocsContext %>/_swagger-ui/oauth2-redirect.html`,
	  })

	  window.ui = ui
	}
	</script>
  </body>

</html>
