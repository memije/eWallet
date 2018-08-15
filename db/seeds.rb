# Create transaction types catalog
TransactionType.create([
                           {name: 'Fondeo de wallet'},
                           {name: 'Transferencia a wallet'},
                           {name: 'Transferencia a tarjeta de débito'}
                       ])

# Create card types catalog
CardType.create([
                    {name: 'Débito'},
                    {name: 'Crédito'}
                ])

# First customer seed
wallet = Wallet.create
customer = Customer.create(name: "Wallet General", email: "correo@correo.com", wallet: wallet, password: "12345678", password_confirmation: "12345678")
card = Card.create(card_name: (0..9).to_a.shuffle[0,8].join, expiration_date: "12/22", customer: customer, card_type: CardType.find(1))
# transaction = TransactionHistory.create(amount: 100, wallet: wallet, transaction_type: TransactionType.find(1), complete: true)

# Second customer seed
wallet2 = Wallet.create
customer2 = Customer.create(name: "Usuario de Prueba", email: "correo2@correo.com", wallet: wallet2, password: "12345678", password_confirmation: "12345678")

# Add second customer's wallet to first customer catalog
customer_wallet = CustomerWallet.create(customer: customer, wallet: wallet2)