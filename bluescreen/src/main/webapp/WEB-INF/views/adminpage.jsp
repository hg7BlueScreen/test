<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Responsive Admin & Dashboard</title>
  <link rel="stylesheet" href="/css/main.css">
  <!-- box icon -->
  <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
  <link href = "https://fonts.google.com/specimen/IBM+Plex+Sans+KR?subset=korean&script=Kore" rel="stylesheet" type = "text/css">
  
  <style>
  	.links_name {
  font-family: "IBM Plex Sans KR", sans-serif;
  font-weight: 400;
  font-style: normal;
}

  </style>
</head>
<body>
  <div class="sidebar">
    <div class="logo_details">
      <i class='bx bx-code-alt'></i>
      <div class="logo_name">
        Waste Drugs
      </div>
    </div>
    <ul>
      <li>
        <a href="#">
          <i class='bx bx-bar-chart'></i>
          <span class="links_name">
            통계
          </span>
        </a>
      </li>
      <li>
        <a href="#">
          <i class='bx bx-user'></i>
          <span class="links_name">
            회원정보
          </span>
        </a>
      </li>
      <li>
        <a href="admin_report">
          <i class='bx bx-error-circle'></i>
          <span class="links_name">
            신고관리
          </span>
        </a>
      </li>
      <li>
        <a href="#">
          <i class='bx bx-server' ></i>
          <span class="links_name">
            서버관리
          </span>
        </a>
      </li>
    </ul>
  </div>
  <!-- End Sideber -->
  <section class="home_section">

    
    <div class="details">
      <div class="recent_project">
        <div class="card_header">
          <h2>WDH - Waste Drugs Here</h2>
        </div>
        <table>
          <thead>
            <tr>
              <td>Project Name</td>
              <td>Hours</td>
              <td>Priority</td>
              <td>Members</td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Dropbox Design System</td>
              <td>34</td>
              <td>
                <span class="badge bg_worning">
                  Meduim
                </span>
              </td>
              <td>
                <span class="img_group">
                  <img src="img/avatar-2.jpg" alt="">
                </span>
                <span class="img_group">
                  <img src="img/avatar-3.jpg" alt="">
                </span>
                <span class="img_group">
                  <img src="img/avatar-4.jpg" alt="">
                </span>
                <span class="img_group">
                  <span class="initial">+5</span>
                </span>
              </td>
            </tr>
            <tr>
              <td>Slack Team UI Design</td>
              <td>47</td>
              <td>
                <span class="badge bg_danger">
                  Higt
                </span>
              </td>
              <td>
                <span class="img_group">
                  <img src="img/avatar-5.jpg" alt="">
                </span>
                <span class="img_group">
                  <img src="img/avatar-2.jpg" alt="">
                </span>
                <span class="img_group">
                  <img src="img/avatar-3.jpg" alt="">
                </span>
                <span class="img_group">
                  <span class="initial">+5</span>
                </span>
              </td>
            </tr>
            <tr>
              <td>Github Satellite</td>
              <td>120</td>
              <td>
                <span class="badge bg_info">
                  Low
                </span>
              </td>
              <td>
                <span class="img_group">
                  <img src="img/avatar-4.jpg" alt="">
                </span>
                <span class="img_group">
                  <img src="img/avatar-5.jpg" alt="">
                </span>
                <span class="img_group">
                  <img src="img/avatar-2.jpg" alt="">
                </span>
                <span class="img_group">
                  <span class="initial">+1</span>
                </span>
              </td>
            </tr>
            <tr>
              <td>3D character Moddelling</td>
              <td>89</td>
              <td>
                <span class="badge bg_worning">
                  Meduim
                </span>
              </td>
              <td>
                <span class="img_group">
                  <img src="img/avatar-3.jpg" alt="">
                </span>
                <span class="img_group">
                  <img src="img/avatar-4.jpg" alt="">
                </span>
                <span class="img_group">
                  <img src="img/avatar-5.jpg" alt="">
                </span>
                <span class="img_group">
                  <span class="initial">+5</span>
                </span>
              </td>
            </tr>
            <tr>
              <td>Web app Design System</td>
              <td>108</td>
              <td>
                <span class="badge bg_seccuss">
                  Track
                </span>
              </td>
              <td>
                <span class="img_group">
                  <img src="img/avatar-2.jpg" alt="">
                </span>
                <span class="img_group">
                  <img src="img/avatar-3.jpg" alt="">
                </span>
                <span class="img_group">
                  <img src="img/avatar-4.jpg" alt="">
                </span>
                <span class="img_group">
                  <span class="initial">+5</span>
                </span>
              </td>
            </tr>
            <tr>
              <td>Github Event Design</td>
              <td>120</td>
              <td>
                <span class="badge bg_info">
                  Low
                </span>
              </td>
              <td>
                <span class="img_group">
                  <img src="img/avatar-5.jpg" alt="">
                </span>
                <span class="img_group">
                  <img src="img/avatar-2.jpg" alt="">
                </span>
                <span class="img_group">
                  <img src="img/avatar-3.jpg" alt="">
                </span>
                <span class="img_group">
                  <span class="initial">+1</span>
                </span>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      </div>
      
  </section>

  <script>
    let sidebar = document.querySelector(".sidebar");
    let closeBtn = document.querySelector("#btn");

    closeBtn.addEventListener("click", () => {
      sidebar.classList.toggle("open");
      // call function
      changeBtn();
    });

    function changeBtn() {
      if(sidebar.classList.contains("open")) {
        closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");
      } else {
        closeBtn.classList.replace("bx-menu-alt-right", "bx-menu");
      }
    }
  </script>
</body>
</html>