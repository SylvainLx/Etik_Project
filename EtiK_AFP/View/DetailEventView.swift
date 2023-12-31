//
//  DetailEventView.swift
//  EtiK_AFP
//
//  Created by apprenant62 on 23/10/2023.
//

import SwiftUI
import MapKit

struct DetailEventView: View {
   
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
   
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        Button("Retour") {
                    dismiss()
                }
        
        ZStack{
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.beige)
            
            VStack{
                Text("Event 1")
                    .font(.custom("Italiana", size: 30))
                Text("Ville Y adresse 1 rue X")
                    .font(.custom("LibreFranklin", size: 20))
                    .multilineTextAlignment(.leading)
                
                Text("8h30 - 19h30 Vendredi -Samedi-Dimanche")
                    .font(.custom("LibreFranklin", size: 20))
                
                Text("Détail détail etc...")
                    .font(.custom("LibreFranklin", size: 15))
                    .multilineTextAlignment(.leading)
                
                HStack{
                    Button{
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(.marron)
                                .frame(width: 146, height: 50)
                            Text("Appeler")
                                .foregroundStyle(.white)
                                .font(.custom("Italiana", size: 20))
                        }
                    }
                    Button{
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(.marron)
                                .frame(width: 146, height: 50)
                            Text("S'inscrire")
                                .foregroundStyle(.white)
                                .font(.custom("Italiana", size: 20))
                        }
                    }
                }
                
                Map{
                    Marker("Event 1", coordinate:  CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275))
                }
                            .frame(width: 400, height: 550)
                
                
            }
        }
        
    }
}

#Preview {
    DetailEventView()
}
