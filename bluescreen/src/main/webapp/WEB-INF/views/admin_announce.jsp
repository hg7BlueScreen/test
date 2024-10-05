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
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
	$(function(){
		$("#logoImage").click(function(){
			location.href = "/";
		}); // logoImage
	}); // jquery
</script>
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
      <img src = "/image/team.png" width = "50px" id = "logoImage">
      <div class="logo_name">
        Waste Drugs
      </div>
    </div>
    <ul>
      <li>
        <a href="announceWrite">
          <i class='bx bx-bar-chart'></i>
          <span class="links_name">
            공지사항 작성
          </span>
        </a>
      </li>
      <li>
        <a href="admin_user">
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
        <a href="admin_update">
          <i class='bx bx-revision'></i>
          <span class="links_name">
            업데이트
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
 			<canvas id = "myChart"></canvas>
      </div>
      </div>
      
  </section>
<script>
  const ctx = document.getElementById('myChart');

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
      datasets: [{
        label: '# of Votes',
        data: [12, 19, 3, 5, 2, 3],
        backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(32, 151, 56, 0.31)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(156, 86, 33, 0.36)'
        ],
        borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(32, 151, 56, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(156, 86, 33, 1)'
        ],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
</script>
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
  <%@include file = "/board/announceList" %>
</body>
</html>