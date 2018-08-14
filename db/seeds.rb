# Create transaction types catalog
TransactionType.create([
                           {name: 'Fondeo de wallet'},
                           {name: 'Transferencia a wallet'},
                           {name: 'transferencia a tarjeta de débito'}
                       ])

# Create card types catalog
CardType.create([
                    {name: 'Crédito'},
                    {name: 'Débito'}
                ])

# Wallet, customer and card seed
wallet = Wallet.create(balance: 0)
customer = Customer.create(name: "Usuario de Prueba", email: "correo@correo.com", wallet: wallet, password: "12345678", password_confirmation: "12345678")
Card.create(card_name: "4901034914754636", expiration_date: Date.today, customer: customer, card_type: CardType.find(1))