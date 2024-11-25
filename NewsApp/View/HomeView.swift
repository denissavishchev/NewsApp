import SwiftUI

struct HomeView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                Text("Top News")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 12){
                        ForEach(vm.topNews, id: \.url) { article in
                            TopArticleView(article: article)
                        }
                    }
                    .padding(.horizontal)
                }
                .shadow(color: .black.opacity(0.2), radius: 8, x: 5, y: 8)
                Text("Bottom News")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 12){
                        ForEach(vm.bottomNews, id: \.url) { article in
                            BottomArticleView(article: article)
                        }
                    }
                    .padding(.horizontal)
                }
                .shadow(color: .black.opacity(0.2), radius: 8, x: 5, y: 8)
            }
            .background(.secondary.opacity(0.3))
            .refreshable {
                vm.fetchBottomNews()
                vm.fetchTopNews()
            }
        }
    }
}

#Preview {
    HomeView()
}
