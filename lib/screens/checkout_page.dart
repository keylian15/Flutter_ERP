import 'package:flutter/material.dart';
import '../services/cart_manager.dart';

class CheckoutPage extends StatefulWidget {
  final CartManager cartManager;

  const CheckoutPage({Key? key, required this.cartManager}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Controllers pour le formulaire de paiement
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _paypalEmailController = TextEditingController();

  String _paymentMethod = 'creditCard'; // Par défaut, la carte bancaire

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finaliser la commande'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Formulaire Nom, Prénom, Adresse, Email, Téléphone
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Nom',
                          labelStyle: const TextStyle(color: Colors.teal),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.teal, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.teal, width: 2),
                          ),
                        ),
                        validator: (value) => value!.isEmpty ? 'Champ requis' : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _surnameController,
                        decoration: InputDecoration(
                          labelText: 'Prénom',
                          labelStyle: const TextStyle(color: Colors.teal),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.teal, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.teal, width: 2),
                          ),
                        ),
                        validator: (value) => value!.isEmpty ? 'Champ requis' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Adresse',
                    labelStyle: const TextStyle(color: Colors.teal),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.teal, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.teal, width: 2),
                    ),
                  ),
                  validator: (value) => value!.isEmpty ? 'Champ requis' : null,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.teal),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.teal, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.teal, width: 2),
                          ),
                        ),
                        validator: (value) => value!.isEmpty ? 'Champ requis' : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Téléphone',
                          labelStyle: const TextStyle(color: Colors.teal),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.teal, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.teal, width: 2),
                          ),
                        ),
                        validator: (value) => value!.isEmpty ? 'Champ requis' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Choix du mode de paiement
                Row(
                  children: [
                    Radio<String>(
                      value: 'creditCard',
                      groupValue: _paymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _paymentMethod = value!;
                        });
                      },
                    ),
                    const Text('Carte bancaire'),
                    const SizedBox(width: 20),
                    Radio<String>(
                      value: 'paypal',
                      groupValue: _paymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _paymentMethod = value!;
                        });
                      },
                    ),
                    const Text('PayPal'),
                  ],
                ),

                // Formulaire de paiement : Carte Bancaire
                if (_paymentMethod == 'creditCard') ...[
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _cardNumberController,
                    decoration: InputDecoration(
                      labelText: 'Numéro de carte',
                      labelStyle: const TextStyle(color: Colors.teal),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.teal, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.teal, width: 2),
                      ),
                    ),
                    validator: (value) => value!.isEmpty ? 'Champ requis' : null,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _expiryDateController,
                          decoration: InputDecoration(
                            labelText: 'Date d\'expiration',
                            labelStyle: const TextStyle(color: Colors.teal),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.teal, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.teal, width: 2),
                            ),
                          ),
                          validator: (value) => value!.isEmpty ? 'Champ requis' : null,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _cvvController,
                          decoration: InputDecoration(
                            labelText: 'CVV',
                            labelStyle: const TextStyle(color: Colors.teal),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.teal, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.teal, width: 2),
                            ),
                          ),
                          validator: (value) => value!.isEmpty ? 'Champ requis' : null,
                        ),
                      ),
                    ],
                  ),
                ],

                // Formulaire de paiement : PayPal
                if (_paymentMethod == 'paypal') ...[
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _paypalEmailController,
                    decoration: InputDecoration(
                      labelText: 'Email PayPal',
                      labelStyle: const TextStyle(color: Colors.teal),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.teal, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.teal, width: 2),
                      ),
                    ),
                    validator: (value) => value!.isEmpty ? 'Champ requis' : null,
                  ),
                ],

                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Commande confirmée'),
                            content: const Text('Votre commande a été enregistrée avec succès!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  widget.cartManager.clear();
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Commander', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
