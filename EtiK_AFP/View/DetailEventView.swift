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
    
    @EnvironmentObject var dataFilter : DataFilterModel
    
    @Environment(\.dismiss) var dismiss
    
    var index : Int
    
    var body: some View {
        
        Button("Retour") {
            dismiss()
        }
        
        ZStack{
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.beige)
            
            VStack{
                Text(dataFilter.eventRequest.allEvents[index].name)
                    .font(.custom("Italiana", size: 30))
                Text(dataFilter.eventRequest.allEvents[index].adress)
                    .font(.custom("LibreFranklin", size: 20))
                    .multilineTextAlignment(.leading)
                
                Text(dataFilter.eventRequest.allEvents[index].date)
                    .font(.custom("LibreFranklin", size: 20))
                
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
                    Marker(dataFilter.eventRequest.allEvents[index].name, coordinate: dataFilter.eventRequest.allEvents[index].coordinate ?? CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275))
                }
            }
        }
    }
}

//#Preview {
//    DetailEventView()
//        .environmentObject(DataFilterModel())
//}
