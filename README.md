# MVP (Model-View-Presenter)

![MVP](https://user-images.githubusercontent.com/5318790/121176641-e1cd7780-c875-11eb-9d05-ba1555519688.png)


1. Presenter -> `Presenter.swift`
2. View -> `UsersViewController.swift`
3. Model -> `User.swift`


- Presenter is responsible for calling get users API and pass to view
- View is responsible for display data
- Communicatin between presenter and view is done by protocol named *UserPresenterDelegate*
