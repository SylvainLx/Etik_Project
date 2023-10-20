//
//  RGPDView.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 20/10/2023.
//

import SwiftUI

struct RGPDView: View {
    var body: some View {
        ScrollView {
            
      
        VStack(spacing: 16) {
            Text("Protection des données")
                .font(.custom("Italiana", size: 24))
            Text("""
                Chez Créations, nous nous soucions profondément de la protection de vos données personnelles. Cette politique de protection des données explique comment nous collectons, utilisons, partageons et protégeons vos informations personnelles lorsque vous utilisez notre application. Veuillez prendre le temps de lire attentivement cette politique afin de comprendre comment nous traitons vos données.
                    
                    Collecte de Données
                Nous collectons certaines informations personnelles lorsque vous utilisez notre application, telles que :
                 - Les informations de votre compte, telles que votre nom, adresse e-mail et numéro de téléphone.
                 - Les informations de paiement que vous fournissez lors de l'achat de produits.
                 - Les informations que vous partagez volontairement avec nous, telles que vos préférences et commentaires.
                 
                    Utilisation des Données
                Nous utilisons vos données personnelles pour les finalités suivantes :
                 - Traitement de vos commandes et livraison de produits.
                 - Personnalisation de votre expérience d'achat.
                 - Amélioration de notre application et de nos services.
                 - Communication avec vous concernant des offres spéciales, des promotions et des mises à jour.
                 - Réponse à vos questions et préoccupations.
                 
                    Partage des Données
                Nous ne vendons ni ne louons vos données personnelles à des tiers. Cependant, nous pouvons partager vos informations dans les cas suivants :
                 - Avec des prestataires de services tiers pour vous fournir des services, tels que la livraison.
                 - Lorsque requis par la loi ou pour répondre à des obligations légales.
                 - Pour protéger nos droits, notre propriété et la sécurité de nos utilisateurs.
                 
                    Sécurité des Données
                Nous prenons des mesures pour protéger vos données personnelles contre la perte, la mauvaise utilisation, l'accès non autorisé et la divulgation. Vos informations sont stockées de manière sécurisée et nous utilisons des protocoles de sécurité pour assurer leur confidentialité.
                 
                    Vos Choix
                Vous avez le contrôle sur vos données personnelles. Vous pouvez mettre à jour, corriger ou supprimer vos informations en accédant à votre profil. Vous pouvez également gérer vos préférences de communication.
                    
                    Contactez-nous
                Si vous avez des questions concernant notre politique de protection des données ou si vous souhaitez exercer vos droits en matière de protection des données, n'hésitez pas à nous contacter.
                Merci de nous avoir choisi. Votre confiance est précieuse pour nous, et nous nous engageons à protéger vos données personnelles et à vous offrir une expérience de shopping sécurisée et agréable.
                """)
            .padding()
                .font(.custom("LibreFranklin", size: 16))
            
        }
        }
       
    }
}

#Preview {
    RGPDView()
}
