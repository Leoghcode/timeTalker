
<%@ page contentType="text/html;charset=utf-8" language="java" %>

<header class="header white-bg">

    <script>
        var host = window.location.host;
        var websocket;


        websocket = new WebSocket("ws://" +host+"/webSocketServer");

        websocket.onopen = function (evnt) {
            alert("open");
        };
        websocket.onmessage = function (evnt) {

            var jsonArr = JSON.parse(evnt.data);
            var msgCount = jsonArr.length();
            alert("receive");

            $('#msgNotify').html(msgCount);
            $('#msgCount').html('You have '+msgCount + 'new message');

            for(var jsonMsg in  jsonArr){
                alert('in');
                var liStr = "<a href=\"#\"> <span class=\"photo\"><img alt=\"avatar\" src=\"/static/img/avatar-mini.jpg\"></span> <span class=\"subject\"> <span class=\"from\">"+jsonMsg['sender']+"</span> <span class=\"time\">"+jsonMsg['time']+"</span> </span> <span class=\"message\">"+ jsonMsg['content'] +"</span> </a> </li>"
                var oldHtml = $('#msgWindow').html();
                $('#msgWindow').html(oldHtml+liStr);
            }


//            msgCount++;
//
//            var msg = JSON.parse(evnt.data);
//
//
//            var newHtml = $("#messagebox").html();
//            $("#messagebox").html(newHtml + chatItem);
//
//            if(msgCount > 6){
//                var chatContent = document.getElementById ('messagebox');
//                chatContent.scrollTop = chatContent.scrollHeight;
//            }
        };
        websocket.onerror = function (evnt) {
            alert("网络错误");
        };
        websocket.onclose = function (evnt) {
        }

        var msg = JSON.stringify({"type":2});
        websocket.send(msg);


    </script>
    <div class="sidebar-toggle-box">
        <div data-original-title="Toggle Navigation" data-placement="right" class="icon-reorder tooltips"></div>
    </div>
    <!--logo start-->
    <a href="/index" class="logo">Car<span>pool</span></a>
    <!--logo end-->
    <div class="nav notify-row pull-right" id="top_menu">
        <!--  notification start -->
        <ul class="nav top-menu">
            <!-- inbox dropdown start-->
            <li id="header_inbox_bar" class="dropdown">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                    <i class="icon-envelope-alt"></i>
                    <span class="badge bg-important" id = "msgNotify"></span>
                </a>
                <ul class="dropdown-menu dropdown-menu-right extended inbox">
                    <div class="notify-arrow notify-arrow-red"></div>
                    <li>
                        <p class="red" id = "msgCount">You have ${unreadMsgCount} new messages</p>
                    </li>
                    <li id = 'msgWindow'></li>
                    <c:forEach items="${unreadMsg}" var = "li">
                        <li>
                            <a href="#">
                                <span class="photo"><img alt="avatar" src="/static/img/avatar-mini.jpg"></span>
                                <span class="subject">
                                    <span class="from">${li.sender.username}</span>
                                    <span class="time">${li.commenttime}</span>
                                    </span>
                                <span class="message">
                                        ${li.commenttext}
                                    </span>
                            </a>
                        </li>
                    </c:forEach>






                    <li>
                        <a href="#">See all messages</a>
                    </li>
                </ul>
            </li>
            <!-- inbox dropdown end -->
        </ul>
        <!--  notification end -->
    </div>
</header>