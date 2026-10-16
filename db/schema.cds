namespace capadvancedauth;

entity Cliente {
    key ID       : UUID;
        name     : String(100);
        email    : String(100);
        address  : String(100);
        isActive : Boolean;
        pedidos  : Association to many Pedido
                       on pedidos.clienteID = $self;
}

entity Pedido {
    key ID          : UUID;
        isCompleted : Boolean;
        clienteID   : Association to one Cliente;
}
