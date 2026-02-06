import SwiftUI

struct TabItem: Identifiable {
    let id: String = UUID().uuidString
    var image: String
    var text: String
}

struct ContentView: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var selectedPage: String = "house"
    var pages: [TabItem] = [
        TabItem(image: "house", text: "Home"),
        TabItem(image: "message", text: "Messages"),
        TabItem(image: "person", text: "Profile"),
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedPage) {
                FirstPage()
                    .tag("house")
                SecondPage()
                    .tag("message")
                ThreePage()
                    .tag("person")
            }
            
            HStack {
                ForEach(pages) { page in
                    TabItemView(
                        page: page,
                        selectedPage: $selectedPage
                    )
                }
            }
            .padding()
            .background(.gray.opacity(0.2))
            .clipShape(Capsule())
            .padding(.horizontal)
        }
    }
}

struct TabItemView: View {
    let page: TabItem
    @Binding var selectedPage: String
    
    var body: some View {
        Button {
            selectedPage = page.image
        } label: {
            HStack {
                Image(systemName: page.image)
                    .font(.system(size: 20))
                selectedPage == page.image
                    ? Text(page.text)
                    : Text("")
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .foregroundColor(selectedPage == page.image ? .green : .gray)
            .background(selectedPage == page.image ? .red : .clear)
            .cornerRadius(20)
        }
    }
}

struct FirstPage: View {
    var body: some View {
        ScrollView {
            VStack {
                Rectangle()
                    .fill(.cyan)
                    .frame(height: 500)
                Spacer()
                Rectangle()
                    .fill(.yellow)
                    .frame(height: 500)
            }
        }
    }
}

struct SecondPage: View {
    var body: some View {
        Text("Messages Page")
            .font(.largeTitle)
    }
}

struct ThreePage: View {
    var body: some View {
        Text("Profile Page")
            .font(.largeTitle)
    }
}

#Preview {
    ContentView()
}
