<?php

    session_start();
    session_unset();
    session_destroy();

    include("_header.html");
    include("_closedsession.html"); 
    include("_footer.html");

?>