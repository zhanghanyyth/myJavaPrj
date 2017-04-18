<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
</head>

<body>
<meta charset="utf-8">
<title>HelloWorld Web sockets</title>
<script language="javascript" type="text/javascript">
    var wsUri = getRootUri() + "/hello";

    function getRootUri() {
        return "ws://" + (document.location.hostname == "" ? "localhost" : document.location.hostname) + ":" +
            (document.location.port == "" ? "8080" : document.location.port);
    }

    function init() {
        output = document.getElementById("output");
    }

    function send_message() {

        websocket = new WebSocket(wsUri);
        websocket.onopen = function(evt) {
            onOpen(evt)
        };
        websocket.onmessage = function(evt) {
            onMessage(evt)
        };
        websocket.onerror = function(evt) {
            onError(evt)
        };

    }

    function onOpen(evt) {
        writeToScreen("Connected to Endpoint!");
        doSend(textID.value);

    }

    function onMessage(evt) {
        writeToScreen("Message Received: " + evt.data);
    }

    function onError(evt) {
        writeToScreen('<span style="color: red;">ERROR:</span> ' + evt.data);
    }

    function doSend(message) {
        writeToScreen("Message Sent: " + message);
        websocket.send(message);
    }

    function writeToScreen(message) {
        alert(message);

    }

    window.addEventListener("load", init, false);

</script>

<h1 style="text-align: center;">Hello World WebSocket Client</h1>

    <br>

    <div style="text-align: center;">
        <form action="">
            <input onclick="send_message()" value="Send" type="button">
            <textarea id="textID" rows="4" cols="50" name="message" >
                </textarea>
        </form>
    </div>
    <div id="output"></div>
</body>
</html>