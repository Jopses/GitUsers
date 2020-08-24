import GitUsersCore

let tool = GitUsers()

do {
    try tool.run()
} catch {
    print("Whoops! An error occurred: \(error)")
}
