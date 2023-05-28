<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="admin.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <div class="sidebar">
                        <h3>Admin Dashboard</h3>
                        <ul>
                            <li>
                                <a href="/YogaCenter/request?action=ManageEmployee">
                                    <i class="fas fa-user icon"></i>
                                    Manage Trainer
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=ManageSchedule">
                                    <i class="fas fa-calendar-alt icon"></i>
                                    Manage Schedule
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=ManageUser">
                                    <i class="fas fa-users icon"></i>
                                    Manage User
                                </a>
                            </li>
                            <li>
                                <a href="/YogaCenter/request?action=adminCourseList">
                                    <i class="fas fa-book icon"></i>
                                    Course List
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
                <div class="col-lg-9">
                    <h2 style="display: flex; justify-content: center; margin-bottom: 20px;">Yoga Center Schedule</h2>
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Time</th>
                                    <th>Monday</th>
                                    <th>Tuesday</th>
                                    <th>Wednesday</th>
                                    <th>Thursday</th>
                                    <th>Friday</th>
                                    <th>Saturday</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Morning 1</td>
                                    <td>
                                        <p>Yoga Class 1</p>
                                        <p>Instructor: John Doe</p>
                                        <button class="btn btn-primary">Details</button>
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <p>Yoga Class 3</p>
                                        <p>Instructor: Michael Johnson</p>
                                        <button class="btn btn-primary">Details</button>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Morning 2</td>
                                    <td></td>
                                    <td>
                                        <p>Yoga Class 5</p>
                                        <p>Instructor: David Wilson</p>
                                        <button class="btn btn-primary">Details</button>
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <p>Yoga Class 7</p>
                                        <p>Instructor: Jessica Brown</p>
                                        <button class="btn btn-primary">Details</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Afternoon 1</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Afternoon 2</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>                             
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
    </body>

</html>