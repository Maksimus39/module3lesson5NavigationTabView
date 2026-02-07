import SwiftUI

struct NavigationViewComponent: View {
    @State  var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                ForEach(0...10, id: \.self) { page in
                    Button {
                        path.append(page)
                    } label: {
                        Text("page \(page)")
                    }
                }
            }
            .navigationDestination(for: Int.self) { page in
                DetailsView(pageNumber: page, path: $path)
            }
        }
    }
}

struct DetailsView: View {
    var pageNumber: Int
    @Binding var path: NavigationPath
    
    init(pageNumber: Int, path: Binding<NavigationPath>) {
        self.pageNumber = pageNumber
        self._path = path
        print(pageNumber)
    }
    
    var body: some View {
        VStack {
            Text("pageNumber: \(pageNumber)")
                .font(.largeTitle)
            
            Button {
                path.removeLast()
            } label: {
                Text("Back")
            }
            
        }
        .navigationTitle("Page \(pageNumber)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationViewComponent()
        .preferredColorScheme(.light)
}
