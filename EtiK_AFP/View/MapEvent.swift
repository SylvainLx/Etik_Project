//
//  MapView.swift
//  GitHubExercice
//
//  Created by test on 24/10/2023.
//

import SwiftUI
import MapKit



//Toujours dans un soucis de lisibilité et de séparation de block de code j'utilise des extensions.

//Ici ma position perso
extension CLLocationCoordinate2D {
    static let Paris = CLLocationCoordinate2D(
        latitude: 46.227638, longitude: 1.213749
    )
}
//Le niveau de zoom et le périmètre
extension MKCoordinateRegion {
    static let userRegion = MKCoordinateRegion(center: .Paris, latitudinalMeters: 600000, longitudinalMeters: 700000)
}

//###################################################################
//Requête pour avoir les points d'interêts qu'on appelle de manière naturel (ex: resto, monuments)
extension MapView {
    func searchPlaces()  {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search //variable textfield
        request.resultTypes = .pointOfInterest
        request.region = .userRegion // La static var dans mon extension MKCoordinateRegion

        //Async
        Task {
            let result = try? await MKLocalSearch(request: request).start()
            self.result = result?.mapItems ?? []
            //print("Results:", result)
        }
    }
}
//###################################################################

struct MapView: View {
    //Instance de notre class
    @StateObject var locationManager = LocationManager()
    
    @State private var userLocation: MapCameraPosition = .region(.userRegion) //Permet d'afficher notre position
    @State private var search = ""
   
    @State private var result = [MKMapItem]() //tableau vide pour nos pts d'intérêts
    @State private var selection: MKMapItem? //Permet de notifier la selection d'un point d'intérêt
    @State private var filteredPointsOfInterest: [PointOfInterest] = []

    @State private var isSearching = false
    
    @EnvironmentObject var dataFilter : DataFilterModel
    @State private var filteredEvents: [Event] = []
    
    
//    // points d'intérêt pour essayer
//    let pointsOfInterest: [PointOfInterest] = [
//        PointOfInterest(id: 1, name: "Point 1", coordinate: CLLocationCoordinate2D(latitude: 48.879855, longitude: 2.369416)),
//        PointOfInterest(id: 2, name: "Point 2", coordinate: CLLocationCoordinate2D(latitude: 48.878660, longitude: 2.372326)),
//        PointOfInterest(id: 3, name: "Point 3", coordinate: CLLocationCoordinate2D(latitude: 48.878951, longitude: 2.375177)),
//        PointOfInterest(id: 4, name: "Point 4", coordinate: CLLocationCoordinate2D(latitude: 48.877870, longitude: 2.368411)),
//        PointOfInterest(id: 5, name: "Point 5", coordinate: CLLocationCoordinate2D(latitude: 48.876518, longitude: 2.371679))
//    ]
    
    
    var body: some View {
        VStack{
            Spacer()
            
            Map(position: $userLocation, selection: $selection) {
                
                //loop si recherche, affiche le point perso specifique
                UserAnnotation()
//                if isSearching{ //carte vierge sans les points
                ForEach(dataFilter.eventRequest.allEvents) { event in
                        if let coordinate = event.coordinate{
                            Marker(event.name, coordinate: coordinate)
                        }
                    }
 //           }


                //loop pour afficher les demandes de points d'intérêts generique (resto, monuments, etc...)
//                ForEach(result, id:\.self) { item in
//                    let placemark = item.placemark
//                    Marker(placemark.name ?? "", coordinate: placemark.coordinate)
//                }
                
                
            }
            .overlay(alignment: .bottom, content: {
                TextField("Recherche", text: $search)
                    .padding(12)
                    .background(.white)
                    .padding()
            })
            .mapControls {
                MapPitchToggle() //Bouton 3D/2D
                MapUserLocationButton() //recentre sur notre localisation
            }
            //permet d'effectuer la demande de notre textfield une fois appuyer sur entrée
            .onSubmit(of: .text) {
                isSearching = true
                filteredEvents = dataFilter.eventRequest.allEvents.filter { event in
                    return event.name.localizedCaseInsensitiveContains(search)
                }
                // Réaliser la demande de points d'intérêt
                searchPlaces()
                
                // Centrer la carte sur le premier point d'intérêt trouvé
                if let firstMatchingEvent = filteredEvents.first {
                    if let coordinate = firstMatchingEvent.coordinate {
                        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                        userLocation = .region(region)
                    }
                }
            }
            
            //Quand la vue apparait on est notifié de la permission + reinitialisation variable isSearching
            .onAppear(perform: {
                isSearching = false
                locationManager.requestLocation()
            })
            Spacer()
        }
        .onAppear {
            Task {
                dataFilter.eventRequest.allEvents = await dataFilter.eventRequest.fetchedEvent()
                
            }
        }
    }
}

#Preview {
    MapView()
        .environmentObject(DataFilterModel())
}





