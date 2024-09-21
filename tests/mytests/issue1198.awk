BEGIN { $0="5.0 10.0"; print ($1 < $2) }
BEGIN { $0="5.0 -10.0"; print ($1 < $2) }
