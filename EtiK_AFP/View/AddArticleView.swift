//
//  AddArticleView.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 02/11/2023.
//

import SwiftUI

extension Formatter {
    static let valueFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minusSign   = " - "  // Just for fun!
        formatter.zeroSymbol  = ""     // Show empty string instead of zero
        return formatter
    }()
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

struct AddArticleView: View {
    
    @EnvironmentObject var post: DataFilterModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var categories: [String] = ["Made in France", "Vegan", "Biologique", "Naturel", "Upcycling"]
    @State var selectedCategories: [String] = []
    @State var isCategory:Bool = false
    
    @State var sizes = ["XS", "S", "M", "L", "XL"]
    @State var selectedSizes: [String] = []
    @State var isSize:Bool = false
    
    @State var result:String = ""

    
    @State var produit = Product (
        id: "1000",
        name: String(),
        photo: [EtiK_AFP.DataBaseImage(id: "attFGlaNPr8lkF9mg", width: 5536, height: 4160, url: "https://v5.airtableusercontent.com/v2/22/22/1699012800000/dlro4yB_Ftig34opRUCaJA/tzehvjACQx46wPrew3gjMBljnv4Frd9gZncYxulsdoxH6Isn0v_rN-j23rCpZSHswwD9uOgvsf_GkMeYleics4m0vFsEC3QBGWYOgnSFiGcqSAMDsMQjI1lzQ5vX5UOI3XKPPbGgi1f7LRm5D3oiZ4lPJKv_u7AL29770wl9n3WAO78kFqL90cFuviDOCzX7/N__OMr4v-37kgs0j_MT7tStgAVCxDBdmJiyqhUFiTTo", filename: "mediamodifier-JskqEILt-ds-unsplash.jpg", size: 2228815, type: "image/jpeg", thumbnails: Optional(EtiK_AFP.Thumbails(small: EtiK_AFP.Full(url: "https://v5.airtableusercontent.com/v2/22/22/1699012800000/F1jCPo6KOd_uUBNsUyeX-g/0L_8JW3d_F_zIvBxCqkRbY9YnElJQZJLKdAZacyscpikRD0_luFvsZ7T2B4xCe-PvjETAJsqsTqPffPgmeN5kyMzH5r_4zikDDUB7R8kjTlIP6jtSIDpYmsWbEpRWXev3dXHvoKpdKyAtpadW1lbUw/PakYHk5sAOYVfgpGEvtmnUwPOyR3kJMfL-65Z44SqLw", width: 48, height: 36), large: EtiK_AFP.Full(url: "https://v5.airtableusercontent.com/v2/22/22/1699012800000/ZbDcM2MF1vBfp9r88twLdQ/CWKcYh7TQvnx3Aq-pBiQ_ZohIjIZcQkWEFpjMCYEarZP6XLqL_bRlWo_IPiYzlwSOVwCMadeV8-ITVsCqVaLn5tURiGo4STYbASzQtk9PAWqPU3zhFTSE7hf3rldaoQw8XnQ8DMiq6bz7ObOudMKuA/sLOz7owubkgP-Sscq1vzA3QRzBfZ00X4GU4Szi8ZPLI", width: 681, height: 512), full: EtiK_AFP.Full(url: "https://v5.airtableusercontent.com/v2/22/22/1699012800000/ABS3cYX4tKH_wZ6utCzGJQ/pB-ZYaxSxHacqaNf8pL_5j385i8JhG2obMCu1y0NxW8KatSyIx6keOxf6qYN10GVhC1tihFQRYtN-4eEDvApwGX0ru7zr2EpXjNIbyhHvUfRICdXs3-RcBAcU-kAJ130MSVl1bOrmSsF5f2TQQbZ9w/4A4v2ehZhx5mUJAzO8KSeXiqhigiQtqxrIu-E_mdKDI", width: 3000, height: 2254))))],
        description: String(),
        category: [String](),
        price: Double(),
        sizes: [String](),
        quantity: Int(),
        collection: [""],
        transactions2: ["01"],
        creator: ["573"],
        idFromCreator: ["573"],
        url: "https://i.imgur.com/6Ctf35R.png"
    )
    
    let productRecord: Product =
    //= ProductRecord (
//        id: "1051",
//        createdTime: "", // Vous pouvez laisser cette valeur vide ou assigner une date si nécessaire
//        fields:
    Product (
            id: "1051",
            name: "T-Shirt",
            photo: [
                DataBaseImage(
                    id: "imageID",
                    width: 800,
                    height: 600,
                    url: "https://i.imgur.com/6Ctf35R.png",
                    filename: "image.jpg",
                    size: 123456,
                    type: "image/jpeg",
                    thumbnails:  EtiK_AFP.Thumbails(
                        small: EtiK_AFP.Full(url: "https://i.imgur.com/6Ctf35R.png", width: 21, height: 36),
                        large: EtiK_AFP.Full(url: "https://i.imgur.com/6Ctf35R.png", width: 512, height: 884),
                        full: EtiK_AFP.Full(url: "https://i.imgur.com/6Ctf35R.png", width: 736, height: 1271)
                    )
                )
            ],
            description: "Description du produit",
            category: ["Vegan"],
            price: 19.99,
            sizes: ["S", "M", "L"],
            quantity: 5,
            collection: ["Printemps/Eté"],
            transactions2: ["01"],
            creator: ["573"],
            idFromCreator: ["573"],
            url: "https://i.imgur.com/6Ctf35R.png"
        )
  //  )
    
    
    var body: some View {
        
        VStack {
            
            ZStack {
                RadialGradient(stops: [
                    .init(color: Color(.beige), location: 0.3),
                    .init(color: Color(.white), location: 0.3),
                ], center: .top, startRadius: 100, endRadius: 600)
                .ignoresSafeArea()
                
                VStack {
                    TitleCard(title: "Ajouter un produit ")
                    
                    Spacer()
                    
                    HStack {
                        ForEach(1...3, id: \.self) { index in
                            ZStack(alignment: .bottom) {
                                
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 30)
                                        .frame(width: 100, height: 150)
                                        .padding(.bottom, 15)
                                        .foregroundColor(.darkBeige)
                                    Text("Photo \(index)")
                                        .foregroundColor(.white)
                                        .font(.custom("Libre Franklin", size: 15))
                                }
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "pencil.circle.fill")
                                        .resizable()
                                        .foregroundColor(.marron)
                                        .background(.white)
                                        .clipShape(Circle())
                                        .frame(width: 30, height: 30)
                                        .overlay(Circle()
                                            .stroke(.white, lineWidth: 2))
                                }
                                
                            }
                        }
                    }
                    
                }
            }
        }.frame(width: 400, height: 250)
        
        
        ScrollView {
            VStack  {
                 
                TextField("Nom du produit", text: $produit.name)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.beige, lineWidth: 2)
                            .frame(height: 40)
                    ).padding(.horizontal)
                
                TextField("Collection", text: $produit.collection[0])
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.beige, lineWidth: 2)
                            .frame(height: 40)
                    ).padding(.horizontal)
                
                TextField("Description", text: $produit.description, axis: .vertical)
                
                    .padding()
                    .lineLimit(3, reservesSpace: true)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.beige, lineWidth: 2)
                    ).padding(.horizontal)
                
                HStack {
                    
                    TextField("Prix en €", value: $produit.price, formatter: Formatter.valueFormatter)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.beige, lineWidth: 2)
                                .frame(height: 40)
                        )
                    
                    
                    
                    TextField("Quantité", value: $produit.quantity, formatter: Formatter.valueFormatter)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.beige, lineWidth: 2)
                                .frame(height: 40)
                        )
                    
                    
                }.padding(.horizontal)
                
                VStack(alignment: .leading) {
                    
                    HStack(spacing: 50) {
                        Text("Categorie(s)")
                            .font(.custom("Libre Franklin", size: 20))
                        Spacer()
                        Button(action: {
                            isCategory.toggle()
                        }) {
                            Image(systemName: isCategory ? "minus.circle.fill" : "plus.circle.fill")
                                .resizable()
                                .foregroundColor(.marron)
                                .background(.white)
                                .clipShape(Circle())
                                .frame(width: 20, height: 20)
                                .overlay(Circle()
                                    .stroke(.white, lineWidth: 2))
                            
                        }
                    }.padding(.horizontal)
                    
                    
                    
                    if isCategory {
                        
                        List {
                            ForEach(self.categories, id: \.self) { item in
                                
                                MultipleSelectionRow(title: item, isSelected: self.selectedCategories.contains(item)) {
                                    if self.selectedCategories.contains(item) {
                                        self.selectedCategories.removeAll(where: { $0 == item })
                                    }
                                    else {
                                        self.selectedCategories.append(item)
                                        produit.category = selectedCategories
                                    }
                                }
                                
                            }
                        }.listStyle(PlainListStyle())
                            .frame(height: 150)
                            .padding()
                            .font(.custom("Libre Franklin", size: 15))
                        
                    }
                    
                    
                    HStack(spacing: 50) {
                        Text("Taille(s)")
                            .font(.custom("Libre Franklin", size: 20))
                        Spacer()
                        Button(action: {
                            isSize.toggle()
                        }) {
                            Image(systemName: isSize ? "minus.circle.fill" : "plus.circle.fill")
                                .resizable()
                                .foregroundColor(.marron)
                                .background(.white)
                                .clipShape(Circle())
                                .frame(width: 20, height: 20)
                                .overlay(Circle()
                                    .stroke(.white, lineWidth: 2))
                            
                        }
                    }.padding(.horizontal)
                    
                    
                    if isSize {
                        
                        List {
                            ForEach(self.sizes, id: \.self) { item in
                                
                                MultipleSelectionRow(title: item, isSelected: self.selectedSizes.contains(item)) {
                                    if self.selectedSizes.contains(item) {
                                        self.selectedSizes.removeAll(where: { $0 == item })
                                    }
                                    else {
                                        self.selectedSizes.append(item)
                                        produit.sizes = selectedSizes
                                    }
                                }
                                
                            }
                        }.listStyle(PlainListStyle())
                            .frame(height: 150)
                            .padding()
                            .font(.custom("Libre Franklin", size: 15))
                        
                    }
                    
                }
                .frame(width: 380)
                .padding(.vertical)
                
                Button(action: {
                    Task {
                        result = await post.productsRequest.postProducts(product: productRecord)
                        print(result)
                    }
                   // presentationMode.wrappedValue.dismiss() // Ferme la vue actuelle
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.marron)
                            .frame(width: 300, height: 50)
                        Text("Enregistrer")
                            .foregroundColor(.white)
                    }
                }
                
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Ferme la vue actuelle
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.red)
                            .frame(width: 300, height: 50)
                        Text("Annuler")
                            .foregroundColor(.white)
                    }
                }.font(.custom("Libre Franklin", size: 16))

                
            }
        }.padding(.bottom)
        
        
        
    }
}

#Preview {
    AddArticleView()
        .environmentObject(DataFilterModel())
}
