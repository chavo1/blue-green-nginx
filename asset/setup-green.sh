#! /bin/bash -v
  
sudo apt-get update -y
sudo apt-get install -y nginx > /tmp/nginx.log


WEBSRV=$(curl http://169.254.169.254/latest/meta-data/instance-id)
cat <<EOM > /usr/share/nginx/html/index.html
<html>
<head>
<title>Welcome to nginx</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
        background-color:chartreuse;
    }
</style>
</head>
<body>
<h1>Welcome to green $WEBSRV</h1>
</body>
</html>
EOM

sudo service nginx restart
