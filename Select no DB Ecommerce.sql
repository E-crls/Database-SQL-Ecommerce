-- quantos clientes tenho
select count(*) from clients;

-- clientes com pedidos
select * from cliente c, pedido o where c.idCliente = idOrderClient;

select Fname,Lname, idOrder, orderStatus from cliente c, pedido o where c.idCliente = idOrderClient;
select concat(Fname,' ',Lname) as Client, idOrder as Request, orderStatus as Status from cliente c, pedido o where c.idCliente = idOrderClient;

insert into pedido (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values 
							 (2, default,'compra via aplicativo',null,1);
	
 -- quantos clientes com pedido
select count(*) from cliente c, pedido o 
			where c.idCliente = idOrderClient;

select * from pedido;

-- recuperação de pedido com produto associado
select * from cliente c 
				inner join pedido o ON c.idCliente = o.idOrderClient
                inner join produtOrder p on p.idPOorder = o.idOrder
		group by idCliente; 
        
-- Recuperar quantos pedidos foram realizados pelos clientes?
select c.idCliente, Fname, count(*) as Number_of_orders from cliente c 
				inner join pedido o ON c.idCliente = o.idOrderClient
		group by idCliente; 