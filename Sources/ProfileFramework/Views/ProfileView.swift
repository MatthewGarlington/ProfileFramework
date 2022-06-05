import SwiftUI
import ComposableArchitecture

public struct ProfileView: View {
    @EnvironmentObject var stackCardViewModel: StackCardViewModel
    @EnvironmentObject var firestoreManager: FirestoreManager
    public let store: Store<ProfileState, ProfileAction>

    public init(store: Store<ProfileState, ProfileAction>) {
        self.store = store
    }
    public var body: some View {
        WithViewStore(self.store) { (viewStore: ViewStore<ProfileState, ProfileAction>) in
        ZStack(alignment: .bottom) {
            ScrollView {
                    ZStack {
                        VStack(spacing: 0) {
                            HStack(alignment: .center) {
                                ProfilePic(circleSize: 90, imageSize: 140)
                                ProfileNameBoard()
                                Spacer()
                            }
                            Spacer()
                            ProfileInfoBar(store: store)
                            ProfileDescription()
                                .padding()
                            VStack(spacing: 20) {
                                FollowersHeader()
                            }
                            
                            ZStack {
                                StackCardView(store: store, post: Post())
                                    .frame(width: 400, height: 375)
                                    .environmentObject(StackCardViewModel())
                                    .padding()
                                StackCardView(store: store, post: Post())
                                    .frame(width: 400, height: 375)
                                    .environmentObject(StackCardViewModel())
                                    .padding()
                                StackCardView(store: store, post: Post())
                                    .frame(width: 400, height: 375)
                                    .environmentObject(StackCardViewModel())
                                    .padding()
                                StackCardView(store: store, post: Post())
                                    .frame(width: 400, height: 375)
                                    .environmentObject(StackCardViewModel())
                                    .padding()
                            }
                        }
                        .blur(radius: viewStore.state.showPostEdit ? 15 : 0)
                        .onTapGesture {
                            withAnimation {
                                if viewStore.state.showPostEdit {
                                    viewStore.send(.hidePostEdit)
                                    viewStore.send(.deactivate)
                                }
                                
                                if viewStore.state.activate == false {
                                    viewStore.send(.hidePostEdit)
                                }
                            }
                        }
                    }
            }
        }
        .ignoresSafeArea(edges: .bottom)
        }
    }
}

public struct ProfileView_Previews: PreviewProvider {
    static let mockStore = Store(
        initialState: ProfileState(),
        reducer:  profileReducer,
        environment: .cancelRequest
    )
    public static var previews: some View {
        ProfileView(store: mockStore)
            .preferredColorScheme(.dark)
            .environmentObject(StackCardViewModel())
            .environmentObject(FirestoreManager())
    }
}

