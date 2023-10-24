import SwiftUI

struct Bubble: View {
    let text: String

    var body: some View {
        ZStack {
            BubbleShape()
                .stroke(Color.white, lineWidth: 2) // Ligne blanche autour de la bulle
                .background(
                    BubbleShape()
                        .fill(Color.white) // Remplissage blanc de la bulle
                        .shadow(color: Color.black, radius: 4, x: 0, y: 0) // Ombre
                )

            Text(text)
                .multilineTextAlignment(.center)
                .padding(10)
        }
        .frame(width: 50, height: 100) // Ajustez la taille de la bulle
    }
}

struct BubbleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let tailWidth: CGFloat = 20.0 // Largeur de la queue

        // Créer la queue (triangle) qui pointe vers le bas
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX - (tailWidth / 2), y: rect.minY + tailWidth))
        path.addLine(to: CGPoint(x: rect.midX + (tailWidth / 2), y: rect.minY + tailWidth))
        path.closeSubpath()

        // Créer le rectangle de la bulle
        path.addRoundedRect(in: CGRect(x: rect.minX, y: rect.minY + tailWidth, width: rect.width, height: rect.height - tailWidth), cornerSize: CGSize(width: 20, height: 20))

        return path
    }
}

struct Bubble_Previews: PreviewProvider {
    static var previews: some View {
        Bubble(text: "Ceci est une info-bulle")
    }
}
