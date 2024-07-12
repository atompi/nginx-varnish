vcl 4.0;

import directors;

backend server1 {
    .host = "192.168.1.3";
    .port = "8001";
}

backend server2 {
    .host = "192.168.1.4";
    .port = "8001";
}

sub vcl_init {
    new websrv = directors.round_robin();
    websrv.add_backend(server1);
    websrv.add_backend(server2);
}

sub vcl_recv {
    unset req.http.cookie;
    set req.url = regsub(req.url, "\?.*", "");
    set req.backend_hint = websrv.backend();
}
