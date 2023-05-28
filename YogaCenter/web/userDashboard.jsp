<!DOCTYPE html>
<html>

    <head>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="user.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <!-- Sidebar -->
                    <div class="sidebar">
                        <h3>User Dashboard</h3>
                        <ul>
                            <li>
                                <a href="/YogaCenter/request?action=ManageAccount">
                                    <i class="fas fa-user icon"></i>
                                    Manage Account
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=Booking">
                                    <i class="fas fa-calendar-alt icon"></i>
                                    Class booking
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=ManageSub">
                                    <i class="fas fa-money-bill"></i>                
                                    Manage subscription
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=ChangePassword">
                                    <i class="fas fa-lock"></i>
                                    Change password
                                </a>
                            </li>
                        </ul>
                        <div class="divider"></div>
                        <h4>Settings</h4>
                        <ul>
                            <li>
                                <a href="/YogaCenter/request?action=Logout">
                                    <i class="fas fa-sign-out-alt icon"></i>
                                    Logout
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
    </body>

</html>