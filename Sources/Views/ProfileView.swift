import SwiftUI

public struct ProfileView: View {
    @EnvironmentObject var stackCardViewModel: StackCardViewModel
    @State private var profileSelected = true
    @State private var feedIsSelected = false
    @State private var showPostEdit = false
    @State private var activate = false
    @State private var longPressed = false
    @State private var show = false
    public init() { }
    public var body: some View {
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
                            ProfileInfoBarView()
                            ProfileDescription()
                                .padding()
                            VStack(spacing: 20) {
                                FollowersHeader()
                            }
                            
                            ZStack {
                                StackCardView(post: Post(name: "Matthew Garlington", post: "This is post one ofijreiogjosdjfgoijdoigjsodfgjoisdjfgofidsjgsoidgfndoisfgoisgoidgfoginsdfgodnsgodisgnoidnfgoidnsgoinzgongdfons", profilePic: ""), longPressed: $longPressed, show: $show, showComment: false)
                                    .frame(width: 400, height: 375)
                                    .environmentObject(StackCardViewModel())
                                    .padding()
                                StackCardView(post: Post(name: "Matthew Garlington", post: "This is post two, lets see where it goes....gjojgoj ojfojgodfjgojdojdgojgdojodjgojdgo  fdg fe g gfgdfgsdgdfsgfdsgdsfggdgd  sdfg dfg df gj", profilePic: ""), longPressed: $longPressed, show: $show, showComment: false)
                                    .frame(width: 400, height: 375)
                                    .environmentObject(StackCardViewModel())
                                    .padding()
                            }
                        }
                        .blur(radius: showPostEdit ? 15 : 0)
                        .onTapGesture {
                            withAnimation {
                                if showPostEdit {
                                    showPostEdit = false
                                    activate = false
                                }
                                
                                if activate == false {
                                    showPostEdit = false
                                }
                            }
                        }
                    }
            }
        }
        .ignoresSafeArea()
    }
}

public struct ProfileView_Previews: PreviewProvider {
    public static var previews: some View {
        ProfileView()
            .preferredColorScheme(.dark)
            .environmentObject(StackCardViewModel())
    }
}

